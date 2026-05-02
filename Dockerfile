FROM node:20

# Dependências nativas
RUN apt-get update && apt-get install -y \
  python3 \
  make \
  g++ \
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
  ca-certificates \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

RUN npm rebuild better-sqlite3

CMD ["node", "src/index.js"]