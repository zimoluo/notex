import json
import os
import shutil

CONFIG_NAME = 'build_config.json'
SOURCE_NAME = 'source.cls'
OUT_NAME = 'notex.cls'


class CLSBuilder:
    def __init__(self, config_file=CONFIG_NAME):
        with open(f'./src/{SOURCE_NAME}') as file:
            self.clstext = file.read()

        with open(config_file, 'r') as f:
            self.config = json.load(f)

        self.built = []

    def build(self):
        for build_step in self.config['build_steps']:
            method_name = f"build_{build_step}"
            if hasattr(self, method_name):
                getattr(self, method_name)()
            else:
                print(f"Warning: Build step '{build_step}' not implemented.")

        self.write_output()

    def write_output(self):
        os.makedirs('./dist', exist_ok=True)
        with open(f'./dist/{OUT_NAME}', 'w') as file:
            file.write(self.clstext)

    def build_environments(self):
        environments = []
        for env in self.config['environments']:
            environments.extend([
                self.generate_environment(env),
                self.generate_environment(env, '*'),
                self.generate_environment(env, '**')
            ])
        self.replace_section('ENVIRONMENTS', '\n'.join(environments))

    def build_custom_environment(self):
        custom_envs = [
            f"\\define@key{{custom}}{{header}}{{\\def\\customheader{{#1}}}}\\define@key{{custom}}{{title}}{{\\def\\customtitle{{#1}}}}\\define@key{{custom}}{{color}}{{\\def\\customcolor{{#1}}}}\\define@key{{custom}}{{style}}{{\\def\\customstyle{{#1}}}}",
            self.generate_custom_environment(),
            self.generate_custom_environment('*'),
            self.generate_custom_environment('**'),
        ]
        self.replace_section('CUSTOM_ENVIRONMENT', '\n'.join(custom_envs))

    def build_colors(self):
        color_definitions = []
        for color_name, color_code in self.config.get('colors', {}).items():
            color_definitions.append(
                f"\\definecolor{{{color_name}}}{{HTML}}{{{color_code}}}")

        self.replace_section('COLORS', '\n'.join(color_definitions))

    def replace_section(self, section_name, content):
        start_marker = f"% BEGIN {section_name}"
        end_marker = f"% END {section_name}"
        start = self.clstext.find(start_marker)
        end = self.clstext.find(end_marker)
        if start != -1 and end != -1:
            self.clstext = (
                self.clstext[:start] +
                content +
                self.clstext[end + len(end_marker):]
            )

    def get_common_tcolorbox_options(self, color_content, color_frame, style='box'):
        common_options = [
            "nobeforeafter",
            "after=\\vspace{0.25em}",
            "before=\\vspace{0.8em}",
            f"colback={color_content}",
            "coltitle=black",
            "fonttitle=\\bfseries",
            "top=0.2em",
            "bottom=0.2em",
            "enhanced",
            "opacityframe=0.8",
            "opacityback=0.8",
            "breakable",
            "pad at break*=0.2em",
            "parbox=false"
        ]

        if style == 'box':
            common_options.extend([
                "boxsep=0.45em",
                f"colframe={color_frame}",
                "left=0.2em",
                "right=0.2em"
            ])
        elif style == 'blockquote':
            common_options.extend([
                "boxsep=0.36em",
                f"colframe={color_content}",
                f"borderline west={{0.3em}}{{0pt}}{{{color_frame}}}",
                "left=0.7em",
                "right=0.3em",
                "toprule=2mm"
            ])

        return ', '.join(common_options)

    def generate_environment(self, env, variant=''):
        name = f"{env['name']}{variant}"
        title = env['title']
        color_content = env['colorContent']
        color_frame = env['colorFrame']
        style = env.get('style', 'box')

        if variant == '':
            counter = r'\refstepcounter{thmcounter}'
            section = r' \thesection.\arabic{thmcounter}'
        elif variant == '*':
            counter = ''
            section = ''
        elif variant == '**':
            counter = r'\refstepcounter{thmcounternosection}'
            section = r' \arabic{thmcounternosection}'

        common_options = self.get_common_tcolorbox_options(
            color_content, color_frame, style)
        title_option = f"title={{{title}{section}\\ifx\\\\#1\\\\\\else: #1\\fi}}"

        template = r"""\newenvironment{{{name}}}[1][]{{\par{counter}\begin{{tcolorbox}}[{title_option}, {common_options}]}}{{\end{{tcolorbox}}\par}}"""

        return template.format(name=name, counter=counter, title_option=title_option, common_options=common_options)

    def generate_custom_environment(self, variant=''):
        if variant in ['', '*', '**']:
            counter = r'\refstepcounter{thmcounter}' if variant == '' else (
                r'\refstepcounter{thmcounternosection}' if variant == '**' else '')
            section = r' \thesection.\arabic{thmcounter}' if variant == '' else (
                r' \arabic{thmcounternosection}' if variant == '**' else '')

            box_options = self.get_common_tcolorbox_options(
                r'\customcolor!08', r'\customcolor!25', 'box')
            blockquote_options = self.get_common_tcolorbox_options(
                r'\customcolor!08', r'\customcolor!25', 'blockquote')

            return f"""\\newenvironment{{custom{variant}}}[1][]{{\\par{counter}\\def\\customcolor{{blue}}\\def\\customheader{{Custom}}\\def\\customtitle{{}}\\def\\customstyle{{box}}\\setkeys{{custom}}{{#1}}\\begin{{tcolorbox}}[title={{\\customheader{{{section}}}\\ifx\\customtitle\\empty\\else:{{ \\customtitle}}\\fi}},\\ifstrequal{{\\customstyle}}{{box}}{{{box_options}}}{{{blockquote_options}}}]}}{{\\end{{tcolorbox}}\\par}}"""


def copy_rest_files():
    os.makedirs('./dist', exist_ok=True)

    files_to_copy = ['./src/res', './src/example.tex',
                     './src/main.tex', './src/reference.bib']
    for item in files_to_copy:
        if os.path.isdir(item):
            shutil.copytree(item, os.path.join(
                './dist', os.path.basename(item)))
        else:
            shutil.copy(item, './dist')


def build_main():
    os.makedirs('./dist', exist_ok=True)
    shutil.rmtree('./dist')
    builder = CLSBuilder()
    builder.build()
    copy_rest_files()


if __name__ == '__main__':
    build_main()
