# Nome do script
SCRIPT = todo.sh
# Diretório de destino
DESTDIR = /usr/local/bin
# Nome do executável
EXEC = todo
# Banco de dados (abuso de notação)
TODO_FILE = $(HOME)/.todo_list

# Regra padrão
all: install

# Regra de instalação
install: $(SCRIPT)
	echo "Instalando $(SCRIPT) em $(DESTDIR)/$(EXEC)..."
	sudo cp $(SCRIPT) $(DESTDIR)/$(EXEC)
	sudo chmod 755 $(DESTDIR)/$(EXEC)
	echo "Instalação completa."

# Regra para desinstalar
uninstall:
	echo "Removendo $(DESTDIR)/$(EXEC)..."
	sudo rm -f $(DESTDIR)/$(EXEC)
	echo "Removendo BD $(TODO_FILE)..."
	rm -f $(TODO_FILE)
	echo "Remoção completa."

# Regra para limpar
clean:
	echo "Limpando arquivos temporários..."
	rm -f *~
	echo "Limpeza completa."

