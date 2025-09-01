# Dockerfile

# 1. Escolha a imagem base do Node.js
# Usaremos uma versão LTS (Long Term Support) do Node.js baseada no Alpine Linux,
# que é uma distribuição Linux leve, resultando em imagens menores.
FROM node:18-alpine

# 2. Defina o diretório de trabalho dentro do container
# Todos os comandos a seguir serão executados a partir deste diretório.
WORKDIR /app

# 3. Copie os arquivos de dependência
# Copiamos primeiro o package.json e o package-lock.json para aproveitar o cache do Docker.
# Se esses arquivos não mudarem, o Docker não precisará reinstalar as dependências a cada build.
COPY package*.json ./

# 4. Instale as dependências do projeto
RUN npm install

# 5. Copie o restante do código da sua aplicação para o diretório de trabalho
COPY . .

# 6. Exponha a porta que a nossa aplicação usa
# A API está rodando na porta 3000 dentro do container.
EXPOSE 3000

# 7. Defina o comando para iniciar a aplicação quando o container for executado
CMD [ "node", "index.js" ]
