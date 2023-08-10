# Use a imagem Node.js mais recente
FROM node:latest

# Diretório de trabalho no contêiner
WORKDIR /app

# Copie o package.json e package-lock.json para o contêiner
COPY package*.json ./
# Instale o Nest.js CLI globalmente
RUN npm install -g @nestjs/cli
#
RUN npm cache clean --force

# Instale todas as dependências (incluindo devDependencies)
RUN npm install

# Copie o código-fonte do projeto para o contêiner
COPY . .

# Adicione o diretório de instalação do Nest.js CLI ao caminho
ENV PATH /app/node_modules/.bin:$PATH

# Comando de início do contêiner
CMD ["npm", "run", "start:dev"]