FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive \
    HOME=/home/latex \
    PATH="/home/latex/.local/bin:${PATH}"

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        build-essential \
        ca-certificates \
        curl \
        fontconfig \
        git \
        gzip \
        make \
        python3 \
        python3-pygments \
        tar \
        unzip \
        xz-utils \
    && rm -rf /var/lib/apt/lists/*

# Use a regular user so generated files are not owned by root.
RUN useradd --create-home --uid 1000 --shell /bin/bash latex \
    && mkdir -p /work \
    && chown latex:latex /work /home/latex

USER latex
WORKDIR /work

RUN curl -fsSL https://mise.run | sh \
    && echo 'eval "$(mise activate bash)"' >> "$HOME/.bashrc"

COPY mise.toml ./
RUN mise trust mise.toml \
    && mise install \
    && mise run setup

CMD ["bash", "-i"]

