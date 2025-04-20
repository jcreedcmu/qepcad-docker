FROM ubuntu:22.04

# Set environment variables to non-interactive for apt operations
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install minimal essential tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl git libreadline-dev cmake make gcc g++
    # && apt-get clean \
    # && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Default command (can be overridden)
CMD ["bash"]

RUN git clone https://github.com/PetterS/qepcad
RUN mkdir qepcad/build
WORKDIR /app/qepcad/build
RUN cmake ..
RUN make
