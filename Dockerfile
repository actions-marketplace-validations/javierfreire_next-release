FROM convco/convco:0.6.2

RUN mv /entrypoint /bin/convco

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]