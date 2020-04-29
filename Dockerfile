FROM andrius/alpine-ruby:latest
RUN apk add --update ttyd tmux openssh-client vim sshpass socat jq curl
RUN gem install tmuxinator
ADD ./files/ttyd/tmuxinator.sh /usr/local/bin/tmuxinator.sh

ADD https://github.com/jpillora/chisel/releases/download/v1.4.0/chisel_1.4.0_linux_amd64.gz /tmp
WORKDIR /tmp
RUN gunzip -c chisel_1.4.0_linux_amd64.gz > /usr/local/bin/chisel
RUN chmod +x /usr/local/bin/chisel

ADD files/ttyd/entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
