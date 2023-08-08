# Use a imagem Node.js mais recente
FROM node:latest

# Diretório de trabalho dentro do container
WORKDIR /app

# Copiar package.json e package-lock.json para o container
COPY package*.json ./

# Instalar as dependências
RUN npm install

# Copiar o restante dos arquivos para o container
COPY . .

# Compilar os arquivos TypeScript para JavaScript
RUN npm run build

# Copiar os certificados SSL/TLS para o contêiner
COPY private.key /app/private.key
COPY public.crt /app/public.crt

# Copiar o código compilado para o contêiner
COPY dist /app/dist

# Definir o comando de entrada como a execução do main.js (gerado a partir do main.ts)
CMD [ "node", "/app/dist/main.js" ]