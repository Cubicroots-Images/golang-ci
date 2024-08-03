FROM golang:1.22-bookworm

WORKDIR /app

RUN echo "deb http://archive.debian.org/debian buster-backports main" >> /etc/apt/sources.list.d/backport.list

RUN apt update && apt upgrade -y && \
    apt install -y git/buster-backports gcc docker --allow-downgrades && \
    apt install libolm-dev npm docker docker-compose -y

RUN go install github.com/CubicrootXYZ/openapi-code-sample-generator@latest \
    && go install honnef.co/go/tools/cmd/staticcheck@2021.1.2 \
    && go install github.com/swaggo/swag/cmd/swag@latest \
    && go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.57.2

RUN npm install redoc --save --legacy-peer-deps
RUN npm install redoc-cli

RUN curl -fLo install.sh https://raw.githubusercontent.com/cosmtrek/air/master/install.sh \
    && chmod +x install.sh && sh install.sh && cp ./bin/air /bin/air

CMD air