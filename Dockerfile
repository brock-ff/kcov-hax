FROM ragnaroek/kcov:v33
USER root

ENV RUST_VERSION=1.49.0

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
  curl \
  libssl-dev \
  python3.4 \
  libpython3.4-dev \
  python3 \
  git \
  && rm -rf /var/lib/apt/lists/*

ENV RUSTUP_HOME=/usr/local/rustup
ENV CARGO_HOME=/usr/local/cargo
ENV PATH=/usr/local/cargo/bin:$PATH
ENV HOME=/volume

WORKDIR ${HOME}

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain ${RUST_VERSION}
RUN cargo install cargo-kcov

ENV CARGO_HOME=${HOME}/.cargo

# download ILP source
WORKDIR /ilp
RUN git clone https://github.com/interledger-rs/interledger-rs.git
RUN cd interledger-rs && cargo build

WORKDIR ${HOME}

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["cargo-kcov"]
