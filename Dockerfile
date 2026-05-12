FROM debian:latest

RUN apt update -y && \
    # apt full-upgrade -y && \
    apt install build-essential git curl unzip clang ripgrep lazygit -y && \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    /root/.cargo/bin/cargo install tree-sitter-cli && \
    cd /opt && \
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
    tar xvf nvim-linux-x86_64.tar.gz && \
    git clone https://github.com/realworld-apps/angular-realworld-example-app.git
    
ENV PATH="/opt/nvim-linux-x86_64/bin:${PATH}"

WORKDIR /opt

CMD ["sleep", "infinity"]
