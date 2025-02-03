#!/usr/bin/env nextflow

include {PROKKA} from './modules/prokka'
include {SAMTOOLS_FAIDX} from './modules/samtools'

workflow {

    Channel.fromPath(params.samplesheet)
    | splitCsv(header: true)
    | map { row -> tuple(row.name, file(row.path))}
    | set { fa_ch }

    PROKKA(fa_ch)
    SAMTOOLS_FAIDX(fa_ch)

}