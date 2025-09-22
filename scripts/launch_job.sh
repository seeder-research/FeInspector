#!/bin/bash
#PBS -j oe
#PBS -l walltime=256:00:00
#PBS -l ncpus=32
#PBS -l mem=32gb

module load \
    local \
    golang \
    singularity

cd /home/grad/wangjianze/gf22fdx/MC_DC/tfe_vary_vp_vary_tp/tfe5 && \
singularity \
    run -e --pid \
    --env LC_ALL=C \
    --env MODULEPATH=${MODULEPATH} \
    /opt/containers/centos/7/centos_eda_v13.sif \
    bash /home/grad/wangjianze/gf22fdx/MC_DC/tfe_vary_vp_vary_tp/tfe5/scripts/containerScript.sh
