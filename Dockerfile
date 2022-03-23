#Build
FROM golang:alpine AS build
WORKDIR /app
COPY . .
RUN go.mod download && go.mod verify
RUN go build -v -o /bin/goapp .

#deploy
FROM apline:3.14
WORKDIR /app
COPY --from=build /bin/goapp /app/
EXPOSE 8080
ENTRYPOINT /app/goapp
