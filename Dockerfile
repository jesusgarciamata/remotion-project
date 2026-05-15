FROM node:22-bookworm-slim

RUN apt-get update && apt-get install -y \
  chromium \
  ffmpeg \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npx", "remotion", "studio", "--host", "0.0.0.0"]