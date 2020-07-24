FROM ubuntu:16.04

RUN apt update
RUN apt install nano -y
RUN apt install less -y
RUN apt install dnsutils -y
RUN apt install iputils-ping -y
RUN apt install rsyslog -y
RUN apt install bind9 -y

RUN mkdir /bind-org
RUN mkdir /bind-data
RUN mv /etc/bind/* /bind-org
RUN rm -r /etc/bind
RUN ln -s /bind-data /etc/bind

ENTRYPOINT [ "/bin/bash", "-c", "cp -n /bind-org/* /bind-data/ && chown root.bind /etc/bind/rndc.key && service rsyslog start && service bind9 start && tail -f /var/log/syslog > /proc/1/fd/1"]