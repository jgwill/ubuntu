ARG UBUNTU_VER=22.04
FROM jgwill/ubuntu:py3.11
#jgwill/ubuntu:py
ARG TZ_NAME="America/New_York"

ENV DEBIAN_FRONTEND=noninteractive




RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/${TZ_NAME} /etc/localtime

# node
RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
        apt install -y ca-certificates curl gnupg && \
        mkdir -p /etc/apt/keyrings && \
        curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |  gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN \
    --mount=type=cache,target=/var/cache/apt \
        echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_22.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN \
    --mount=type=cache,target=/var/cache/apt \
        DEBIAN_FRONTEND=noninteractive apt update && \
        apt install -y nodejs


#RUN npm install -g npm
RUN npm install -g tlid tlidug json2bash
RUN npm install -g droxul
RUN npm install -g pnpm

# -----------------------------------------------------------------------------
# Bun (system-wide). BUN_INSTALL=/usr/local places the binary in /usr/local/bin
# so it is on PATH for every RUN step, every user, and every runtime shell.
# -----------------------------------------------------------------------------
ENV BUN_INSTALL="/usr/local"
ENV PATH="/usr/local/bin:${PATH}"
RUN curl -fsSL https://bun.sh/install | bash && bun --version

# -----------------------------------------------------------------------------
# @tobilu/qmd pre-baked with native modules compiled against THIS image's Node
# ABI. build-essential + libsqlite3-dev are inherited from jgwill/ubuntu:py3.11;
# the python3 alias is also set there, so node-gyp finds its toolchain.
#
# --build-from-source + explicit `npm rebuild better-sqlite3 --build-from-source`
# guarantee no prebuilt ABI mismatch downstream (see tobi/qmd better-sqlite3
# NODE_MODULE_VERSION failure when the prebuilt targeted a different Node).
# The `node -e require('better-sqlite3')` smoke test fails the build loudly
# instead of silently shipping a broken image.
# -----------------------------------------------------------------------------
RUN npm install -g @tobilu/qmd --build-from-source \
 && cd /usr/lib/node_modules/@tobilu/qmd \
 && npm rebuild better-sqlite3 --build-from-source \
 && node -e "require('better-sqlite3'); console.log('better-sqlite3 OK')" \
 && qmd --help >/dev/null 2>&1 && echo "qmd CLI OK"


