import json

CONFIG_NAME = 'build_config.json'
SOURCE_NAME = 'source.cls'
OUT_NAME = 'notex.cls'

# TODO: a style option in build config. style include box and blockquote. just saying


class Builder:
    def __init__(self, config_file=CONFIG_NAME):
        with open(SOURCE_NAME) as file:
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
        with open(OUT_NAME, 'w') as file:
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

        if variant == '':
            counter = r'\refstepcounter{thmcounter}'
            section = r' \thesection.\arabic{thmcounter}'
        elif variant == '*':
            counter = ''
            section = ''
        elif variant == '**':
            counter = r'\refstepcounter{thmcounternosection}'
            section = r' \arabic{thmcounternosection}'

        template = r"""\newenvironment{{{name}}}[1][]{{\par{counter}\begin{{tcolorbox}}[title={{{title}{section}\ifx\\#1\\\else: #1\fi}}, nobeforeafter, after=\vspace{{0.2em}}, before=\vspace{{0.2em}}, colback={colback}, colframe={colframe}, coltitle=black, fonttitle=\bfseries,boxsep=0.45em,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}}{{\end{{tcolorbox}}\par}}"""
        return template.format(name=name, title=title, colback=colorContent, colframe=colorFrame, counter=counter, section=section)

    def generate_custom_environment(self, variant=''):
        if variant in ['', '*', '**']:
            return r"""\NewDocumentEnvironment{{custom{variant}}}{{mmo}}{{\par{counter}\begin{{tcolorbox}}[title={{#1{section}\IfNoValueTF{{#3}}{{}}{{: #3}}}},nobeforeafter, after=\vspace{{0.2em}}, before=\vspace{{0.2em}}, colback=#2!08,colframe=#2!25,coltitle=black,fonttitle=\bfseries,boxsep=0.45em,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}}{{\end{{tcolorbox}}\par}}""".format(
                variant=variant,
                counter=r'\refstepcounter{thmcounter}' if variant == '' else (
                    r'\refstepcounter{thmcounternosection}' if variant == '**' else ''),
                section=r' \thesection.\arabic{thmcounter}' if variant == '' else r' \arabic{thmcounternosection}' if variant == '**' else ''
            )
        elif variant == '***':
            return r"""\NewDocumentEnvironment{custom***}{mmmo}{\par\begin{tcolorbox}[title={#1 #3\IfNoValueTF{#4}{}{: #4}}, nobeforeafter, after=\vspace{0.2em}, before=\vspace{0.2em}, colback=#2!08,colframe=#2!25,coltitle=black,fonttitle=\bfseries,boxsep=0.45em,left=0.2em,right=0.2em,top=0.2em,bottom=0.2em,enhanced,opacityframe=.75,opacityback=0.8,breakable,pad at break*=0.2em]}{\end{tcolorbox}\par}"""


if __name__ == '__main__':
    builder = Builder()
    builder.build()
