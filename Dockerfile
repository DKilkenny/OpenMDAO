FROM ubuntu

COPY basic_shell_script.sh /basic_shell_script.sh

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*
CMD "/basic_shell_script.sh"
