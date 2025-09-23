#!/bin/bash

# Script para testar conexão com GitHub
echo "🧪 Testando conexão com GitHub..."

echo "📋 Verificando configuração atual..."
echo "Remote URL:"
git remote -v
echo ""

echo "🔍 Testando conexão..."
if git ls-remote origin >/dev/null 2>&1; then
    echo "✅ Conexão funcionando!"
    echo ""
    echo "📊 Informações do repositório:"
    git ls-remote origin
    echo ""
    echo "🚀 Pronto para fazer push!"
    echo "   git push -u origin main"
else
    echo "❌ Erro na conexão!"
    echo ""
    echo "🔧 Possíveis soluções:"
    echo "1. Verifique se o repositório existe no GitHub"
    echo "2. Confirme se o token está correto"
    echo "3. Teste: https://github.com/fermeregali/agente-eda"
    echo ""
    echo "📋 Para criar o repositório:"
    echo "1. Acesse: https://github.com/fermeregali"
    echo "2. Clique em 'New repository'"
    echo "3. Nome: agente-eda"
    echo "4. Descrição: 🤖 Agente de Análise Exploratória de Dados com IA"
    echo "5. Marque como Público"
    echo "6. NÃO inicialize com README"
    echo "7. Clique em 'Create repository'"
fi
