#ARG BUILD_FROM
#FROM $BUILD_FROM
#ARG BUILD_ARCH
FROM alpinelinux/build-base:latest
#ENV LANG C.UTF-8


#USER root
#SHELL ["/bin/bash", "-o", "pipefail", "-c"]

#RUN apk add --no-cache gnupg curl apt-transport-https

#RUN apt-get update
RUN apk add gnupg curl mongodb-org
    
#RUN curl -fsSL https://www.mongodb.org/static/pgp/server-6.0.asc | gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg --dearmor

#RUN echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/6.0 main" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
    
#RUN apt-get update
#RUN apt-get install -y mongodb-org

RUN systemctl start mongod
RUN systemctl enable mongod

RUN export VERSION="master"

RUN apt-get install -y epel \
    oracle-epel-release-el8

RUN apt-get install -y openssl-devel \
    bzip2-devel \
    libffi-devel \
    sqlite-devel \
    xz-devel \
    zlib-devel \
    gcc \
    git \
    openvpn \
    openssl \
    net-tools \
    iptables \
    psmisc \
    ca-certificates \
    selinux-policy \
    selinux-policy-devel \
    wget \
    tar \
    policycoreutils-python-utils

RUN wget https://www.python.org/ftp/python/3.9.16/Python-3.9.16.tar.xz
RUN echo "22dddc099246dd2760665561e8adb7394ea0cc43a72684c6480f9380f7786439 Python-3.9.16.tar.xz" | sha256sum -c -

RUN tar xf Python-3.9.16.tar.xz
RUN cd ./Python-3.9.16
RUN mkdir /usr/lib/pritunl
RUN ./configure --prefix=/usr --libdir=/usr/lib --enable-optimizations --enable-ipv6 --enable-loadable-sqlite-extensions --disable-shared --with-lto --with-platlibdir=lib
RUN make DESTDIR="/usr/lib/pritunl" install
RUN /usr/lib/pritunl/usr/bin/python3 -m ensurepip --upgrade
RUN /usr/lib/pritunl/usr/bin/python3 -m pip install --upgrade pip

RUN wget https://go.dev/dl/go1.19.3.linux-amd64.tar.gz
RUN echo "74b9640724fd4e6bb0ed2a1bc44ae813a03f1e72a4c76253e2d5c015494430ba go1.19.3.linux-amd64.tar.gz" | sha256sum -c -

RUN  rm -rf /usr/local/go
RUN  tar -C /usr/local -xf go1.19.3.linux-amd64.tar.gz
RUN rm -f go1.19.3.linux-amd64.tar.gz

RUN tee -a ~/.bashrc << export GOPATH=\$HOME/go
RUN tee -a ~/.bashrc << export PATH=/usr/local/go/bin:\$PATH
RUN source ~/.bashrc

RUN systemctl stop pritunl || true
RUN rm -rf /usr/lib/pritunl

RUN mkdir -p /usr/lib/pritunl
RUN mkdir -p /var/lib/pritunl
RUN virtualenv-3 /usr/lib/pritunl

RUN GOPROXY=direct go install github.com/pritunl/pritunl-web@latest
RUN GOPROXY=direct go install github.com/pritunl/pritunl-dns@latest
RUN rm /usr/bin/pritunl-dns
RUN rm /usr/bin/pritunl-web
RUN cp -f ~/go/bin/pritunl-dns /usr/bin/pritunl-dns
RUN cp -f ~/go/bin/pritunl-web /usr/bin/pritunl-web

RUN go get -v -u github.com/pritunl/pritunl-dns
RUN go get -v -u github.com/pritunl/pritunl-web
RUN cp -f ~/go/bin/pritunl-dns /usr/bin/pritunl-dns
RUN cp -f ~/go/bin/pritunl-web /usr/bin/pritunl-web

RUN wget https://github.com/pritunl/pritunl/archive/$VERSION.tar.gz
RUN tar xf $VERSION.tar.gz
RUN rm $VERSION.tar.gz
RUN cd ./pritunl-$VERSION
RUN /usr/lib/pritunl/bin/python setup.py build
RUN /usr/lib/pritunl/usr/bin/pip3 install --require-hashes -r requirements.txt
RUN /usr/lib/pritunl/usr/bin/python3 setup.py install
RUN ln -sf /usr/lib/pritunl/usr/bin/pritunl /usr/bin/pritunl

RUN cd selinux8
RUN ln -s /usr/share/selinux/devel/Makefile
RUN make
RUN make load
RUN cp pritunl.pp /usr/share/selinux/packages/pritunl.pp
RUN cp pritunl_dns.pp /usr/share/selinux/packages/pritunl_dns.pp
RUN cp pritunl_web.pp /usr/share/selinux/packages/pritunl_web.pp

RUN semodule -i /usr/share/selinux/packages/pritunl.pp /usr/share/selinux/packages/pritunl_dns.pp /usr/share/selinux/packages/pritunl_web.pp
RUN restorecon -v -R /tmp/pritunl* || true
RUN restorecon -v -R /run/pritunl* || true
RUN restorecon -v /etc/systemd/system/pritunl.service || true
RUN restorecon -v /usr/lib/systemd/system/pritunl.service || true
RUN restorecon -v /etc/systemd/system/pritunl-web.service || true
RUN restorecon -v /usr/lib/systemd/system/pritunl-web.service || true
RUN restorecon -v /usr/lib/pritunl/bin/pritunl || true
RUN restorecon -v /usr/lib/pritunl/bin/python || true
RUN restorecon -v /usr/lib/pritunl/bin/python3 || true
RUN restorecon -v /usr/lib/pritunl/bin/python3.6 || true
RUN restorecon -v /usr/lib/pritunl/bin/python3.9 || true
RUN restorecon -v /usr/lib/pritunl/usr/bin/pritunl || true
RUN restorecon -v /usr/lib/pritunl/usr/bin/python || true
RUN restorecon -v /usr/lib/pritunl/usr/bin/python3 || true
RUN restorecon -v /usr/lib/pritunl/usr/bin/python3.6 || true
RUN restorecon -v /usr/lib/pritunl/usr/bin/python3.9 || true
RUN restorecon -v /usr/bin/pritunl-web || true
RUN restorecon -v /usr/bin/pritunl-dns || true
RUN restorecon -v -R /var/lib/pritunl || true
RUN restorecon -v /var/log/pritunl* || true

RUN groupadd -r pritunl-web || true
RUN useradd -r -g pritunl-web -s /sbin/nologin -c 'Pritunl web server' pritunl-web || true

RUN cd ../../
RUN rm -rf ./pritunl-$VERSION

COPY run.sh /

RUN chmod +ax /run.sh

CMD ["/run.sh"]