import snakemake



rule all:
    input: 
        combined = "output/combined.txt",
        zipped   = expand("output/out{i}.txt.gz", i=range(3))

rule create:
    input: "hello{i}.txt"
    output: "output/out{i}.txt"
    shell: "cat {input} > {output}"    

rule combine:
    input: expand("output/out{i}.txt", i=range(3))
    output: "output/combined.txt"
    shell: "sleep 3; cat {input} > {output}"

rule compress:
    input: "output/out{i}.txt"
    output: "output/out{i}.txt.gz"
    shell: "gzip {input}"