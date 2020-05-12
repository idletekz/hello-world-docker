FROM golang:1.13 AS build-env
COPY . /app
RUN cd /app && go build -o hello hello.go

FROM alpine
WORKDIR /app
COPY --from=build-env /app/hello /app/hello
RUN chown nobody:nogroup /app
USER nobody
ENTRYPOINT /app/hello