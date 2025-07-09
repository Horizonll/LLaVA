#!/bin/bash

python -m llava.eval.model_vqa_loader \
    --model-path ./checkpoints/llava-3stage-1 \
    --question-file ./playground/data/eval/MME/llava_mme.jsonl \
    --image-folder ./playground/data/eval/MME/MME_Benchmark_release_version \
    --answers-file ./playground/data/eval/MME/answers/llava-3stage-1.jsonl \
    --temperature 0 \
    --conv-mode vicuna_v1

cd ./playground/data/eval/MME

python convert_answer_to_mme.py --experiment llava-3stage-1

cd eval_tool

python calculation.py --results_dir answers/llava-3stage-1
