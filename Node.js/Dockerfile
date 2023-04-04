FROM node:12
# could have done ubuntu:20.04

WORKDIR /app
# like a cd command

COPY package*.json ./
# move local files to cwd

RUN npm install

COPY . .

ENV PORT=8080

EXPOSE 8080

CMD [ "npm", "start" ]