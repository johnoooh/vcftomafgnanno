include { vcftomafpy }   from '../process/vcftomafpy'
include { genomenavigator }   from '../process/genomenavigator'



workflow vcf2maf_gn
{
	input:
	tuple val(idTumor),val(idNormal),path(combinedVCF)
    tuple path(genomeFile), path(genomeIndex), path(genomeDict), path(vepCache)

	main:
	"""
    
    
    
    """


	emit:


}
