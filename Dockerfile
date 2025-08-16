FROM golang:1.25.0-alpine3.22

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git docker gcc libc-dev npm

RUN go install github.com/CubicrootXYZ/openapi-code-sample-generator@v0.5.2 \
    && go install honnef.co/go/tools/cmd/staticcheck@2025.1.1 \
    && go install github.com/swaggo/swag/cmd/swag@v1.16.6 \
    && go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.4.0

RUN npm install redoc --save --legacy-peer-deps
RUN npm install redoc-cli