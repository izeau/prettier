FROM alpine AS builder
RUN apk add --no-cache nodejs nodejs-npm && \
    npm install -g prettier && \
    ldd /usr/bin/node | awk '{ print NF == 4 ? $3 : $1 }' | xargs -I% cp % /opt && \
    sed -i '1c #!/node' /usr/lib/node_modules/prettier/bin-prettier.js && \
    rm -rf /usr/lib/node_modules/prettier/esm

FROM scratch
COPY --from=builder /usr/bin/node /
COPY --from=builder /usr/lib/node_modules/prettier /
COPY --from=builder /opt /lib/

ENTRYPOINT ["/bin-prettier.js"]
CMD ["--help"]
