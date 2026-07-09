#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract values from JSON
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name // empty')
output_style=$(echo "$input" | jq -r '.output_style.name // empty')
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')
agent_name=$(echo "$input" | jq -r '.agent.name // empty')
context_used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Colors (dimmed for status line)
YELLOW='\033[33m'
GREEN='\033[32m'
CYAN='\033[36m'
PURPLE='\033[35m'
RESET='\033[0m'

# Build status line parts
status=""

# Directory (yellow, like starship)
dir_name=$(basename "$cwd")
status+="${YELLOW}${dir_name}${RESET}"

# Git branch (green, like starship)
if [ -d "$cwd/.git" ]; then
    branch=$(cd "$cwd" && git -c core.useBuiltinFSMonitor=false branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        status+=" ${GREEN}${branch}${RESET}"
    fi
fi

# Model info (cyan)
if [ -n "$model" ]; then
    model_short=$(echo "$model" | sed 's/Claude //' | sed 's/ /-/g')
    status+=" ${CYAN}${model_short}${RESET}"
fi

# Output style (if not default)
if [ -n "$output_style" ] && [ "$output_style" != "default" ]; then
    status+=" ${PURPLE}[${output_style}]${RESET}"
fi

# Vim mode (if enabled)
if [ -n "$vim_mode" ]; then
    if [ "$vim_mode" = "INSERT" ]; then
        status+=" ${GREEN}INSERT${RESET}"
    else
        status+=" ${CYAN}NORMAL${RESET}"
    fi
fi

# Agent mode (if running as agent)
if [ -n "$agent_name" ]; then
    status+=" ${PURPLE}@${agent_name}${RESET}"
fi

# Context used (always show, yellow warning if > 70%)
if [ -n "$context_used" ]; then
    used_int=${context_used%.*}
    if [ "${used_int:-0}" -gt 70 ]; then
        status+=" ${YELLOW}ctx:${context_used}%${RESET}"
    else
        status+=" ctx:${context_used}%"
    fi
fi

printf "%b" "$status"
