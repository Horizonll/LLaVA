#!/bin/bash

python -m llava.eval.model_vqa \
    --model-path ./checkpoints/llava-3stage-1 \
    --question-file ./playground/data/eval/mm-vet/llava-mm-vet.jsonl \
    --image-folder ./playground/data/eval/mm-vet/images \
    --answers-file ./playground/data/eval/mm-vet/answers/llava-3stage-1.jsonl \
    --temperature 0 \
    --conv-mode vicuna_v1

mkdir -p ./playground/data/eval/mm-vet/results

python scripts/convert_mmvet_for_eval.py \
    --src ./playground/data/eval/mm-vet/answers/llava-3stage-1.jsonl \
    --dst ./playground/data/eval/mm-vet/results/llava-3stage-1.json