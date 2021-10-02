FROM golang:rc-alpine AS builder

WORKDIR /go/src/app
COPY ./olamundo.go .

RUN go build olamundo.go

#############################
FROM scratch

COPY --from=builder /go/src/app/olamundo /go/src/app/olamundo

ENTRYPOINT ["/go/src/app/olamundo"]