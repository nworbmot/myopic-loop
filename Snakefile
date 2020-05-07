
configfile: "config.yaml"


rule master:
    input:
        "{}.txt".format(config["years"][-1])

# functions are automatically passed the wildcards
def process_input(wildcards):
    return "{}.txt".format(config["previous_year"][wildcards.year])

rule process:
    input:
        filename=process_input
    output:
        filename="{year}.txt"
    script: "my_script.py"


rule prepare_initial:
    output:
        filename="2020.txt"
    script: "prepare_initial.py"
