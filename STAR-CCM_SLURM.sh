#!/bin/bash
#SBATCH --job-name=STAR-CCM+_example
#SBATCH --ntasks=12
#SBATCH --exclusive

#Ensures that module loads
source /etc/profile.d/modules.sh

#STAR-CCM+ license
export CDLMD_LICENSE_FILE=1999@flex.cd-adapco.com

#STAR-CCM+ license key (not in the case of power on demand)
#LM_PROJCET=

#Scartch
mkdir /state/partition1/starccmtmp
export STAR_MASTER_TMPDIR=/state/partition1/starccmtmp

#STAR-CCM+ module
module load STAR-CCM+

#STAR-CCM+ run computation
starccm+ -power -podkey YOUR_KEY_HERE -batch run -np 12 $@

#Remove STAR-CCM+ temporary files
sleep 10
rm -rf /state/partition1/starccmtmp
