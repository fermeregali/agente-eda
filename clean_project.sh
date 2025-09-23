#!/bin/bash

# Script para limpar arquivos desnecessários do projeto
echo "🧹 Limpando arquivos desnecessários..."

# Remover node_modules se existir
if [ -d "node_modules" ]; then
    echo "📦 Removendo node_modules..."
    rm -rf node_modules
fi

# Remover venv se existir
if [ -d "venv" ]; then
    echo "🐍 Removendo venv..."
    rm -rf venv
fi

# Remover arquivos Python compilados
echo "🐍 Removendo arquivos Python compilados..."
find . -name "*.pyc" -delete
find . -name "*.pyo" -delete
find . -name "*.pyd" -delete
find . -name "__pycache__" -type d -exec rm -rf {} + 2>/dev/null || true

# Remover arquivos temporários
echo "🗑️ Removendo arquivos temporários..."
find . -name "*.log" -delete
find . -name "*.tmp" -delete
find . -name "*.temp" -delete

# Remover arquivos de sistema
echo "💻 Removendo arquivos de sistema..."
find . -name ".DS_Store" -delete
find . -name "Thumbs.db" -delete

echo "✅ Limpeza concluída!"
echo ""
echo "📋 Para reinstalar dependências:"
echo "   ./install.sh"
