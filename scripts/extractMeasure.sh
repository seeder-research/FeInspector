#!/bin/bash

# Dir 
input_dir="/home/grad/wangjianze/gf22fdx/MC_DC/tfe_vary_vp_vary_tp/tfe5/outputs"
output_dir="/home/grad/wangjianze/gf22fdx/MC_DC/tfe_vary_vp_vary_tp/tfe5/data"

vthl_file="$output_dir/vthl.txt"
vthh_file="$output_dir/vthh.txt"
vthhd_file="$output_dir/vthhd.txt"
idvthl_file="$output_dir/idvthl.txt"
idvthh_file="$output_dir/idvthh.txt"

# loop
for tp in $(seq 2 2 30); do
    for vp in $(seq 1 0.2 5); do

        # 
        input_file="$input_dir/mc_tp${tp}_vp_${vp}/mc_tp${tp}_vp_${vp}.lis"

        # Check if file exists
        if [[ -f "$input_file" ]]; then
            # Extract measured values
            vthl=$(grep -oP '^\s*vthl=\s*\K[-+0-9.e]+' "$input_file")
            vthh=$(grep -oP '^\s*vthh=\s*\K[-+0-9.e]+' "$input_file")
            vthhd=$(grep -oP '^\s*vthhd=\s*\K[-+0-9.e]+' "$input_file")
            idvthl=$(grep -oP '^\s*idvthl=\s*\K[-+0-9.e]+' "$input_file")
            idvthh=$(grep -oP '^\s*idvthh=\s*\K[-+0-9.e]+' "$input_file")

            # Append
            echo "$tp $vp $vthl" >> "$vthl_file"
            echo "$tp $vp $vthh" >> "$vthh_file"
            echo "$tp $vp $vthhd" >> "$vthhd_file"
            echo "$tp $vp $idvthl" >> "$idvthl_file"
            echo "$tp $vp $idvthh" >> "$idvthh_file"

        else
            echo "File $input_file does not exists, simulation may fail to run."
        fi
    done
done

echo "Extraction completed."
