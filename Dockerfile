FROM tercen/dartrusttidy:1.0.7

USER root
WORKDIR /operator

RUN git clone https://github.com/tercen/singleR_operator.git

WORKDIR /operator/singleR_operator

RUN apt install default-jdk

RUN wget https://cran.r-project.org/src/base/R-3/R-3.6.3.tar.gz
RUN tar -xzf R-3.6.3.tar.gz
RUN cd R-3.6.3 && ./configure --with-x=no --with-pcre1 && make && make install

ENV TERCEN_SERVICE_URI https://tercen.com

COPY start.R /start.R

ENTRYPOINT [ "R","--no-save","--no-restore","--no-environ","--slave","-f","/start.R"]






