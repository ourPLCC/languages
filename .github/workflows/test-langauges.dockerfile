# Install Java and Python
ARG JAVA_VERSION=21
ARG PYTHON_VERSION=3
FROM eclipse-temurin:$JAVA_VERSION as java-image
FROM python:$PYTHON_VERSION as final
ENV JAVA_HOME=/opt/java/openjdk
COPY --from=java-image $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Install Bats
ARG BATS_VERSION=v1.11.0
RUN apt-get update \
    && apt-get install -y \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://github.com/bats-core/bats-core.git \
    && cd bats-core \
    && git checkout $BATS_VERSION \
    && ./install.sh /usr/local \
    && cd .. \
    && rm -rf bats-core

# Install PLCC.
RUN /bin/bash -c \
    "$(\curl -fsSL https://github.com/ourPLCC/plcc/raw/main/installers/plcc/install.bash)" \
    >> ~/.bashrc

# Copy in our languages.
COPY . /languages/

# Need to source .bashrc to set the PLCC environment variables before
# running the tests.
CMD /bin/bash -c "source ~/.bashrc && /languages/bin/test.bash"
