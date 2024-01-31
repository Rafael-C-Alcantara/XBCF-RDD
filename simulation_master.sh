#! /usr/bin/bash
k1=(0.05 0.25 0.7)
k2=(0.25 0.24 0.14)
for sig in 1 4 16
do
    for i in 0 1 2
    do
	echo "sig=$sig; k=$i"
	Rscript R/simulation_data.R ${k1[$i]} ${k2[$i]} $sig
	echo "Saved data for: sig=$sig; k=$i"
	echo "Running regressions: sig=$sig; k=$i"
	Rscript R/simulation_master.R
	echo "Saving simulation results: sig=$sig; k=$i"
	Rscript R/simulation_save_results.R $sig $i
	echo "Simulation finished: sig=$sig; k=$i"
    done
done