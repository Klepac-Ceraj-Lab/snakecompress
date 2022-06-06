import snakemake
import os

if not os.path.exists("output"):
    os.mkdir("output")


rule all:
    input: 
        combined = "output/combined.txt",
        zipped   = expand("output/out{i}.txt.gz", i=range(3))

rule create:
    input: "hello{i}.txt"
    output: "output/out{i}.txt"
    shell: "cat {input} > {output}"    

###orig combine rule: 
##rule combine:
    #input: expand("output/out{i}.txt", i=range(3))
   # output: "output/combined.txt"
    #shell: "sleep 3; cat {input} > {output}" =##

rule compress:
    input: "output/out{i}.txt"
    output: "output/out{i}.txt.gz"
    shell: "gzip {input}"

checkpoint somestep:
    input: "hello{i}.txt"
    output: "output/out{i}.txt"
    shell:
        # simulate some output value
        "echo {wildcards.sample} > somestep/{wildcards.sample}.txt"

##shouldnt be wildcards, not sure what to put instead..
def combine_input(wildcards):
 with checkpoints.somestep.get(sample=wildcards.i).output[0].open() as f:
        if f.read().strip() == "hello{i}":
            return "output/out{i}.txt"
        else:
            return "output/out{i}.txt.gz"

rule combine:
    input: 
        combine_input
        #make = expand("output/out{i}.txt", i=range(3))
    output: "output/combined.txt"
    shell: "sleep 3; cat {input} > {output}"



