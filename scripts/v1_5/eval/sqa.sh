#!/bin/bash

python -m llava.eval.model_vqa_science \
    --model-path ./checkpoints/llava-3stage-1 \
    --question-file ./playground/data/eval/scienceqa/llava_test_CQM-A.json \
    --image-folder ./playground/data/eval/scienceqa/images/test \
    --answers-file ./playground/data/eval/scienceqa/answers/llava-3stage-1.jsonl \
    --single-pred-prompt \
    --temperature 0 \
    --conv-mode vicuna_v1

python llava/eval/eval_science_qa.py \
    --base-dir ./playground/data/eval/scienceqa \
    --result-file ./playground/data/eval/scienceqa/answers/llava-3stage-1.jsonl \
    --output-file ./playground/data/eval/scienceqa/answers/llava-3stage-1_output.jsonl \
    --output-result ./playground/data/eval/scienceqa/answers/llava-3stage-1_result.json
