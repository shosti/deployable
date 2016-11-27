FROM ubuntu:xenial
MAINTAINER Emanuel Evans <mail@emanuel.industries>
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential curl autoconf git libncurses5-dev libssl-dev zip -y
RUN mkdir /build
WORKDIR /build
RUN git clone https://github.com/asdf-vm/asdf.git /.asdf --branch v0.2.0
ENV PATH="/.asdf/bin:/.asdf/shims:$PATH"
RUN asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang
RUN asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir
RUN asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs
COPY .tool-versions /build/.tool-versions
RUN erlang_version=$(awk '/erlang/ { print $2 }' /build/.tool-versions) && asdf install erlang ${erlang_version}
RUN node_version=$(awk '/nodejs/ { print $2 }' /build/.tool-versions) && asdf install nodejs ${node_version}
RUN elixir_version=$(awk '/elixir/ { print $2 }' /build/.tool-versions) && asdf install elixir ${elixir_version}
ENV MIX_ENV=prod
ENV IN_DOCKER_BUILD=1
RUN mix local.hex --force
RUN mix local.rebar --force
COPY . /build
RUN mix deps.get
RUN npm install
RUN script/release
CMD /bin/bash
