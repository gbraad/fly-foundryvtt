FROM node:18-alpine

ENV UID=1000
ENV GUID=1000

RUN deluser node
RUN adduser -u $UID -D foundry

USER foundry
RUN mkdir -p /home/foundry/data
RUN mkdir -p /home/foundry/app

# WORKDIR /home/foundry/data
# COPY --chown=$UID /foundrydata/ .

WORKDIR /home/foundry/app
COPY ./foundryvtt/ .

EXPOSE 80:30000

# Start running the server
# node resources/app/main.js --dataPath=$HOME/foundrydata
CMD ["node", "/home/foundry/app/resources/app/main.js", "--headless", "--dataPath=/home/foundry/data" ]
