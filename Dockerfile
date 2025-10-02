FROM registry.access.redhat.com/ubi10/nodejs-22-minimal
ARG QUAY_EXPIRES_AFTER=never
LABEL quay.expires-after=${QUAY_EXPIRES_AFTER}
WORKDIR /app
COPY --chown=1001:1001 package*.json .
RUN npm install
COPY --chown=1001:1001 . ./
EXPOSE 8080
CMD ["node", "server.js"]