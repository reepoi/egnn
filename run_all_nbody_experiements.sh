#!/bin/bash

### N-body system experiment

#### Create N-body dataset
```
cd n_body_system/dataset
python -u generate_dataset.py --num-train 10000 --seed 43 --sufix small
```

#### Run experiments

*EGNN model*  
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=egnn_vel
export LOG_DIR=../out/egnn/nbody
python -u main_nbody.py --exp_name "$MODEL" --model "$MODEL" --max_training_samples 3000 --lr 5e-4 --save-model true --save-model-dir "$LOG_DIR" > "$LOG_DIR"/"$MODEL".log
```
  

*GNN model*  
```
export CUDA_VISIBLE_DEVICES=3
export MODEL=gnn
export LOG_DIR=../out/egnn/nbody
python -u main_nbody.py --exp_name "$MODEL" --model "$MODEL" --max_training_samples 3000 --lr 1e-3 --save-model true --save-model-dir "$LOG_DIR" > "$LOG_DIR"/"$MODEL".log
```
  
  
*Radial Field*  
```
export CUDA_VISIBLE_DEVICES=4
export MODEL=rf_vel
export LOG_DIR=../out/egnn/nbody
python -u main_nbody.py --exp_name "$MODEL" --model "$MODEL" --n_layers 4 --max_training_samples 3000 --lr 2e-4 --save-model true --save-model-dir "$LOG_DIR" > "$LOG_DIR"/"$MODEL".log
```
  
  
*Tensor Field Networks*
```
export CUDA_VISIBLE_DEVICES=6
export MODEL=tfn
export LOG_DIR=../out/egnn/nbody
python -u main_nbody.py --exp_name "$MODEL" --model "$MODEL" --max_training_samples 3000 --lr 1e-3 --degree 2 --nf 32 --save-model true --save-model-dir "$LOG_DIR" > "$LOG_DIR"/"$MODEL".log
``` 
  
  
*SE3 Transformer*  
```
export CUDA_VISIBLE_DEVICES=7
export MODEL=se3_transformer
export LOG_DIR=../out/egnn/nbody
python -u main_nbody.py --exp_name "$MODEL" --model "$MODEL" --max_training_samples 3000 --div 1 --degree 3 --nf 64 --lr 5e-3 --save-model true --save-model-dir "$LOG_DIR" > "$LOG_DIR"/"$MODEL".log
```    

#### N-body system sweep experiment
For the experiment where we sweep over different amounts of training samples you should create a larger training dataset
```
cd n_body_system/dataset
python -u generate_dataset.py  --num-train 50000 --sample-freq 500 
```
Then you can train on in this new partition by adding `--dataset nbody` to the above training commands. You can choose the number of training samples by modifying the argument `--max_training_samples <number of training samples>` 

E.g. for the EGNN for 10.000 samples
```
python -u main_nbody.py --exp_name exp_debug --model egnn_vel --max_training_samples 10000 --lr 5e-4 --dataset nbody
```