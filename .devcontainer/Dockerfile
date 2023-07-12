FROM mambaorg/micromamba:1.4.8-bullseye

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
  postgresql-client \
  git \
  curl \
  unzip \
  && apt-get clean -y \
  && rm -rf /var/lib/apt/lists/*


USER $MAMBA_USER
  
COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1
