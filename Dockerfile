FROM ubuntu as intermediate

# install git
RUN apt-get update
RUN apt-get install -y git

# add credentials on build
ARG SSH_PRIVATE_KEY
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts
RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

COPY pyopt_script.sh /pyopt_script.sh
CMD "/pyopt_script.sh"

FROM ubuntu

COPY basic_shell_script.sh /basic_shell_script.sh

RUN  apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install git --yes

RUN ["echo", "git --version"]

# COPY --from=intermediate /pyoptsparse/pySNOPT /srv/pyoptsparse/pySNOPT

# RUN cd pyoptsparse/pySNOPT
# RUN ls
# RUN cd ../..

CMD "/basic_shell_script.sh"
