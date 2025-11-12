FROM cgr.dev/chainguard/gcc-glibc:latest-dev

RUN apk add cmake --no-cache
WORKDIR /opt/llama
RUN git clone https://github.com/ggerganov/llama.cpp.git && cd llama.cpp

WORKDIR /opt/llama/llama.cpp
RUN cmake -B build -DLLAMA_CURL=OFF && cmake --build build --config Release

ENTRYPOINT ["/opt/llama/llama.cpp/build/bin/llama-server"]

