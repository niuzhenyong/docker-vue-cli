## docker-vue-cli

该镜像是在 Docker 官方 Node 镜像的基础上增加了 vue-cli 包而成。假设项目的代码存放在 /app 目录中，镜像默认会启动 npm run serve 命令，该镜像默认在 8080 端口对外提供服务。

### 在命令行中直接使用
在你使用的是 bash 或者 zsh， 那么最简单的方式是在 .bashrc 或者 .zshrc 文件中增加以下内容：

```
alias vue='docker run -it --rm --init -v "$PWD":"$PWD" -w "$PWD"  -u "$(id -u)" niuzhenyong/vue-cli vue'
```
在后续的使用过程中，只需要直接输入 vue 命令就像在本地按照了 vue-cli 一样的使用，例如：

```
vue create {项目名称}
```

当然你也可以直接使用 docker 命令行直接运行，例如：

```
docker run -it --rm --init -v "$PWD":"$PWD" -w "$PWD"  -u "$(id -u)" niuzhenyong/vue-cli vue create {项目名称}
```

在你使用 vue ui 命令，需要将默认的8000端口映射出来，例如：

```
docker run -it --rm --init -v "$PWD":"$PWD" -w "$PWD"  -u "$(id -u)" -p 8000:8000 niuzhenyong/vue-cli vue ui
```

### 在 docker-compose 中使用

需要在你的项目顶级目录中，增加一个 docker-compose.yaml 文件，文件的内容大体如下：

```
version: '2'
services:
  web:
    image: niuzhenyong/vue-cli
    volumes:
      - .:/app
    ports:
      - "8080:8080"
```

在使用的过程中，需要根据你自己的实际情况对 docker-compose.yaml 文件进行配置。


