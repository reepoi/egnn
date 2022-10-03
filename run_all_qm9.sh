### QM9 experiment
# properties --> [alpha | gap | homo | lumo | mu | Cv | G | H | r2 | U | U0 | zpve]  
# learning rate --> 1e-3 for [gap, homo lumo], 5r-4 for the rest

if [[ ! $1 || ! $2 ]]; then
    echo "usage: bash run_all_qm9.sh GPU_ID PROPERTY_INDEX"
    echo "GPU_ID    [0-7] the GPU ID to run the experiment on"
    echo "PROPERTY_INDEX [0-11] the property index in the list for qm9 (see EGNN README.md; QM9 experiment; properties)"
    exit 1
fi

properties=(alpha gap homo lumo mu Cv G H r2 U U0 zpve)

export CUDA_VISIBLE_DEVICES=$1
prop=${properties[$2]}

learning_rate=5e-4
if [[ $prop == "gap" || $prop == "homo" || $prop == "lumo" ]]; then
    learning_rate=1e-3
fi

export model=qm9
export log_dir=../out/egnn/qm9
export exp_name="$model"__lr_"$learning_rate"__"$prop"
python -u main_qm9.py --num_workers 2 --lr "$learning_rate" --property "$prop" --exp-name "$exp_name" --save-model true --save-model-dir "$log_dir" > "$log_dir"/"$exp_name"
