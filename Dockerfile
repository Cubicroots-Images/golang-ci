FROM golang:1.26.1-alpine3.23

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git docker gcc libc-dev npm

RUN go install github.com/CubicrootXYZ/openapi-code-sample-generator@v0.6.0 \
    && go install honnef.co/go/tools/cmd/staticcheck@2026.1 \
    && go install github.com/swaggo/swag/cmd/swag@v1.16.6 \
    && go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.11.4

RUN npm install redoc --save --legacy-peer-deps
RUN npm install redoc-cli