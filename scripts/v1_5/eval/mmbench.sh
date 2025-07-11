#!/bin/bash

SPLIT="mmbench_dev_20230712"

python -m llava.eval.model_vqa_mmbench \
    --model-path ./checkpoints/llava-3stage-1 \
    --question-file ./playground/data/eval/mmbench/$SPLIT.tsv \
    --answers-file ./playground/data/eval/mmbench/answers/$SPLIT/llava-3stage-1.jsonl \
    --single-pred-prompt \
    --temperature 0 \
    --conv-mode vicuna_v1

mkdir -p playground/data/eval/mmbench/answers_upload/$SPLIT

python scripts/convert_mmbench_for_submission.py \
    --annotation-file ./playground/data/eval/mmbench/$SPLIT.tsv \
    --result-dir ./playground/data/eval/mmbench/answers/$SPLIT \
    --upload-dir ./playground/data/eval/mmbench/answers_upload/$SPLIT \
    --experiment llava-3stage-1
