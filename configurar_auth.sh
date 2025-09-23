#!/bin/bash

# Script para configurar autenticação GitHub
echo "🔐 Configurando autenticação GitHub..."

echo "📋 Passos para criar Personal Access Token:"
echo "1. Acesse: https://github.com/settings/tokens"
echo "2. Clique em 'Generate new token' > 'Generate new token (classic)'"
echo "3. Note: agente-eda-token"
echo "4. Expiration: 90 days"
echo "5. Scopes: Marque 'repo' (acesso completo)"
echo "6. Clique em 'Generate token'"
echo "7. COPIE O TOKEN (você só verá uma vez!)"
echo ""

read -p "Cole seu Personal Access Token aqui: " TOKEN

if [ -z "$TOKEN" ]; then
    echo "❌ Token não fornecido. Saindo..."
    exit 1
fi

echo "🔧 Configurando Git com token..."

# Configurar remote com token
git remote set-url origin https://$TOKEN@github.com/fermeregali/agente-eda.git

echo "✅ Configuração concluída!"
echo ""

# Testar conexão
echo "🧪 Testando conexão..."
if git ls-remote origin >/dev/null 2>&1; then
    echo "✅ Conexão com GitHub funcionando!"
    echo ""
    echo "🚀 Agora você pode fazer push:"
    echo "   git push -u origin main"
else
    echo "❌ Erro na conexão. Verifique o token."
fi
