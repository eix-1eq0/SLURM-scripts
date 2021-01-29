#!/bin/bash
#SBATCH --job-name=STAR-CCM+_example
#SBATCH --ntasks=40
#SBATCH --time=06:30:00
#SBATCH --exclusive 

UserID=$(id -u)

#Kindlustab, et modlue käsk töötaks kõigis arvutus-nodedes
source /etc/profile.d/modules.sh

#STAR-CCM+ license
export CDLMD_LICENSE_FILE=1999@flex.cd-adapco.com

#STAR-CCM+ license key (not in the case of power on demand)
#LM_PROJCET=

#Scratch
export STAR_MASTER_TMPDIR=/state/partition1/starccmtmp${UserID}
mkdir $STAR_MASTER_TMPDIR

#STAR-CCM+ module
module load STAR-CCM+15.06.007-R8

#STAR-CCM+ run computation
starccm+ -power -podkey teie_tore_key -batch run -np 40 $@

#Remove STAR-CCM+ temporary files
sleep 10
rm -rf $STAR_MASTER_TMPDIR
