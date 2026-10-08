# Overlay of google-ctf 2022/quals/web-log4j/Dockerfile (vendored unchanged in app/).
# What differs from upstream:
# - the COPY sources point into app/ (this folder is the build context);
# - Werkzeug is pinned to 2.1.2, the release that matches the pinned Flask 2.1.2: upstream's
#   requirements.txt leaves it floating, and Werkzeug 3 removed url_quote, so Flask fails to start.
# Everything else is upstream's, line for line.

FROM ubuntu:20.04 as chroot

RUN /usr/sbin/useradd --no-create-home -u 1000 user

RUN apt-get update && \
    apt-get -y --no-install-recommends install maven python3-pip

COPY app/server /home/user
COPY app/start.sh /home/user
RUN chmod 755 /home/user/templates

RUN pip install -r /home/user/requirements.txt werkzeug==2.1.2

COPY app/chatbot /home/user/chatbot
WORKDIR /home/user/chatbot
RUN mvn clean package shade:shade

FROM gcr.io/kctf-docker/challenge@sha256:d884e54146b71baf91603d5b73e563eaffc5a42d494b1e32341a5f76363060fb

COPY --from=chroot / /chroot

COPY app/nsjail.cfg /home/user/

CMD kctf_setup && \
    (kctf_drop_privs nsjail --config /home/user/nsjail.cfg -- /bin/bash start.sh)
