FROM ruby:latest

ADD . /ruby-docker

# Install some dev tooling
RUN apt-get update
RUN apt-get install -y vim nodejs npm
RUN npm install --global yarn
RUN curl -sSL https://get.rvm.io | bash
RUN echo "source /etc/profile.d/rvm.sh" >> /root/.bashrc
RUN echo "cd /ruby-docker/" >> /root/.bashrc
RUN /bin/bash -l -c "rvm install 2.5.9 && cd blog && bundle install"

CMD ["/bin/bash", "-c", "cd /ruby-docker/blog && rails s"]
