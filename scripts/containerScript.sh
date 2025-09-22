#!/bin/bash

## This script is to be run inside the container
. /etc/profile
module load \
  local \
  synopsys/license \
  synopsys/hspice

. /home/grad/wangjianze/gf22fdx/MC_DC/tfe_vary_vp_vary_tp/tfe5/scripts/launch_netlists.sh
