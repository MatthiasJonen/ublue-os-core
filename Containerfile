FROM ghcr.io/ublue-os/fedora-coreos:stable-nvidia

### MODIFICATIONS
## make modifications desired in your image and install packages by modifying the build.sh script
## the following RUN directive does all the things required to run "build.sh" as recommended.

COPY build.sh /tmp/build.sh
COPY build_files /tmp/build_files
COPY system_files /tmp/system_files

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit
