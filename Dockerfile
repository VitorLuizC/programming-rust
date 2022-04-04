FROM rust:1.59.0-alpine3.15

RUN rustup component add rustfmt

ARG USER_ID

ARG USER_NAME="dev"

ARG GROUP_ID

ARG GROUP_NAME="devs"

RUN addgroup -S -g $GROUP_ID $GROUP_NAME

RUN adduser -S -u $USER_ID -G $GROUP_NAME --gecos "" --disabled-password $USER_NAME

USER $USER_NAME

WORKDIR /usr/src/app

COPY . .
