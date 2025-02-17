#!/usr/bin/env nextflow

include {PROKKA} from './modules/prokka'
include {SAMTOOLS_FAIDX} from './modules/samtools'
include {EXTRACT_REGION} from './modules/extract_region'
include {SAMTOOLS_FAIDX_SUBSET} from './modules/samtools_faidx_subset'
include {JELLYFISH} from './modules/jellyfish'
include {GENOME_STATS} from './modules/genome_stats'
include {NCBI_GENOME_DOWNLOAD} from './modules/ncbi_genomes_download'

workflow {

    Channel.fromPath(params.othergenomes)
    | splitCsv(header: true)
    | map { row -> tuple(row.name, row.accession)}
    | set { genomes_ch }

    NCBI_GENOME_DOWNLOAD(genomes_ch)

    PROKKA(NCBI_GENOME_DOWNLOAD.out.ncbi_genome)
    
    GENOME_STATS(NCBI_GENOME_DOWNLOAD.out.ncbi_genome)

    kmers = Channel.from(1..21)
    combinedChannel = NCBI_GENOME_DOWNLOAD.out.ncbi_genome.combine(kmers)
    JELLYFISH(combinedChannel)

    SAMTOOLS_FAIDX(NCBI_GENOME_DOWNLOAD.out.ncbi_genome)

    EXTRACT_REGION(PROKKA.out.gff)

    subset_ch = SAMTOOLS_FAIDX.out.join(EXTRACT_REGION.out)

    SAMTOOLS_FAIDX_SUBSET(subset_ch)

}