# Confidential Llama 3.3 70B

Tinfoil configuration for serving `llama3-3-70b-fp8` (Meta Llama 3.3 70B, FP8) with vLLM in a secure enclave.

The model, image digest, and serving flags are pinned in `tinfoil-config.yml` and measured at release time so clients can verify exactly what code the enclave is running.
