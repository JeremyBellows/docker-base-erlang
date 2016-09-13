FROM edib/base-dev:3.4
MAINTAINER Christoph Grabo <edib@markentier.com>

RUN apk --no-cache upgrade && apk --no-cache add \
    'erlang<19.1' \
    'erlang-asn1<19.1' \
    'erlang-common-test<19.1' \
    'erlang-compiler<19.1' \
    'erlang-cosevent<19.1' \
    'erlang-coseventdomain<19.1' \
    'erlang-cosfiletransfer<19.1' \
    'erlang-cosnotification<19.1' \
    'erlang-cosproperty<19.1' \
    'erlang-costime<19.1' \
    'erlang-costransaction<19.1' \
    'erlang-crypto<19.1' \
    'erlang-debugger<19.1' \
    'erlang-dev<19.1' \
    'erlang-dialyzer<19.1' \
    'erlang-diameter<19.1' \
    'erlang-edoc<19.1' \
    'erlang-eldap<19.1' \
    'erlang-erl-docgen<19.1' \
    'erlang-erl-interface<19.1' \
    'erlang-erts<19.1' \
    'erlang-et<19.1' \
    'erlang-eunit<19.1' \
    'erlang-gs<19.1' \
    'erlang-hipe<19.1' \
    'erlang-ic<19.1' \
    'erlang-inets<19.1' \
    'erlang-jinterface<19.1' \
    'erlang-kernel<19.1' \
    'erlang-megaco<19.1' \
    'erlang-mnesia<19.1' \
    'erlang-observer<19.1' \
    'erlang-odbc<19.1' \
    'erlang-orber<19.1' \
    'erlang-os-mon<19.1' \
    'erlang-ose<19.1' \
    'erlang-otp-mibs<19.1' \
    'erlang-parsetools<19.1' \
    'erlang-percept<19.1' \
    'erlang-public-key<19.1' \
    'erlang-reltool<19.1' \
    'erlang-runtime-tools<19.1' \
    'erlang-sasl<19.1' \
    'erlang-snmp<19.1' \
    'erlang-ssh<19.1' \
    'erlang-ssl<19.1' \
    'erlang-stdlib<19.1' \
    'erlang-syntax-tools<19.1' \
    'erlang-test-server<19.1' \
    'erlang-tools<19.1' \
    'erlang-typer<19.1' \
    'erlang-webtool<19.1' \
    'erlang-xmerl<19.1'

RUN curl -sSL https://github.com/erlang/rebar3/releases/download/3.2.0/rebar3 \
    -o /usr/local/bin/rebar3 && \
    chmod +x /usr/local/bin/rebar3 && \
    mkdir -p $HOME/.config/rebar3/ && \
    echo '{plugins, [rebar3_hex]}.' > $HOME/.config/rebar3/rebar.config && \
    rebar3 update && rebar3 plugins upgrade rebar3_hex
