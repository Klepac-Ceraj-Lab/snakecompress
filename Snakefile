import snakemake



rule all:
    input:
        txt = expand("sample{i}.txt", i = range(3))
        # gz = expand("sample{i}.txt.gz", i = range(3))

rule create:
    input:
        hello = "hello.txt"
    output:
        txt = "sample{i}.txt"
