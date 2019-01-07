FROM centos:7

RUN  yum -y install wget

# Install JDK 8 and Scala 2.12
RUN  yum -y install java-1.8.0-openjdk
RUN  yum -y install https://downloads.lightbend.com/scala/2.12.7/scala-2.12.7.rpm

# Install Python 3.6 and Pip
RUN  yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN  yum -y install python36u-pip
RUN  pip3.6 install --upgrade pip

# Install Spark
RUN  wget http://apache.claz.org/spark/spark-2.4.0/spark-2.4.0-bin-hadoop2.7.tgz
RUN  tar -xzf spark-2.4.0-bin-hadoop2.7.tgz -C /opt
RUN  ln -s /opt/spark-2.4.0-bin-hadoop2.7 /opt/spark

# Install Jupyter Lab
RUN  pip3.6 install jupyterlab

# Clean up
RUN yum remove -y wget && rm -f spark-2.4.0-bin-hadoop2.7.tgz
RUN yum clean all

# ENV Variables
ENV SPARK_HOME /opt/spark
ENV PATH="/opt/spark/bin:${PATH}"
ENV PYTHONPATH="$SPARK_HOME/python:$SPARK_HOME/python/lib/py4j-0.10.7-src.zip:$PYTHONPATH"
ENV PYSPARK_DRIVER_PYTHON "jupyter"
ENV PYSPARK_PYTHON python3.6


WORKDIR /usr/dev/spark

ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--NotebookApp.token=''", "--NotebookApp.password=''", "--allow-root"]

