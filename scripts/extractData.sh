#!/bin/bash

for sweep in {1..12800}; do

    if [ -e "${HOME}/gf22fdx/MC_DC/tp10n_vp3_tr50n_vr1/outputs/mc_${sweep}/mc_${sweep}.printtr0" ]; then
        sed -e '1,8d' ${HOME}/gf22fdx/MC_DC/tp10n_vp3_tr50n_vr1/outputs/mc_${sweep}/mc_${sweep}.printtr0 > ${HOME}/gf22fdx/MC_DC/tp10n_vp3_tr50n_vr1/data/mc_${sweep}.csv
        sed -i -e :a -e '$d;N;2,2ba' -e 'P;D' ${HOME}/gf22fdx/MC_DC/tp10n_vp3_tr50n_vr1/data/mc_${sweep}.csv
    else
        echo "Sweep ${sweep} unsuccessful!"
    fi

done

sleep 1
echo "Data extracted!"
