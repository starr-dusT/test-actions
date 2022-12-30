FROM ghcr.io/void-linux/void-linux:latest-full-x86_64 
MAINTAINER starr-dusT <starrtyler88@gmail.com>

RUN xbps-install -Syu -y
RUN xbps-install -S bash -y

RUN useradd tstarr
RUN gpasswd -a tstarr wheel
RUN echo 'tstarr ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER tstarr

RUN mkdir -p /home/tstarr/.local/share/chezmoi
COPY --chown=tstarr:users . ./home/tstarr/.local/share/chezmoi
WORKDIR /home/tstarr/.local/share/chezmoi

ENTRYPOINT ["sh", "docker-entrypoint.sh"]
