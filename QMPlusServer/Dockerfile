FROM golang:1.12-alpine

# 缓存外部依赖。只要go.mod文件没有改变，就不需要再次下载。
WORKDIR /go/mod/cache
COPY ./go.mod .

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn
RUN go mod download

# 不需要保存安装包
RUN apk add --no-cache mysql-client

WORKDIR /go/src/gin-vue-admin
COPY . .
RUN go build -ldflags="-s -w" -o gin-vue-admin
ENTRYPOINT [ "./gin-vue-admin" ]
