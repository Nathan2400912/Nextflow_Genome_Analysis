#!/usr/bin/env nextflow

process PROKKA {
    label 'process_single'
    conda "envs/prokka_env.yml"
    publishDir params.outdir

    input:
    tuple val(name), path(genome)

    output:
    path("$name/")
    path("**/*.gff"), emit: gff

    shell:
    """
    prokka --outdir $name --prefix $name --cpus 1 $genome
    """
}