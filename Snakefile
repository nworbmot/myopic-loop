
configfile: "config.yaml"

rule master:
    input:
        "{}.txt".format(config["years"][-1])


rule prepare_initial:
    output:
        filename="{}.txt".format(config["years"][0])
    script: "prepare_initial.py"


# functions are automatically passed the wildcards
def process_input(wildcards):
    i = config["years"].index(wildcards.year)
    return "{}.txt".format(config["years"][i-1])

rule process:
    input:
        filename=process_input
    output:
        filename="{year}.txt"
    script: "my_script.py"
