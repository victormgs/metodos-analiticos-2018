FROM rocker/verse

RUN r -e 'devtools::install_github("rstudio/sparklyr")'
RUN r -e 'sparklyr::spark_install()'

RUN mkdir /home/rstudio/.cache \
  && mv /root/spark/ /home/rstudio/.cache \
  && chown -R rstudio:rstudio /home/rstudio/.cache
ENV RSTUDIO_SPARK_HOME /home/rstudio/.cache/spark/spark-2.0.2-bin-hadoop2.7

RUN cat /etc/os-release 

RUN apt-get update \ 
    && apt-get install -y libudunits2-dev 


RUN install2.r --error \
	arules \
	arulesViz \
	tidygraph \
	tidytext \
	textreuse \
	hash \
	text2vec \
	ggraph



