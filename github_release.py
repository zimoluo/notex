import requests
import os
from dotenv import load_dotenv
import shutil
import json
import zipfile
from datetime import datetime, timezone
from build import build_main


def main():
    # Load environment variables
    load_dotenv('.env.local')

    build_main()

    # GitHub credentials and repository details
    GITHUB_TOKEN = os.getenv('GITHUB_TOKEN')
    GITHUB_REPO = os.getenv('GITHUB_REPO')
    GITHUB_API_URL = f'https://api.github.com/repos/{GITHUB_REPO}/releases'

    # Function to check if a tag exists on GitHub
    def tag_exists(tag_name):
        response = requests.get(
            f'https://api.github.com/repos/{GITHUB_REPO}/git/refs/tags/{tag_name}')
        return response.status_code == 200

    # Generate version number
    today = datetime.now(timezone.utc).strftime("%Y%m%d")
    n = 1
    while tag_exists(f'v{today}_{n}'):
        n += 1
    software_version = f'{today}_{n}'

    def create_github_release(tag_name, release_name, description):
        headers = {
            'Authorization': f'token {GITHUB_TOKEN}',
            'Accept': 'application/vnd.github.v3+json'
        }
        payload = {
            'tag_name': tag_name,
            'name': release_name,
            'body': description,
            'draft': False,
            'prerelease': False
        }

        response = requests.post(GITHUB_API_URL, json=payload, headers=headers)

        if response.status_code == 201:
            print("GitHub release created successfully.")
            return response.json()
        else:
            print(f"Failed to create GitHub release: {response.status_code}")
            print(response.json())
            exit(1)

    tag_name = f'v{software_version}'

    description = "This is an automated release. Check the commit history for details."
    description_file_path = './github-release-description.json'

    if os.path.isfile(description_file_path):
        try:
            with open(description_file_path, 'r') as f:
                descriptions = json.load(f)
                if tag_name in descriptions and isinstance(descriptions[tag_name], list):
                    description = '\n'.join(descriptions[tag_name])
        except json.JSONDecodeError:
            print("Error reading JSON file. Using default description.")
        except Exception as e:
            print(f"Unexpected error: {e}. Using default description.")

    # Define the release details
    release_name = f"NoTeX {tag_name}"

    # Create the GitHub release
    release_info = create_github_release(tag_name, release_name, description)

    # Create ./dist directory if it doesn't exist
    os.makedirs('./dist', exist_ok=True)

    # Remove trash files from ./dist
    for root, dirs, files in os.walk('./dist'):
        for file in files:
            if file == '.DS_Store' or file.endswith('.DS_Store'):
                os.remove(os.path.join(root, file))

    # Create a ZIP file of the ./dist directory
    zip_filename = f'notex_{software_version}.zip'
    files_to_include = [
        'example.tex',
        'main.tex',
        'notex.cls',
        'reference.bib',
        os.path.join('res', 'rosslogo.pdf')
    ]
    with zipfile.ZipFile(zip_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for file in files_to_include:
            file_path = os.path.join('./dist', file)
            zipf.write(file_path, os.path.relpath(file_path, './dist'))

    # Function to upload an asset to a GitHub release
    def upload_asset_to_release(upload_url, file_path):
        headers = {
            'Authorization': f'token {GITHUB_TOKEN}',
            'Content-Type': 'application/octet-stream'
        }
        with open(file_path, 'rb') as f:
            response = requests.post(upload_url, headers=headers, data=f)
        if response.status_code == 201:
            print(f"Asset {file_path} uploaded successfully.")
        else:
            print(
                f"Failed to upload asset {file_path}: {response.status_code}")
            print(response.json())

    # Upload the ZIP file to the release
    asset_upload_url = release_info['upload_url'].replace(
        "{?name,label}", f"?name={zip_filename}")
    upload_asset_to_release(asset_upload_url, zip_filename)

    # Remove ./dist folder
    shutil.rmtree('./dist')

    print("Script execution completed.")


if __name__ == '__main__':
    main()
