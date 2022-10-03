*GNN Erdos & Renyi*
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=ae
export DATASET=erdosrenyinodes_0.25_none
export NOISE=0
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model $MODEL --dataset "$DATASET" --K 8 --emb_nf 8 --noise_dim "$NOISE"
```

*GNN Community*
```
export CUDA_VISIBLE_DEVICES=3
export MODEL=ae
export DATASET=community_ours
export NOISE=0
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model "$MODEL" --dataset "$DATASET" --K 8 --emb_nf 8 --noise_dim "$NOISE"
```

*Noise-GNN Erdos&Renyi*
```
export CUDA_VISIBLE_DEVICES=4
export MODEL=ae
export DATASET=erdosrenyinodes_0.25_none
export NOISE=1
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model "$MODEL" --dataset "$DATASET" --K 8 --emb_nf 8 --noise_dim "$NOISE"
```

*Noise GNN Community*
```
export CUDA_VISIBLE_DEVICES=6
export MODEL=ae
export DATASET=community_ours
export NOISE=1
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model "$MODEL" --dataset "$DATASET" --K 8 --emb_nf 8 --noise_dim "$NOISE"
```

*Radial Field Erdos&Renyi*
```
export CUDA_VISIBLE_DEVICES=7
export MODEL=ae_rf
export DATASET=erdosrenyinodes_0.25_none
export NOISE=0
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model "$MODEL" --dataset "$DATASET" --K 8 --emb_nf 8
```

*Radial Field Community*
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=ae_rf
export DATASET=community_ours
export NOISE=0
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model "$MODEL" --dataset "$DATASET" --K 8 --emb_nf 8
```

*EGNN Erdos&Renyi*
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=ae_egnn
export DATASET=erdosrenyinodes_0.25_none
export NOISE=0
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model "$MODEL" --dataset "$DATASET" --K 8 --emb_nf 8
```

*EGNN Community*
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=ae_egnn
export DATASET=community_ours
export NOISE=0
export LOG_DIR=../out/egnn/ae
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE" --model "$MODEL" --dataset "$DATASET" --K 8 --emb_nf 8
```

----------------------------------------------------
The following overfit eperiments are for (p=0.2). p can be modified by replacing the 0.2 value from the dataset name (e.g. erdosrenyinodes_0.2_overfit) to other values.

*GNN Erdos&Renyi overfit*
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=ae
export DATASET=erdosrenyinodes_0.2_overfit
export NOISE=0
export EPOCHS=10001
export TEST_INTERVAL=200
export K_PARAM=16
export EMB_NF=16
export LOG_DIR=../out/egnn/ae/overfit
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE"__K_"$K_PARAM"__EMB_NF_"$EMB_NF" --model "$MODEL" --dataset "$DATASET" --epochs "$EPOCHS" --test-interval "$TEST_INTERVAL" --K "$K_PARAM" --emb_nf "$EMB_NF"
```
*Noise-GNN Erdos&Renyi overfit*
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=ae
export DATASET=erdosrenyinodes_0.2_overfit
export NOISE=0
export EPOCHS=10001
export TEST_INTERVAL=200
export K_PARAM=16
export EMB_NF=16
export LOG_DIR=../out/egnn/ae/overfit
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE"__K_"$K_PARAM"__EMB_NF_"$EMB_NF" --model "$MODEL" --dataset "$DATASET" --epochs "$EPOCHS" --test-interval "$TEST_INTERVAL" --noise-dim "$NOISE" --K "$K_PARAM" --emb_nf "$EMB_NF"
```
*EGNN Erdos&Renyi overfit*
```
export CUDA_VISIBLE_DEVICES=2
export MODEL=ae_egnn
export DATASET=erdosrenyinodes_0.2_overfit
export NOISE=0
export EPOCHS=10001
export TEST_INTERVAL=200
export K_PARAM=16
export EMB_NF=16
export LOG_DIR=../out/egnn/ae/overfit
python -u main_ae.py --exp_name "$MODEL"__"$DATASET"__noise_"$NOISE"__K_"$K_PARAM"__EMB_NF_"$EMB_NF" --model "$MODEL" --dataset "$DATASET" --epochs "$EPOCHS" --test-interval "$TEST_INTERVAL" --K "$K_PARAM" --emb_nf "$EMB_NF"
```
