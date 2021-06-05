FROM debian:latest
COPY . Makefile
RUN apt update && apt install build-essential -y --no-install-recommends && apt install git -y && apt install zlib1g-dev -y 
RUN cd Makefile & make static
