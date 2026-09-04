# syntax=docker/dockerfile:1.6
ARG VLLM_BASE_IMAGE=vllm/vllm-openai:v0.22.0@sha256:0fec7ec5f3e6bc168e54899935fb0557da908a4832a1dbc88e2debcf2f889416
ARG SIDECAR_IMAGE=ghcr.io/tinfoilsh/inference-sidecar@sha256:65ce23d6560c46a1e8614ede187fcbf9798b267aa33878905b4872404787f47d
FROM ${SIDECAR_IMAGE} AS sidecar

FROM ${VLLM_BASE_IMAGE}

ARG SOURCE_REVISION=""

COPY --from=sidecar /inference-sidecar /opt/tinfoil/inference-sidecar
ENTRYPOINT ["/opt/tinfoil/inference-sidecar", "vllm", "serve"]

LABEL org.opencontainers.image.source="https://github.com/tinfoilsh/confidential-llama3-3-70b" \
      org.opencontainers.image.revision="${SOURCE_REVISION}"
