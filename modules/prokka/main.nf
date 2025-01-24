#!/usr/bin/env nextflow

process PROKKA {
    label 'process_single'
    conda 
    publishDir 

    input:
    tuple val(name), path(genome)

    output:
    path("$name/")
    path("**/*.gff"), emit: gff

    shell:
    """

    """
}