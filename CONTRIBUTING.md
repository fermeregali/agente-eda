# 🤝 Guia de Contribuição

Obrigado por considerar contribuir com o **Agente de Análise Exploratória de Dados**! 

## 🚀 Como Contribuir

### 1. Fork e Clone
```bash
# Fork o repositório no GitHub
# Clone seu fork
git clone https://github.com/SEU_USUARIO/agente-eda.git
cd agente-eda
```

### 2. Configurar Ambiente
```bash
# Instalar dependências
./install.sh

# Ou manualmente
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
npm install
```

### 3. Criar Branch
```bash
git checkout -b feature/nova-funcionalidade
# ou
git checkout -b fix/correcao-bug
```

### 4. Desenvolver
- Faça suas modificações
- Adicione testes se necessário
- Mantenha o código limpo e documentado
- Siga as convenções do projeto

### 5. Testar
```bash
# Testes automatizados
python test_system.py

# Testes manuais
# Backend: python main.py
# Frontend: npm start
```

### 6. Commit e Push
```bash
git add .
git commit -m "feat: adiciona nova funcionalidade X"
git push origin feature/nova-funcionalidade
```

### 7. Pull Request
- Abra um PR no GitHub
- Descreva claramente as mudanças
- Referencie issues relacionadas
- Aguarde review

## 📋 Tipos de Contribuição

### 🐛 Bug Fixes
- Corrija bugs existentes
- Adicione testes para prevenir regressões
- Documente a correção

### ✨ Novas Funcionalidades
- Implemente features solicitadas
- Mantenha compatibilidade com versões anteriores
- Adicione documentação

### 📚 Documentação
- Melhore README, docs, comentários
- Adicione exemplos de uso
- Traduza para outros idiomas

### 🧪 Testes
- Adicione testes unitários
- Melhore cobertura de testes
- Adicione testes de integração

### 🎨 UI/UX
- Melhore interface do usuário
- Adicione animações/transições
- Torne mais responsivo

## 📝 Convenções

### Commits
Use [Conventional Commits](https://conventionalcommits.org/):
```
feat: adiciona nova funcionalidade
fix: corrige bug
docs: atualiza documentação
style: formatação de código
refactor: refatora código
test: adiciona testes
chore: tarefas de manutenção
```

### Código Python
- Siga PEP 8
- Use type hints
- Documente funções com docstrings
- Máximo 88 caracteres por linha

### Código JavaScript/React
- Use ESLint e Prettier
- Componentes funcionais com hooks
- Props tipadas com PropTypes
- Nomes descritivos

### Estrutura de Arquivos
```
src/
├── components/     # Componentes React
├── services/       # Serviços e APIs
├── utils/          # Funções utilitárias
└── styles/         # Estilos CSS
```

## 🐛 Reportar Bugs

Use o template de issue:
```markdown
**Descrição do Bug**
Descrição clara do problema

**Passos para Reproduzir**
1. Vá para '...'
2. Clique em '...'
3. Veja o erro

**Comportamento Esperado**
O que deveria acontecer

**Screenshots**
Se aplicável

**Ambiente**
- OS: [ex: Windows 10]
- Python: [ex: 3.9]
- Node: [ex: 16.14]
```

## 💡 Sugestões de Features

Use o template de feature request:
```markdown
**Feature Request**
Descrição da funcionalidade desejada

**Problema que Resolve**
Qual problema esta feature resolveria?

**Solução Proposta**
Como você imagina que funcionaria?

**Alternativas Consideradas**
Outras soluções que você considerou?

**Contexto Adicional**
Qualquer informação adicional
```

## 🏷️ Labels

- `bug` - Algo não está funcionando
- `enhancement` - Nova funcionalidade
- `documentation` - Melhorias na documentação
- `good first issue` - Bom para iniciantes
- `help wanted` - Precisa de ajuda extra
- `question` - Mais informações necessárias

## 📞 Suporte

- **Issues**: Use o GitHub Issues
- **Discussões**: Use GitHub Discussions
- **Email**: [Seu email]
- **LinkedIn**: [Seu LinkedIn]

## 🎯 Roadmap

### Versão 1.1
- [ ] Suporte a mais formatos de arquivo (Excel, JSON)
- [ ] Exportação de relatórios em PDF
- [ ] Dashboard de métricas em tempo real

### Versão 1.2
- [ ] Integração com mais LLMs
- [ ] Análise de séries temporais
- [ ] Clustering automático

### Versão 2.0
- [ ] Interface web completa
- [ ] Deploy em nuvem
- [ ] API pública

## 🙏 Reconhecimento

Contribuidores serão listados no README e receberão créditos apropriados.

---

**Obrigado por contribuir! Juntos podemos tornar este projeto ainda melhor!** 🚀
