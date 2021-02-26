FROM ubuntu:20.04

LABEL maintainer="minminlaxz@gmail.com"

ENV TERM xterm

RUN apt-get update && apt-get install -y --no-install-recommends openssh-server sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# RUN useradd -rm -d /home/test -s /bin/bash -g root -G sudo -u 1000 test 
# RUN usermod -aG sudo test
# RUN service ssh start
# RUN  echo 'test:test' | chpasswd

RUN mkdir -p /var/run/sshd \
  && mkdir -p /root/.ssh \
  && chmod 700 /root/.ssh \
  && touch /root/.ssh/authorized_keys

COPY ./bin/* /usr/local/bin/
COPY ./sshd_config /etc/ssh/sshd_config
COPY ./authorized_keys /root/.ssh/authorized_keys

EXPOSE 6229

ENTRYPOINT ["ssh-start"]
CMD ["start-ssh-server"]

# CMD ["/usr/sbin/sshd","-D"]


