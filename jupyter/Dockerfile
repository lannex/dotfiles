FROM jupyter/base-notebook:latest

USER root

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip build-essential openjdk-21-jdk

# Deno
ENV DENO_INSTALL="/home/jovyan/.deno"
ENV PATH="${DENO_INSTALL}/bin:${PATH}"
RUN curl -fsSL https://deno.land/install.sh | sh && \
    deno jupyter --unstable --install

# Kotlin
RUN pip install kotlin-jupyter-kernel

# Rust
ENV PATH="${HOME}/.cargo/bin:${PATH}"
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y && \
    cargo install --locked evcxr_jupyter && \
    evcxr_jupyter --install

# Set correct permissions
RUN chown -R 1000:100 /home/jovyan
USER 1000

# Disable token and password
RUN mkdir -p /etc/jupyter && \
    echo "c.ServerApp.token = ''" >> /etc/jupyter/jupyter_notebook_config.py && \
    echo "c.ServerApp.password = ''" >> /etc/jupyter/jupyter_notebook_config.py && \
    echo "c.ServerApp.disable_check_xsrf = True" >> /etc/jupyter/jupyter_notebook_config.py

EXPOSE 8888

