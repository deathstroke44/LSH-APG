

DATA=(audio:20)
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
        ./lgo ${data} ${k} ${L} ${K} ${beta} ${W} ${T} 
      done
    done
  done
done
    
