ARG IMAGE_VERSION=latest
ARG BASE_IMAGE=apache/superset
FROM ${BASE_IMAGE}:${IMAGE_VERSION}

# Switching to root to install the required packages
USER root

ARG ADDITIONAL_PIP_PACKAGES
RUN pip install ${ADDITIONAL_PIP_PACKAGES}

# Switching back to using the `superset` user
USER superset
