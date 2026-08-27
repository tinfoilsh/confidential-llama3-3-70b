# syntax=docker/dockerfile:1.6
ARG VLLM_BASE_IMAGE=vllm/vllm-openai:v0.22.0@sha256:0fec7ec5f3e6bc168e54899935fb0557da908a4832a1dbc88e2debcf2f889416
FROM ${VLLM_BASE_IMAGE}

ARG SOURCE_REVISION=""

ADD --checksum=sha256:dd654b19b81907030ecd3b3229c10282df2a16bdae49f7beaaa423b54a4caec4 \
    https://raw.githubusercontent.com/tinfoilsh/tinfoil-usage/5d0a81fe9c5345b734b385449563adf02a476b26/tinfoil_usage.py \
    /opt/tinfoil/tinfoil_usage.py
ENV PYTHONPATH=/opt/tinfoil
RUN python3 -B -c "import tinfoil_usage; print('usage metering ready:', tinfoil_usage.TRAILER_SUPPORT)"

LABEL org.opencontainers.image.source="https://github.com/tinfoilsh/confidential-llama3-3-70b" \
      org.opencontainers.image.revision="${SOURCE_REVISION}"
