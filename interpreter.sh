#!/bin/bash

model=${1:-"ollama/deepseek-r1:32b"}

docker compose exec oi interpreter --profile /opt/app/open-interpreter/profiles/ollama.yaml --model $model
