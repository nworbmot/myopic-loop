
configfile: "config.yaml"


rule master:
    input:
        "{}.txt".format(config["years"][-1])

#https://stackoverflow.com/questions/46947411/recursion-looping-of-rules-in-snakemake
rule process:
    input:
        filename=lambda wildcards: "{}.txt".format(config["previous_year"][wildcards.year])
    output:
        filename="{year}.txt"
    script: "my_script.py"


rule prepare_initial:
    output:
        filename="2020.txt"
    script: "prepare_initial.py"
