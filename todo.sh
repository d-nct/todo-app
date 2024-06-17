#!/bin/bash

TODO_FILE="$HOME/.todo_list"

# Se necessário, cria o arquivo .todo_list
if [ ! -f "$TODO_FILE" ]; then
    touch "$TODO_FILE"
fi

# Lista os todos do .todo_list
list_todos() {
    if [ -s "$TODO_FILE" ]; then
        nl -w 1 -s '. ' "$TODO_FILE"
    else
        echo "Sua lista de tarefas está vazia."
    fi
}

# Marca uma tarefa como feita
complete_todo() {
    list_todos
    echo "Digite o número da tarefa que deseja marcar como completada:"
    read -r todo_number

    if ! [[ "$todo_number" =~ ^[0-9]+$ ]]; then
        echo "Por favor, insira um número válido."
        exit 1
    fi

    if [ "$todo_number" -gt 0 ] && [ "$todo_number" -le $(wc -l < "$TODO_FILE") ]; then
        sed -i "${todo_number}d" "$TODO_FILE"
        echo "Você completou a tarefa $todo_number! Arrasou :)"
    else
        echo "Número inválido."
    fi
}

# Controla o fluxo do programa
if [ "$#" -eq 0 ]; then # todo
    if [ -s "$TODO_FILE" ]; then
        RANDOM_TODO=$(shuf -n 1 "$TODO_FILE")
        echo "Tarefa sorteada: $RANDOM_TODO"
    else
        echo "Sua lista de tarefas está vazia."
    fi
elif [ "$1" == "list" || "$1" == "-l" ]; then # todo list | todo -l
    list_todos
elif [ "$1" == "complete" || "$1" == "-c" ]; then # todo complete | todo -c
    complete_todo
else # todo "fazer tal coisa"
    echo "$*" >> "$TODO_FILE"
    echo "Tarefa adicionada: $*"
fi

