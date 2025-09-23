#!/bin/bash

# Script para configurar Git globalmente
echo "🔧 Configurando Git globalmente..."

# Configurar nome e email
echo "📝 Configurando nome e email do Git..."
read -p "Digite seu nome completo: " NOME
read -p "Digite seu email do GitHub: " EMAIL

git config --global user.name "$NOME"
git config --global user.email "$EMAIL"

echo "✅ Nome e email configurados!"
echo ""

# Configurar credenciais
echo "🔐 Configurando credenciais..."
read -p "Digite seu username do GitHub: " USERNAME
read -p "Digite seu Personal Access Token: " TOKEN

# Configurar credential helper
git config --global credential.helper store

# Criar arquivo de credenciais
echo "https://$USERNAME:$TOKEN@github.com" > ~/.git-credentials

echo "✅ Credenciais configuradas!"
echo ""

# Testar configuração
echo "🧪 Testando configuração..."
echo "Nome: $(git config --global user.name)"
echo "Email: $(git config --global user.email)"
echo ""

echo "🚀 Configuração concluída!"
echo "Agora você pode fazer push normalmente:"
echo "   git push -u origin main"
