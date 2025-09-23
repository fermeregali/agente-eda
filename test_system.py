#!/usr/bin/env python3
"""
Script de teste do Agente de Análise Exploratória de Dados
Valida todas as funcionalidades principais do sistema
"""

import requests
import json
import time
import os
from pathlib import Path

# Configurações
BASE_URL = "http://localhost:8000"
SAMPLE_CSV = "sample_data/creditcard_sample.csv"

def test_health_check():
    """Testa se a API está funcionando"""
    print("🔍 Testando saúde da API...")
    try:
        response = requests.get(f"{BASE_URL}/api/health")
        if response.status_code == 200:
            print("✅ API está funcionando")
            return True
        else:
            print(f"❌ API retornou status {response.status_code}")
            return False
    except Exception as e:
        print(f"❌ Erro ao conectar com a API: {e}")
        return False

def test_csv_upload():
    """Testa upload de arquivo CSV"""
    print("\n📁 Testando upload de CSV...")
    
    if not os.path.exists(SAMPLE_CSV):
        print(f"❌ Arquivo de exemplo não encontrado: {SAMPLE_CSV}")
        return None
    
    try:
        with open(SAMPLE_CSV, 'rb') as f:
            files = {'file': ('creditcard_sample.csv', f, 'text/csv')}
            response = requests.post(f"{BASE_URL}/api/upload-csv", files=files)
        
        if response.status_code == 200:
            data = response.json()
            session_id = data.get('session_id')
            print(f"✅ CSV carregado com sucesso. Session ID: {session_id}")
            print(f"📊 Dataset: {data['basic_info']['shape']} (linhas x colunas)")
            return session_id
        else:
            print(f"❌ Erro no upload: {response.status_code} - {response.text}")
            return None
            
    except Exception as e:
        print(f"❌ Erro no upload: {e}")
        return None

def test_chat_analysis(session_id):
    """Testa análise via chat"""
    print("\n💬 Testando chat com IA...")
    
    test_questions = [
        "Faça uma análise geral do dataset",
        "Quais são as estatísticas básicas?",
        "Existem outliers nos dados?",
        "Mostre a correlação entre as variáveis"
    ]
    
    results = []
    
    for question in test_questions:
        print(f"❓ Pergunta: {question}")
        
        try:
            payload = {
                "message": question,
                "session_id": session_id
            }
            
            response = requests.post(f"{BASE_URL}/api/chat", json=payload)
            
            if response.status_code == 200:
                data = response.json()
                response_text = data.get('response', '')
                charts = data.get('charts', [])
                
                print(f"✅ Resposta recebida ({len(response_text)} caracteres)")
                if charts:
                    print(f"📊 {len(charts)} gráfico(s) gerado(s)")
                
                results.append({
                    'question': question,
                    'response': response_text,
                    'charts': len(charts),
                    'success': True
                })
            else:
                print(f"❌ Erro na pergunta: {response.status_code}")
                results.append({
                    'question': question,
                    'success': False,
                    'error': response.text
                })
                
        except Exception as e:
            print(f"❌ Erro na pergunta: {e}")
            results.append({
                'question': question,
                'success': False,
                'error': str(e)
            })
        
        time.sleep(1)  # Pausa entre perguntas
    
    return results

def test_session_info(session_id):
    """Testa endpoint de informações da sessão"""
    print("\n📋 Testando informações da sessão...")
    
    try:
        response = requests.get(f"{BASE_URL}/api/session/{session_id}/info")
        
        if response.status_code == 200:
            data = response.json()
            print("✅ Informações da sessão obtidas")
            print(f"📊 Colunas: {len(data['basic_info']['columns'])}")
            print(f"🔢 Numéricas: {len(data['basic_info']['numeric_columns'])}")
            print(f"📝 Categóricas: {len(data['basic_info']['categorical_columns'])}")
            return True
        else:
            print(f"❌ Erro ao obter informações: {response.status_code}")
            return False
            
    except Exception as e:
        print(f"❌ Erro: {e}")
        return False

def test_conversation_history(session_id):
    """Testa histórico da conversa"""
    print("\n📜 Testando histórico da conversa...")
    
    try:
        response = requests.get(f"{BASE_URL}/api/session/{session_id}/history")
        
        if response.status_code == 200:
            history = response.json()
            print(f"✅ Histórico obtido: {len(history)} mensagens")
            return True
        else:
            print(f"❌ Erro ao obter histórico: {response.status_code}")
            return False
            
    except Exception as e:
        print(f"❌ Erro: {e}")
        return False

def generate_test_report(results):
    """Gera relatório de testes"""
    print("\n" + "="*50)
    print("📊 RELATÓRIO DE TESTES")
    print("="*50)
    
    total_tests = len(results)
    successful_tests = len([r for r in results if r.get('success', False)])
    
    print(f"Total de testes: {total_tests}")
    print(f"Sucessos: {successful_tests}")
    print(f"Falhas: {total_tests - successful_tests}")
    print(f"Taxa de sucesso: {(successful_tests/total_tests)*100:.1f}%")
    
    print("\n📋 Detalhes dos testes:")
    for i, result in enumerate(results, 1):
        status = "✅" if result.get('success', False) else "❌"
        if 'question' in result:
            print(f"{i}. {status} {result['question']}")
            if result.get('charts', 0) > 0:
                print(f"   📊 {result['charts']} gráfico(s)")
        else:
            print(f"{i}. {status} {result.get('description', 'Teste')}")
    
    return successful_tests == total_tests

def main():
    """Executa todos os testes"""
    print("🤖 TESTE DO AGENTE DE ANÁLISE EXPLORATÓRIA DE DADOS")
    print("="*60)
    
    results = []
    
    # 1. Teste de saúde da API
    if test_health_check():
        results.append({'description': 'Health Check', 'success': True})
    else:
        results.append({'description': 'Health Check', 'success': False})
        print("❌ API não está funcionando. Verifique se o servidor está rodando.")
        return
    
    # 2. Teste de upload
    session_id = test_csv_upload()
    if session_id:
        results.append({'description': 'CSV Upload', 'success': True})
    else:
        results.append({'description': 'CSV Upload', 'success': False})
        print("❌ Não foi possível continuar sem upload bem-sucedido.")
        return
    
    # 3. Teste de informações da sessão
    if test_session_info(session_id):
        results.append({'description': 'Session Info', 'success': True})
    else:
        results.append({'description': 'Session Info', 'success': False})
    
    # 4. Testes de chat
    chat_results = test_chat_analysis(session_id)
    results.extend(chat_results)
    
    # 5. Teste de histórico
    if test_conversation_history(session_id):
        results.append({'description': 'Conversation History', 'success': True})
    else:
        results.append({'description': 'Conversation History', 'success': False})
    
    # Gerar relatório final
    all_passed = generate_test_report(results)
    
    if all_passed:
        print("\n🎉 TODOS OS TESTES PASSARAM!")
        print("Sistema está funcionando corretamente.")
    else:
        print("\n⚠️ ALGUNS TESTES FALHARAM!")
        print("Verifique os logs acima para detalhes.")

if __name__ == "__main__":
    main()
