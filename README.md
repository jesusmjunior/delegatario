# 📄 Investidura API - Google Cloud Run + AppSheet

API em FastAPI para gerar documentos PDF, validar CPF e atualizar planilha Google Sheets.

## 🚀 Tecnologias
- FastAPI
- Google Sheets API
- Google Drive API
- Cloud Run (Serverless)
- AppSheet (entrada de dados)

---

## 📂 Estrutura

- main.py → Código da API
- requirements.txt → Dependências
- Dockerfile → (Opcional)
- build.yaml → (Opcional)
- client_secret.json → Guardado no **Secrets Manager**

---

## 🟢 Deploy Passo a Passo

### 1. Configurar Secrets Manager

```bash
gcloud secrets create client_secret_investidura \
--data-file=client_secret.json
gcloud secrets add-iam-policy-binding client_secret_investidura \
--member=serviceAccount:PROJECT_NUMBER-compute@developer.gserviceaccount.com \
--role=roles/secretmanager.secretAccessor
