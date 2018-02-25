FROM alpine
LABEL org.label-schema.description: "A simple host file generator for traefik frontends"
LABEL org.label-schema.name: "traefik-hostgen"
LABEL org.label-schema.author: "Brodie Hicks"

RUN apk --update add python3 py3-requests
ADD hostgen.py /bin/
ENTRYPOINT ["/usr/bin/python3", "/bin/hostgen.py"]
