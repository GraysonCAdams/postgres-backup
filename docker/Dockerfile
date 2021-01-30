#file-name: dockerfile
FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

USER root 

# Run the Update
RUN apt-get update && apt-get upgrade -y

# install AWS CLI
RUN apt-get -y install unzip curl wget gnupg2
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN rm -rf awscliv2.zip aws

#=========POSTGRES========#
RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt focal-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN apt-get update
RUN apt-get -y install postgresql
RUN service postgresql start

#Make sure that your shell script file is in the same folder as your dockerfile while running the docker build command as the below command will copy the file to the /home/root/ folder for execution. 
COPY . /home/root/ 
WORKDIR "/home/root"
RUN chmod +x backup.sh

ENTRYPOINT ["tail", "-f", "/dev/null"]
# ENTRYPOINT ["./backup.sh"]
