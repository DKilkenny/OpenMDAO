FROM ubuntu

ENV YOURAPP_ENV="${SNOPT}"

COPY basic_shell_script.sh /basic_shell_script.sh

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

# RUN cd pyoptsparse/pySNOPT;
# RUN ["echo", "ls -ltr"]
RUN echo "FINISHED"

RUN apt-get update && apt-get install git --yes

RUN ["echo", "git --version"]

CMD "/basic_shell_script.sh"

RUN echo YOURAPP_ENV
