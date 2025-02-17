#!/usr/bin/env nextflow

process JELLYFISH {
    label 'process_single'
    conda 'envs/jellyfish_env.yml'
    publishDir "${params.outdir}/${name}", mode: 'copy'

    input:
    tuple val(name), path(genome), val(kmer_length)

    output:
    tuple val(name), path("${name}_${kmer_length}.jf"), path("${name}_${kmer_length}.txt"), emit: kmer_results

    shell:
    """
    jellyfish count -m $kmer_length -s 100M -o ${name}_${kmer_length}.jf $genome
    jellyfish stats ${name}_${kmer_length}.jf > ${name}_${kmer_length}.txt
    """

}