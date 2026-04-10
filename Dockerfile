FROM node:20-alpine

RUN apk add --no-cache sqlite

WORKDIR /app

CMD ["node", "src/index.js"]
