FROM node:20

RUN apt-get update && apt-get install -y python3 make g++

RUN apt-get update && apt-get install -y \
  chromium \
  fonts-liberation \
  libatk-bridge2.0-0 \
  libatk1.0-0 \
  libcups2 \
  libdbus-1-3 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  xdg-utils \
  libgbm1 \
  libasound2 \
  libnss3 \
  libxss1 \
  libgtk-3-0 \
  ca-certificates

RUN npm install -g pnpm

WORKDIR /app

COPY . .

ENV CI=true

# instala dependências
RUN pnpm install

# 🔥 FORÇA BUILD REAL DO SQLITE
RUN cd node_modules/.pnpm/better-sqlite3@*/node_modules/better-sqlite3 && \
    npm run build-release

CMD ["node", "src/index.js"]