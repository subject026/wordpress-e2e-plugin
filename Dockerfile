FROM node:14

WORKDIR /app

COPY . /app

RUN yarn

CMD ["yarn", "test:e2e"]