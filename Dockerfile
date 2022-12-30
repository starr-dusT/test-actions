FROM ghcr.io/void-linux/void-linux:20210220rc01-full-x86_64   
MAINTAINER starr-dusT <starrtyler88@gmail.com>

RUN ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
RUN xbps-install -Syu -y

RUN useradd tstarr
RUN gpasswd -a tstarr wheel
RUN echo 'tstarr ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER tstarr

RUN mkdir -p /home/tstarr/.local/share/chezmoi
COPY --chown=tstarr:users . ./home/tstarr/.local/share/chezmoi
WORKDIR /home/tstarr/.local/share/chezmoi

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
