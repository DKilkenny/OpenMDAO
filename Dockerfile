FROM ubuntu as intermediate

ARG SNOPT_LOCATION=None

# install git
RUN apt-get update
RUN apt-get install -y git

RUN cd pyoptsparse/pySNOPT;
RUN echo "Secure copying SNOPT over SSH";
RUN scp -r "$SNOPT_LOCATION" .;
RUN cd ../..;

RUN echo "FINISHED"
# COPY pyopt_script.sh /pyopt_script.sh
# CMD "/pyopt_script.sh"

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
