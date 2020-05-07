
configfile: "config.yaml"


rule master:
    input:
        "{}.txt".format(config["years"][-1])

rule process:
    input:
        filename="2020.txt"
    output:
        filename="2050.txt"
    script: "my_script.py"
