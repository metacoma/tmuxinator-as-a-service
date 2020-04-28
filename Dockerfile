FROM andrius/alpine-ruby:latest
RUN apk add --update ttyd tmux openssh-client vim sshpass
RUN gem install tmuxinator
ADD ./files/tmuxinator.sh /usr/local/bin/tmuxinator.sh
