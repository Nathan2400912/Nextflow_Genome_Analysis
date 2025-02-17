#!/usr/bin/env nextflow

process SAMTOOLS_FAIDX {
    conda "envs/samtools_env.yml"
    publishDir "${params.outdir}/${name}", mode: 'copy'

    input:
    tuple val(name), path(genome)

    output:
    tuple val(name), path(genome), path("*.fai")

    shell:
    """
    samtools faidx $genome
    """

}