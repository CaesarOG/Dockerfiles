#!/usr/bin/zsh

source ~/.zshrc
conda activate cling
jupyter-lab --no-browser --allow-root --ip 0.0.0.0 --port 8888 --NotebookApp.allow_origin='*' --NotebookApp.allow_origin_pat="https://.*vscode-cdn\.net" --allow-root