#!usr/bin/env nextflow

process SAMTOOLS_FAIDX_SUBSET {
    conda 'envs/samtools_env.yml'
    publishDir params.outdir

    input:
    tuple val(name), path(genome), path(genome_fai), path(region_of_interest)
    
    output:
    tuple val(name), path("region.subset.fna")

    shell:
    """
    samtools faidx $genome -r $region_of_interest -o region.subset.fna
    """

}