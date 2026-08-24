FROM golang:1.25-alpine AS builder
RUN apk add --no-cache make bash git build-base
WORKDIR /go/src/github.com/pingcap/tiflow
COPY . .

RUN --mount=type=cache,target=/go/pkg/mod go mod download
RUN --mount=type=cache,target=/root/.cache/go-build make sync-diff-inspector

FROM alpine:3.15

RUN apk update && apk add tzdata curl

ENV TZ=Asia/Shanghai

COPY --from=builder  /go/src/github.com/pingcap/tiflow/bin/sync_diff_inspector /sync_diff_inspector

ENTRYPOINT ["tail", "-f", "/dev/null"]
