FROM ubuntu:22.04
RUN apt-get update && apt-get -y upgrade && apt-get install -y curl git build-essential pkg-config openssl libssl-dev
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
WORKDIR /root/
# 复制当前拉取的所有代码
COPY . .
# 编译官方服务器端
RUN cargo build --release -p phira-mp-server
# 运行服务
CMD ["./target/release/phira-mp-server"]
