#!/bin/bash

# ====== CONFIGURAÇÕES =======
PROJECT_ID="SEU_PROJECT_ID_AQUI"
PROJECT_NUMBER="SEU_PROJECT_NUMBER_AQUI"

# ====== CRIAR SEGREDO =======
echo "🔐 Criando segredo no Secret Manager..."
gcloud secrets create client_secret_investidura \
  --data-file=client_secret.json

# ====== LIBERAR PERMISSÃO PARA CLOUD RUN =======
echo "🔑 Concedendo permissão de acesso ao segredo..."
gcloud secrets add-iam-policy-binding client_secret_investidura \
  --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
  --role="roles/secretmanager.secretAccessor"

# ====== PERMISSÃO PARA ACESSAR DRIVE E SHEETS =======
echo "🚀 Concedendo permissão de acesso ao Drive e Sheets..."
gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
  --role="roles/drive.file"

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser"

gcloud projects add-iam-policy-binding $PROJECT_ID \
  --member="serviceAccount:${PROJECT_NUMBER}-compute@developer.gserviceaccount.com" \
  --role="roles/secretmanager.secretAccessor"

echo "✅ Permissões configuradas com sucesso!"
