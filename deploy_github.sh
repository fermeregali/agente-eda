#!/bin/bash

# Script para deploy no GitHub
# Desenvolvido para o projeto Agente EDA

echo "🚀 Deploy do Agente EDA para GitHub"
echo "=================================="

# Verificar se estamos no diretório correto
if [ ! -f "main.py" ]; then
    echo "❌ Erro: Execute este script no diretório do projeto"
    exit 1
fi

# Verificar status do Git
echo "📋 Verificando status do Git..."
git status

# Adicionar arquivos modificados
echo "📁 Adicionando arquivos modificados..."
git add .

# Fazer commit se houver mudanças
if ! git diff --staged --quiet; then
    echo "💾 Fazendo commit das mudanças..."
    git commit -m "chore: atualiza arquivos do projeto

- Melhora documentação e README
- Adiciona guias de contribuição
- Atualiza configurações do projeto
- Organiza estrutura de arquivos"
else
    echo "✅ Nenhuma mudança para commitar"
fi

# Verificar se remote existe
if ! git remote get-url origin >/dev/null 2>&1; then
    echo "🔗 Adicionando remote origin..."
    git remote add origin https://github.com/fermeregali/agente-eda.git
fi

# Push para GitHub
echo "📤 Fazendo push para GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "🎉 Deploy realizado com sucesso!"
    echo ""
    echo "📊 Repositório disponível em:"
    echo "   https://github.com/fermeregali/agente-eda"
    echo ""
    echo "📋 Próximos passos:"
    echo "   1. Acesse o repositório no GitHub"
    echo "   2. Configure as descrições e tags"
    echo "   3. Ative GitHub Pages se desejar"
    echo "   4. Configure GitHub Actions para CI/CD"
    echo ""
    echo "🔧 Para clonar em outro local:"
    echo "   git clone https://github.com/fermeregali/agente-eda.git"
else
    echo "❌ Erro no push. Verifique suas credenciais do GitHub"
    echo "💡 Dica: Configure um Personal Access Token se necessário"
fi
