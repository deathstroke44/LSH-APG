#!/bin/bash
#SBATCH -t 20:00:00
#SBATCH -A PAS2671
DATA=(dataset-type)
for pair in "${DATA[@]}"; do
  data="${pair%%:*}"
  k="${pair#*:}"
  Ls=(1 2)
  Ks=(6 12 18)
  Ts=(12 24)
  beta=0.1
  W=1.0
  for L in ${Ls[@]}; do
    for K in ${Ks[@]}; do
      for T in ${Ts[@]}; do
        /usr/bin/time -v ./lgo ${data} ${k} ${L} ${K} ${beta} ${W} ${T} &> logs/${data}-${L}-${K}-${T}-${beta}-${W}.log
      done
    done
  done
done
