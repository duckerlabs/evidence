ARG NODE_IMAGE
FROM ${NODE_IMAGE}

ARG WORKSPACE_DIR=/evidence-workspace 

RUN apt-get update && apt-get install -y \
        curl \
        wget \
        nano \
        git \
    && rm -rf /var/lib/apt/lists/* \
    && npm install -g degit \
    && mkdir -p ${WORKSPACE_DIR} \
    && mkdir -p /evidence-bin

# Initialise the workspace
WORKDIR ${WORKSPACE_DIR}
RUN npx degit evidence-dev/template . \
    && npm install \
    && mv pages intro-pages

COPY entrypoint.sh /evidence-bin/entrypoint.sh

ENTRYPOINT [ "/evidence-bin/entrypoint.sh" ]
