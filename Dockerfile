FROM debian:buster-slim AS build
COPY . /sslscan
RUN apt update && apt install build-essential -y --no-install-recommends && apt install git -y && apt install zlib1g-dev -y 
WORKDIR /sslscan
RUN make static

FROM debian:buster-slim
COPY --from=build /sslscan/sslscan .
ENTRYPOINT ["./sslscan"]