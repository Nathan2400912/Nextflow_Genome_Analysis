#!/usr/bin/env nextflow

process GENOME_STATS {
    label 'process_single'
    conda 'envs/biopython_env.yml'
    publishDir "${params.outdir}/${name}", mode: 'copy'

    input:
    tuple val(name), path(genome)

    output:
    tuple val(name), path("${name}_genome_stats.txt")

    shell:
    """
    genome_stats.py -i $genome -o ${name}_genome_stats.txt
    """
}