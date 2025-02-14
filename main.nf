#!/usr/bin/env nextflow

include {PROKKA} from './modules/prokka'
include {SAMTOOLS_FAIDX} from './modules/samtools'
include {EXTRACT_REGION} from './modules/extract_region'
include {SAMTOOLS_FAIDX_SUBSET} from './modules/samtools_faidx_subset'

workflow {

    Channel.fromPath(params.samplesheet)
    | splitCsv(header: true)
    | map { row -> tuple(row.name, file(row.path))}
    | set { fa_ch }

    PROKKA(fa_ch)
    SAMTOOLS_FAIDX(fa_ch)

    EXTRACT_REGION(PROKKA.out.gff)

    subset_ch = SAMTOOLS_FAIDX.out.join(EXTRACT_REGION.out)

    SAMTOOLS_FAIDX_SUBSET(subset_ch)
}