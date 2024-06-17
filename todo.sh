#!/bin/bash

TODO_FILE="$HOME/.todo_list"

# Se necessário, cria o arquivo .todo_list
if [ ! -f "$TODO_FILE" ]; then
    touch "$TODO_FILE"
fi

# todo
if [ "$#" -eq 0 ]; then
    if [ -s "$TODO_FILE" ]; then
        RANDOM_TODO=$(shuf -n 1 "$TODO_FILE") # usa o shuf para sortear 1 tarefa
        echo "Você deve: $RANDOM_TODO"
    else
        echo "Sua lista de tarefas está vazia."
    fi

# todo list
elif [ "$1" == "list" ]; then
    if [ -s "$TODO_FILE" ]; then
        cat "$TODO_FILE"
    else
        echo "Sua lista de tarefas está vazia."
    fi 

# todo "fazer tal coisa"
else
    echo "$*" >> "$TODO_FILE" # append a tarefa na .todo_list
    echo "Tarefa adicionada: $*"
fi
