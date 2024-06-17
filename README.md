# Ideia do projeto

Quero criar um aplicativo para controlar minha todo list em shell para usar no terminal. Seu nome será "todo". Desse modo, poderei criar novos todos chamando todo "fazer tal coisa" e chamando apenas todo, o programa deve sortear um elemento da minha todo list e imprimir na tela

## Exemplo de Comandos

- Para adicionar uma nova tarefa:
```bash
todo "Fazer tal coisa"
```

- Para listar as tarefas:
```bash
todo list
```

- Para sortear uma tarefa:
```bash
todo
```

- Para marcar uma tarefa como completada:
```bash
todo complete | todo -c
```

- Para exibir as instruções do programa:

```bash
todo --help | todo -h
```

# Instalação do Programa

- Para instalar ou atualizar o programa, basta executar o comando

```bash
make
```

- Para desinstalar, basta executar 

```bash
make uninstall
```

- Para limpeza de arquivos temporários (terminados em `~`), execute

```bash
make clean
```
