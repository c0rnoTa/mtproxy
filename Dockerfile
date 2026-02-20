FROM debian:trixie-slim AS build

RUN apt-get update && apt-get install -y \
    git \
    curl \
    build-essential \
    libssl-dev \
    zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN git clone https://github.com/TelegramMessenger/MTProxy \
  && cd MTProxy \
  && make \
  && cd /app \
  && mv MTProxy/objs/bin/mtproto-proxy ./ \
  && rm -rf MTProxy

FROM debian:trixie-slim

WORKDIR /app

COPY --from=build /app/mtproto-proxy .
COPY motd.sh .

CMD ["/app/motd.sh"]


