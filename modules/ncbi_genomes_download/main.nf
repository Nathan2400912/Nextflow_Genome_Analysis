#!/usr/bin/env nextflow

process NCBI_GENOME_DOWNLOAD {
    label 'process_single'
    conda 'envs/ncbi_env.yml'
    publishDir params.refdir

    input:
    tuple val(name), val(accession_id)

    output:
    tuple val(name), path("${name}.fna"), emit: ncbi_genome

    shell:
    """
    datasets download genome accession $accession_id --include genome
    unzip ncbi_dataset.zip -d ${name}_tmp
    mv ${name}_tmp/ncbi_dataset/data/${accession_id}/*.fna ${name}.fna
    rm -rf ${name}_tmp ncbi_dataset.zip
    """
}