FROM golang:1.26.4-alpine3.24

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git docker gcc libc-dev npm

RUN go install github.com/CubicrootXYZ/openapi-code-sample-generator@v0.6.0 \
    && go install honnef.co/go/tools/cmd/staticcheck@2026.1 \
    && go install github.com/swaggo/swag/v2/cmd/swag@v2.0.0-rc5 \
    && go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.12.2

RUN npm install redoc --save --legacy-peer-deps
RUN npm install redoc-cli