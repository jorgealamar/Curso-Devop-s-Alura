FROM python:3.12-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app
# Copia o arquivo de dependências primeiro para aproveitar o cache do Docker
COPY requirements.txt .

# Instala as dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta que a aplicação irá rodar
EXPOSE 8000

# Comando para iniciar a aplicação com uvicorn
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]