FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    libffi-dev \
    libgmp-dev \
    libtinfo5 \
    libtinfo-dev \
    python \
    python3 \
 && curl -fsSL https://deb.nodesource.com/setup_14.x | bash - \
 && apt-get install -y nodejs \
 && rm -rf /var/lib/apt/lists/*
RUN curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.9.0/bazelisk-linux-amd64 -o /usr/local/bin/bazel \
 && curl -L https://github.com/bazelbuild/bazel-watcher/releases/download/v0.15.10/ibazel_linux_amd64 -o /usr/local/bin/ibazel \
 && curl -L https://github.com/bazelbuild/buildtools/releases/download/4.0.1/buildifier-linux-amd64 -o /usr/local/bin/buildifier \
 && curl -L https://github.com/bazelbuild/buildtools/releases/download/4.0.1/buildozer-linux-amd64 -o /usr/local/bin/buildozer \
 && chmod +x /usr/local/bin/*
RUN groupadd -g 1000 user \
 && useradd -u 1000 -g user -m user
USER user
