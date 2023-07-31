include { VCF2MAFpy }   from '../modules/local/VCF2MAFpy'
include { genomenavigator }   from '../modules/local/genomenavigator'

workflow vcf2maf_gn
{
	take:
	    combinedFiles
	
    main:

        referenceMap = params.referenceMap

        VCF2MAFpy(combinedFiles,
        referenceMap.genomeFile,referenceMap.genomeIndex,referenceMap.genomeDict
        )
        
        genomenavigator(VCF2MAFpy.out)
	emit:
        genomenavigator.out


}
