#!/usr/bin/env nextflow

process PROKKA {
    label 'process_single'
    conda "envs/prokka_env.yml"
    publishDir "${params.outdir}/${name}", mode: 'copy'

    input:
    tuple val(name), path(genome)

    output:
    //path("$name/")
    tuple val(name), path("**/*.gff"), emit: gff

    shell:
    """
    prokka --cpus 1 --outdir $name --prefix $name $genome
    """
}