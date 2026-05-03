FROM debian:latest

RUN apt update -y && \
    # apt full-upgrade -y && \
    apt install build-essential git curl -y && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    cd /opt && \
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-arm64.tar.gz && \
    tar xvf nvim-linux-arm64.tar.gz && \
    git clone https://github.com/realworld-apps/angular-realworld-example-app.git

ENV PATH="/opt/nvim-linux-arm64/bin:${PATH}"

WORKDIR /opt

CMD ["sleep", "infinity"]
