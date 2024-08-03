FROM golang:1.22.5-alpine3.20

WORKDIR /app

RUN apk update && apk upgrade
RUN apk add git docker gcc libc-dev npm

RUN go install github.com/CubicrootXYZ/openapi-code-sample-generator@latest \
    && go install honnef.co/go/tools/cmd/staticcheck@2021.1.2 \
    && go install github.com/swaggo/swag/cmd/swag@latest \
    && go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.57.2

RUN npm install redoc --save --legacy-peer-deps
RUN npm install redoc-cli