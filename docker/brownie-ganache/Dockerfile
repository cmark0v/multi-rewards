FROM trufflesuite/ganache as build
USER root
from ubuntu:latest as main
EXPOSE 8545
COPY --from=build /app /app
COPY --from=build /usr/local/bin /usr/local/bin
RUN apt-get update -y --force-yes
RUN apt-get upgrade -y --force-yes
RUN apt-get --no-install-recommends -y --force-yes install  python3-pip python3
RUN pip install eth-brownie
RUN pip install brownie-token-tester
RUN echo "#!/bin/bash" > /usr/local/bin/ganache-cli && echo "node /app/dist/node/cli.js \"\$@\"" >> /usr/local/bin/ganache-cli&& chmod +x /usr/local/bin/ganache-cli
#install last 5 versions of solidity
RUN echo "import solcx;[solcx.install_solc(s) for s in solcx.get_installable_solc_versions()[0:5]]"|python3
WORKDIR /code
