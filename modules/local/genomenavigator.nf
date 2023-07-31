process genomenavigator { 
    tag "${idTumor}_${idNormal}"

    input:
	tuple val(idTumor),val(idNormal),path(unannotatedMAF)
    tuple path(genomeFile), path(genomeIndex), path(genomeDict), path(vepCache)

	output:
    // tuple path(somaticVCF), path(germlineVCF),val(idTumor),val(idNormal), path("${idTumor}_${idNormal}_phased.annotated.vcf.gz"),path("${idTumor}_${idNormal}_phased.annotated.vcf.gz.tbi"),  emit: Phasedout
    tuple val(idTumor),val(idNormal), path("*GNannotated*")
	script:

    """
    java -jar annotationPipeline/target/annotationPipeline-*.jar \
    --filename $unannotatedMAF \
    --output-filename ./${idTumor}_${idNormal}_GNannotated.maf \
    --isoform-override mskcc


    """
}