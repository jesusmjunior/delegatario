from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from google.oauth2.service_account import Credentials
from googleapiclient.discovery import build
from reportlab.pdfgen import canvas
import pandas as pd
import gspread
import os

app = FastAPI()

# ================= CONFIGURAÇÕES =====================
SCOPES = [
    'https://www.googleapis.com/auth/spreadsheets',
    'https://www.googleapis.com/auth/drive'
]
SERVICE_ACCOUNT_FILE = 'client_secret.json'
SHEET_ID = '1YPZfz6MNSBoCP-AcUlFzqGf0KOdxLnJPA9oeJHz7zEc'
DRIVE_FOLDER_ID = 'SEU_FOLDER_ID_AQUI'

# ============= MODELO DE DADOS ======================
class Registro(BaseModel):
    tabela: str
    id: int
    nome: str
    cpf: str

# ============= FUNÇÃO DE VALIDAÇÃO DE CPF ============
def validar_cpf(cpf):
    cpf = ''.join(filter(str.isdigit, cpf))
    if len(cpf) != 11 or cpf == cpf[0] * 11:
        return False
    for i in range(9, 11):
        soma = sum(int(cpf[num]) * ((i + 1) - num) for num in range(0, i))
        digito = ((soma * 10) % 11) % 10
        if digito != int(cpf[i]):
            return False
    return True

# ============ CONEXÃO GOOGLE SHEETS =================
def conectar_sheet():
    creds = Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    gc = gspread.authorize(creds)
    return gc.open_by_key(SHEET_ID)

# ============ GERAÇÃO DO PDF ========================
def gerar_pdf(nome, cpf, output_path):
    c = canvas.Canvas(output_path)
    c.drawString(100, 800, "TERMO DE POSSE E INVESTIDURA")
    c.drawString(100, 780, f"Nome: {nome}")
    c.drawString(100, 760, f"CPF: {cpf}")
    c.save()

# =========== ATUALIZAR PLANILHA =====================
def atualizar_link(sheet_name, row_id, link):
    sh = conectar_sheet()
    worksheet = sh.worksheet(sheet_name)
    worksheet.update_cell(row_id + 1, worksheet.find('Link_PDF').col, link)

# =================== ENDPOINTS ======================
@app.post("/gerar-pdf")
async def gerar_pdf_registro(registro: Registro):
    if not validar_cpf(registro.cpf):
        raise HTTPException(status_code=400, detail="CPF inválido")

    # Gera PDF
    pdf_path = f"/tmp/termo_{registro.id}.pdf"
    gerar_pdf(registro.nome, registro.cpf, pdf_path)

    # Upload no Google Drive
    creds = Credentials.from_service_account_file(SERVICE_ACCOUNT_FILE, scopes=SCOPES)
    drive_service = build('drive', 'v3', credentials=creds)
    file_metadata = {
        'name': f'termo_{registro.id}.pdf',
        'parents': [DRIVE_FOLDER_ID]
    }
    media = MediaFileUpload(pdf_path, mimetype='application/pdf')
    file = drive_service.files().create(body=file_metadata, media_body=media, fields='id').execute()
    link = f"https://drive.google.com/file/d/{file.get('id')}/view"

    # Atualiza planilha
    atualizar_link(registro.tabela, registro.id, link)

    return {"status": "PDF Gerado", "link": link}

@app.get("/registro/{row_id}")
async def consultar_registro(row_id: int):
    sh = conectar_sheet()
    ws = sh.worksheet("Página 2")
    registros = ws.get_all_records()
    if row_id > len(registros):
        raise HTTPException(status_code=404, detail="Registro não encontrado")
    return registros[row_id - 1]

@app.post("/validar-cpf")
async def validar_cpf_endpoint(cpf_data: dict):
    valido = validar_cpf(cpf_data.get("cpf", ""))
    return {"cpf": cpf_data.get("cpf", ""), "valido": valido}
