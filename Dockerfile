FROM node:20 AS Builder

WORKDIR /app

COPY package*json ./

RUN npm install

COPY . .

#-------------------------

FROM node:20-alpine

WORKDIR /app

COPY --from=Builder /app/package*json ./
COPY --from=Builder /app/src ./src
COPY --from=Builder /app/node_modules ./node_modules

EXPOSE 3000

CMD ["node", "src/server.js"]

