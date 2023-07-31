#!/usr/bin/env nextflow

params.center = "MSK"
params.sequenceSource = "WXS"

process VCF2MAFpy { 
    tag "${idTumor}_${idNormal}"

    input:
    tuple val(idTumor), val(idNormal), path(vcfFile), path center from params.center, path sequenceSource from params.sequenceSource
    
    output:
    tuple path(mafFiles)

    script:
    """
    python3 ../../bin/vcf2maf.py --input-data ${vcfFiles} --output-directory ${mafFiles} --center ${center} --sequence-source ${sequenceSource} --tumor-id ${idTumor} --normal-id ${idNormal}
    """
}
