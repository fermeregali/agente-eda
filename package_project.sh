#!/bin/bash

# Script para empacotar o projeto do Agente EDA
# Desenvolvido para entrega da atividade acadêmica

echo "📦 Empacotando Agente de Análise Exploratória de Dados..."
echo "=================================================="

# Criar diretório de entrega
DELIVERY_DIR="agente-eda-entrega"
rm -rf $DELIVERY_DIR
mkdir -p $DELIVERY_DIR

echo "📁 Copiando arquivos do projeto..."

# Copiar arquivos principais
cp main.py $DELIVERY_DIR/
cp requirements.txt $DELIVERY_DIR/
cp package.json $DELIVERY_DIR/
cp config.env $DELIVERY_DIR/
cp install.sh $DELIVERY_DIR/
cp test_system.py $DELIVERY_DIR/
cp README.md $DELIVERY_DIR/

# Copiar relatório em PDF (convertido do Markdown)
cp "Agentes Autônomos – Relatório da Atividade Extra.md" $DELIVERY_DIR/

# Copiar código fonte React
cp -r src/ $DELIVERY_DIR/ 2>/dev/null || true
cp -r public/ $DELIVERY_DIR/ 2>/dev/null || true

# Copiar dados de exemplo
cp -r sample_data/ $DELIVERY_DIR/ 2>/dev/null || true

# Criar arquivo de instruções
cat > $DELIVERY_DIR/INSTRUCOES_INSTALACAO.txt << EOF
🤖 AGENTE DE ANÁLISE EXPLORATÓRIA DE DADOS (EDA)
=============================================

INSTALAÇÃO RÁPIDA:
1. Execute: ./install.sh
2. Terminal 1: source venv/bin/activate && python main.py
3. Terminal 2: npm start
4. Acesse: http://localhost:3000

REQUISITOS:
- Python 3.8+
- Node.js 16+
- MongoDB (opcional, funciona sem)

TESTES:
- Execute: python test_system.py

FUNCIONALIDADES:
✅ Upload de CSV (drag-and-drop)
✅ Chat conversacional com IA
✅ Análises estatísticas automáticas
✅ Geração de gráficos
✅ Detecção de outliers
✅ Análise de correlações
✅ Memória persistente

Desenvolvido por: Fernando Meregali Xavier
Framework: FastAPI + React + Groq DeepSeek R1 Distill Llama 70B
EOF

# Criar arquivo ZIP
echo "🗜️ Criando arquivo compactado..."
tar -czf agente-eda-completo.tar.gz $DELIVERY_DIR/

echo ""
echo "✅ Projeto empacotado com sucesso!"
echo ""
echo "📋 Arquivos gerados:"
echo "  - agente-eda-completo.tar.gz (projeto completo)"
echo "  - $DELIVERY_DIR/ (diretório descompactado)"
echo ""
echo "📊 Conteúdo do pacote:"
ls -la $DELIVERY_DIR/
echo ""
echo "🎯 Pronto para entrega!"
echo ""
echo "Para testar a instalação:"
echo "  1. tar -xzf agente-eda-completo.tar.gz"
echo "  2. cd $DELIVERY_DIR"
echo "  3. ./install.sh"
echo ""
