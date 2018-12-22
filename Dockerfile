FROM node:10.14.2-alpine

LABEL maintainer Niu Zhenyong <niuzhenyong@qq.com>

RUN npm config set registry https://registry.npm.taobao.org && npm install --quiet --global @vue/cli

RUN mkdir /app

WORKDIR /app

EXPOSE 8080
EXPOSE 8000

CMD ["npm", "run", "serve"]
