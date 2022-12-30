FROM ghcr.io/void-linux/void-linux:20210220rc01-full-x86_64   
MAINTAINER starr-dusT <starrtyler88@gmail.com>

RUN xbps-install -Syu -y

RUN useradd -ms /bin/bash tstarr
RUN gpasswd -a tstarr wheel
RUN echo 'tstarr ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER tstarr

RUN mkdir /home/tstarr/.local/share/chezmoi
COPY --chown=tstarr:users . ./home/tstarr/.local/share/chezmoi
WORKDIR /home/tstarr/.local/share/chezmoi

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
