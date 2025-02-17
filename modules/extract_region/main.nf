#!/usr/bin/env nextflow

process EXTRACT_REGION {
    conda "envs/biopython_env.yml"
    label 'process_single'
    publishDir "${params.outdir}/${name}", mode: 'copy'
    cache 'lenient'

    input:
    tuple val(name), path(gff)

    output:
    tuple val(name), path("*.txt") 

    script:
    """
    extract_region.py -i $gff -o ${name}.region_of_interest.txt
    """

}