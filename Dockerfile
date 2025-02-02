FROM golang:1.23.5-alpine3.21

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git docker gcc libc-dev npm

RUN go install github.com/CubicrootXYZ/openapi-code-sample-generator@v0.5.2 \
    && go install honnef.co/go/tools/cmd/staticcheck@2024.1.1 \
    && go install github.com/swaggo/swag/cmd/swag@v1.16.4 \
    && go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.63.4

RUN npm install redoc --save --legacy-peer-deps
RUN npm install redoc-cli