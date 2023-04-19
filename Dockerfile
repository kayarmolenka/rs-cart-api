FROM node:14-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm run install

COPY ./ .
RUN npm run build

USER node
ENV PORT=8081
EXPOSE 8081

CMD [ "node", "dist/main.js" ]