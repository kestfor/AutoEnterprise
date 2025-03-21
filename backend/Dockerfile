FROM golang:1.23.1-alpine
WORKDIR /app
COPY . .
RUN go mod tidy && go build -o main ./go_code/app.go
CMD ["./main"]