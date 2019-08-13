FROM node:12.7.0-alpine

LABEL maintainer Niu Zhenyong <niuzhenyong@qq.com>

RUN npm config set registry https://registry.npm.taobao.org && \
    npm install --quiet --global @vue/cli && \
    npm install --quiet --global @vue/cli-service-global && \
    yarn config set registry https://registry.npm.taobao.org

RUN mkdir /app

WORKDIR /app

EXPOSE 8080
EXPOSE 8000

CMD ["yarn", "serve"]
