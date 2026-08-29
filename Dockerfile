FROM golang:1.27.0-alpine3.24

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git docker gcc libc-dev npm

RUN go install github.com/CubicrootXYZ/openapi-code-sample-generator@v0.7.0 \
    && go install honnef.co/go/tools/cmd/staticcheck@2026.2.1 \
    && go install github.com/swaggo/swag/v2/cmd/swag@v2.0.0-rc5 \
    && go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.13.2

RUN npm install redoc --save --legacy-peer-deps
RUN npm install redoc-cli