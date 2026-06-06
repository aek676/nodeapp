FROM node:24-alpine AS node

FROM node AS deps

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci --omit=dev

FROM node AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm ci

COPY . .

FROM node AS runner

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /usr/src/app

COPY --from=deps /usr/src/app/node_modules ./node_modules

COPY --from=builder /usr/src/app/src ./src

COPY --from=builder /usr/src/app/package.json ./

USER appuser

EXPOSE 3000

CMD [ "npm", "start" ]
