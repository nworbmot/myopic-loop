
print(snakemake.input.filename)
print(snakemake.output.filename)


f = open(snakemake.input.filename, "r")
text = f.read()
f.close()

print("old text",text)

text += " counting "

print("new text",text)


f = open(snakemake.output.filename, "w")
f.write(text)
f.close()
