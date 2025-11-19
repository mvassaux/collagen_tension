# Execute as: bash workflow.sh $seed $nwatermolecules 

# Module to run lammps compiled by the support team
ml lammps/2Aug2023

sseed=$1
nwat=$2

mkdir addions; cd addions  
srun lmp -in ../addingions.minimization.in -var seed ${sseed}
cd ..

mkdir addwater; cd addwater
srun lmp -in ../addingwater.minimization.in -var seed ${sseed} -var nwat ${nwat}
cd ..

mkdir nvtrelaxation; cd nvtrelaxation
srun lmp -in ../nvtrelaxation.in -var seed ${sseed}
cd ..

