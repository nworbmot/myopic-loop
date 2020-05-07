
configfile: "config.yaml"


rule master:
    input:
        "2050.txt"

rule process:
    input:
        filename="2020.txt"
    output:
        filename="2050.txt"
    script: "my_script.py"
