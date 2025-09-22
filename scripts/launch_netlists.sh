#!/bin/bash

export netlistsFolder=/home/grad/wangjianze/gf22fdx/MC_DC/tfe_vary_vp_vary_tp/tfe5/netlists
export outputsFolder=/home/grad/wangjianze/gf22fdx/MC_DC/tfe_vary_vp_vary_tp/tfe5/outputs

for tp in $(seq 2 2 30); do
    for vp in $(seq 1 0.2 5); do
        
        hspice -i ${netlistsFolder}/mc_tp${tp}_vp_${vp}.sp -o ${outputsFolder}/mc_tp${tp}_vp_${vp}/mc_tp${tp}_vp_${vp}

    done
done
