FROM node:20.9.0-bookworm-slim@sha256:df49e2dc50b7b1f91b44201432cefaf034f66e549bcbd3a29745ffff439afc9e

WORKDIR /app

ENV NODE_ENV=production

COPY package.json package-lock.json ./
RUN npm ci --omit=dev \
    && npm cache clean --force \
    && rm -rf /usr/local/lib/node_modules/npm /usr/local/bin/npm /usr/local/bin/npx

COPY src/ ./src/

EXPOSE 8080

USER node

CMD ["node", "src/server.js"]
