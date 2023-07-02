FILE_NAME = 'notex.cls'

class THMBuilder:
    def __init__(self):
        with open(FILE_NAME) as file:
            self.clstext = file.readlines()
        self.format = []
        self.built = []

        begin_index = -1
        end_index = -1
        for i, line in enumerate(self.clstext):
            if "%BEGIN THM FORMAT" in line:
                begin_index = i
            elif "%END THM FORMAT" in line:
                end_index = i
                break

        if begin_index != -1 and end_index != -1:
            self.format = self.clstext[begin_index + 1:end_index]

    def process_format(self):
        for line in self.format:
            if line.startswith("\\newenvironment{"):
                line = line.replace("}", "*}")

            elif "thmcounter" in line:
                line = line.replace("\\thesection.\\arabic{thmcounter}", "")
                line = line.replace("\\refstepcounter{thmcounter}", "")

            self.built.append(line)
        
        for line in self.format:
            if line.startswith("\\newenvironment{"):
                line = line.replace("}", "**}")
            line = line.replace("thmcounter", "thmcounternosection")
            line = line.replace(r"\thesection.", "")
            self.built.append(line)

    def build(self):
        begin_index = -1
        end_index = -1
        for i, line in enumerate(self.clstext):
            if "%BEGIN THM BUILD" in line:
                begin_index = i
            elif "%END THM BUILD" in line:
                end_index = i
                break

        if begin_index != -1 and end_index != -1:
            self.clstext[begin_index + 1:end_index] = self.built

        with open(f'built_{FILE_NAME}', 'w') as file:
            file.truncate()
            file.write(''.join(self.clstext))

thmbuilder = THMBuilder()
thmbuilder.process_format()
thmbuilder.build()
