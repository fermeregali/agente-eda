# 🔧 Configuração do Groq

## Configuração da Chave da API

Para usar o agente EDA com Groq, você precisa configurar sua chave da API:

### 1. Obter Chave da API do Groq

1. Acesse [https://console.groq.com/](https://console.groq.com/)
2. Faça login ou crie uma conta
3. Vá para a seção "API Keys"
4. Crie uma nova chave da API

### 2. Configurar a Chave

1. Copie o arquivo de exemplo:
   ```bash
   cp config.env.example config.env
   ```

2. Edite o arquivo `config.env` e substitua `your_groq_api_key_here` pela sua chave real:
   ```env
   GROQ_API_KEY=gsk_sua_chave_aqui
   ```

### 3. Modelo Utilizado

O agente está configurado para usar o modelo **DeepSeek R1 Distill Llama 70B** do Groq, que oferece:

- ✅ Respostas rápidas e precisas
- ✅ Análises detalhadas de dados
- ✅ Geração de insights inteligentes
- ✅ Suporte a português brasileiro

### 4. Testando a Configuração

Após configurar a chave, teste o agente:

```bash
# Instalar dependências
pip install -r requirements.txt

# Executar o servidor
python main.py

# Testar upload de CSV
curl -X POST -F "file=@seu_arquivo.csv" http://localhost:8000/api/upload-csv
```

### 5. Vantagens do Groq

- **Velocidade**: Respostas muito mais rápidas que outros LLMs
- **Custo**: Preços competitivos para uso em produção
- **Qualidade**: Modelo DeepSeek R1 com excelente performance
- **Confiabilidade**: Infraestrutura robusta e estável

### 6. Troubleshooting

Se encontrar problemas:

1. **Erro de autenticação**: Verifique se a chave está correta no `config.env`
2. **Erro de conexão**: Verifique sua conexão com a internet
3. **Rate limit**: O Groq tem limites de uso, aguarde alguns minutos

### 7. Monitoramento

O agente registra todas as chamadas para o Groq nos logs do servidor. Monitore os logs para acompanhar o uso e performance.
