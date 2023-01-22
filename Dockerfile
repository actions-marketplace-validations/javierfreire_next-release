FROM convco/convco:0.3.11

RUN mv /entrypoint /bin/convco

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]