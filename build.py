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
            self.generate_custom_environment(),
            self.generate_custom_environment('*'),
            self.generate_custom_environment('**'),
            self.generate_custom_environment('***'),
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

    def generate_environment(self, env, variant=''):
        name = f"{env['name']}{variant}"
        title = env['title']
        colorContent = env['colorContent']
        colorFrame = env['colorFrame']
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

        common_attrs = f"title={{{title}{section}\\ifx\\\\#1\\\\\\else: #1\\fi}}, nobeforeafter, after=\\vspace{{0.25em}}, before=\\vspace{{0.8em}}, colback={{{colorContent}}}, coltitle=black, fonttitle=\\bfseries, top=0.2em, bottom=0.2em, enhanced, opacityframe=0.8, opacityback=0.8, breakable, pad at break*=0.2em"

        if style == 'box':
            style_attrs = f"boxsep=0.45em, colframe={{{colorFrame}}}, left=0.2em, right=0.2em"
        elif style == 'blockquote':
            style_attrs = f"boxsep=0.36em, colframe={{{colorContent}}}, borderline west={{3.6pt}}{{0pt}}{{{colorFrame}}}, left=0.7em, right=0.3em, toprule=2mm"
        else:
            raise ValueError('Unknown style.')

        template = r"""\newenvironment{{{name}}}[1][]{{\par{counter}\begin{{tcolorbox}}[{common_attrs}, {style_attrs}]}}{{\end{{tcolorbox}}\par}}"""

        return template.format(name=name, counter=counter, common_attrs=common_attrs, style_attrs=style_attrs)

    def generate_custom_environment(self, variant=''):
        if variant in ['', '*', '**']:
            return r"""\NewDocumentEnvironment{{custom{variant}}}{{mmo}}{{\par{counter}\begin{{tcolorbox}}[title={{#1{section}\IfNoValueTF{{#3}}{{}}{{: #3}}}},nobeforeafter, after=\vspace{{0.25em}}, before=\vspace{{0.8em}}, colback=#2!08,colframe=#2!25,coltitle=black,fonttitle=\bfseries,boxsep=0.45em,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=0.8,opacityback=0.8,breakable,pad at break*=0.2em]}}{{\end{{tcolorbox}}\par}}""".format(
                variant=variant,
                counter=r'\refstepcounter{thmcounter}' if variant == '' else (
                    r'\refstepcounter{thmcounternosection}' if variant == '**' else ''),
                section=r' \thesection.\arabic{thmcounter}' if variant == '' else r' \arabic{thmcounternosection}' if variant == '**' else ''
            )
        elif variant == '***':
            return r"""\NewDocumentEnvironment{custom***}{mmmo}{\par\begin{tcolorbox}[title={#1 #3\IfNoValueTF{#4}{}{: #4}}, nobeforeafter, after=\vspace{0.25em}, before=\vspace{0.8em}, colback=#2!08,colframe=#2!25,coltitle=black,fonttitle=\bfseries,boxsep=0.45em,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=0.8,opacityback=0.8,breakable,pad at break*=0.2em]}{\end{tcolorbox}\par}"""


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
