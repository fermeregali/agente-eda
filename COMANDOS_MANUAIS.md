# 🔐 Comandos Manuais para Autenticação GitHub

## 1. Criar Personal Access Token
1. Acesse: https://github.com/settings/tokens
2. Clique em "Generate new token" > "Generate new token (classic)"
3. **Note**: `agente-eda-token`
4. **Expiration**: `90 days`
5. **Scopes**: Marque `repo` (acesso completo)
6. Clique em "Generate token"
7. **COPIE O TOKEN**

## 2. Configurar Git (Escolha uma opção)

### Opção A: Token na URL
```bash
# Substitua SEU_TOKEN pelo token que você copiou
git remote set-url origin https://SEU_TOKEN@github.com/fermeregali/agente-eda.git

# Testar
git push -u origin main
```

### Opção B: Configuração Global
```bash
# Configurar nome e email
git config --global user.name "Seu Nome"
git config --global user.email "seu-email@exemplo.com"

# Configurar credenciais
git config --global credential.helper store

# Criar arquivo de credenciais
echo "https://SEU_USERNAME:SEU_TOKEN@github.com" > ~/.git-credentials

# Testar
git push -u origin main
```

### Opção C: SSH (Alternativo)
```bash
# Gerar chave SSH
ssh-keygen -t ed25519 -C "seu-email@exemplo.com"

# Mostrar chave pública
cat ~/.ssh/id_ed25519.pub

# Adicionar chave no GitHub: Settings > SSH and GPG keys
# Configurar remote
git remote set-url origin git@github.com:fermeregali/agente-eda.git

# Testar
git push -u origin main
```

## 3. Verificar Configuração
```bash
# Ver remote
git remote -v

# Ver configurações
git config --list

# Testar conexão
git ls-remote origin
```

## 4. Fazer Push
```bash
# Adicionar arquivos
git add .

# Commit
git commit -m "feat: configura autenticação GitHub"

# Push
git push -u origin main
```

## 🆘 Se Der Erro

### Erro: "Authentication failed"
- Verifique se o token está correto
- Confirme se o token tem escopo `repo`
- Teste: `git ls-remote origin`

### Erro: "Repository not found"
- Verifique se o repositório existe no GitHub
- Confirme se o nome está correto: `fermeregali/agente-eda`

### Erro: "Permission denied"
- Verifique se o token tem permissões corretas
- Confirme se o usuário tem acesso ao repositório
