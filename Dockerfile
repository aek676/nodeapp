FROM node:24-alpine AS install-dependencies
WORKDIR /app
ENV NODE_ENV=production
COPY package*.json ./
RUN npm ci --omit=dev --ignore-scripts

FROM node:24-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .

FROM node:24-alpine AS runner
WORKDIR /app

ENV NODE_ENV=production
USER node

COPY --chown=node:node --from=install-dependencies /app/node_modules ./node_modules
COPY --chown=node:node --from=build /app/src ./src

EXPOSE 3000

CMD ["node", "src/main"]
