process VCF2MAFpy { 
    tag "${idTumor}_${idNormal}"

    input:
	tuple val(idTumor),val(idNormal),path(combinedVCF)
    tuple path(genomeFile), path(genomeIndex), path(genomeDict), path(vepCache)

	output:
    // tuple path(somaticVCF), path(germlineVCF),val(idTumor),val(idNormal), path("${idTumor}_${idNormal}_phased.annotated.vcf.gz"),path("${idTumor}_${idNormal}_phased.annotated.vcf.gz.tbi"),  emit: Phasedout
    tuple val(idTumor),val(idNormal), path("*.maf")
	script:

    """
    touch ${idTumor}_${idNormal}.maf


    """

}