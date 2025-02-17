#!usr/bin/env nextflow

process SAMTOOLS_FAIDX_SUBSET {
    conda 'envs/samtools_env.yml'
    publishDir "${params.outdir}/${name}", mode: 'copy'

    input:
    tuple val(name), path(genome), path(genome_fai), path(region_of_interest)
    
    output:
    tuple val(name), path("${name}.region.subset.fna")

    shell:
    """
    samtools faidx $genome -r $region_of_interest -o ${name}.region.subset.fna
    """

}