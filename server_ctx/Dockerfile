FROM centos
MAINTAINER nagaraju@us.ibm.com
ENV INFORMIXDIR /opt/ibm/informix/
ENV LD_LIBRARY_PATH /lib64
RUN mkdir /opt/ibm/  &&  mkdir /opt/ibm/informix
#VOLUME ["/opt/ibm/informix/", "/opt/ibm/data/"]
VOLUME ["/opt/ibm/data/"]
RUN yum -y update && yum -y install libaio sysstat libgcc libstdc compat-libstdc++-33 gcc kernel-headers kernel-devel net-tools.x86_64
RUN /usr/sbin/groupadd -g 102 -f informix
RUN ["/usr/sbin/useradd", "-m", "-g 102", "-u 200", "informix"]
RUN /bin/bash -c 'echo "informix:changeme" | /usr/sbin/chpasswd'
ADD iif.12.10.tar /opt/ibm/informix/
ADD bundle.properties /tmp/bundle.properties
RUN /opt/ibm/informix/ids_install -i silent -f /tmp/bundle.properties
RUN /bin/bash -c 'chown informix:informix /opt/ibm/data/'
RUN /bin/bash -c '/bin/rm -rf /opt/ibm/informix/ids_install /opt/ibm/informix/IBM_Data_Server_Driver_Package /opt/ibm/informix/CSDK /opt/ibm/informix/ICONNECT /opt/ibm/informix/JDBC /opt/ibm/informix/SDK /opt/ibm/informix/SERVER'

USER informix
RUN /bin/bash -c 'cp /opt/ibm/informix//etc/onconfig.std /opt/ibm/informix//etc/onconfig'
RUN /bin/bash -c 'cp /opt/ibm/informix//etc/sqlhosts.std /opt/ibm/informix//etc/sqlhosts'
ADD schema1.sql /opt/ibm/
ADD schema2.sql /opt/ibm/
ADD parallel_iud.ec /opt/ibm/
ADD parallel_iud /opt/ibm/
ADD cmds /opt/ibm/
ADD rename.sql /opt/ibm/
ADD alter.sql /opt/ibm/
ADD load.sql /opt/ibm/
#ADD ext_load.sql /opt/ibm/
#ADD ext_unload.sql /opt/ibm/
#ADD ext.sql /opt/ibm/
#ADD initpipe.sh /opt/ibm/
ADD 01_schema1.sh /opt/ibm/
ADD 02_initload.sh /opt/ibm/
ADD 03_apps.sh /opt/ibm/
ADD 04_schema2.sh /opt/ibm/
ADD 05_copydata.sh /opt/ibm/
ADD 06_updcfg.sh /opt/ibm/
ADD 07_defserv.sh /opt/ibm/
ADD 08_defrepl.sh /opt/ibm/
ADD 09_chkrepl.sh /opt/ibm/
ADD 10_delrepl.sh /opt/ibm/
ADD 11_rename.sh /opt/ibm/
ADD 12_apps.sh /opt/ibm/

USER root

WORKDIR /opt/ibm
ENTRYPOINT ["/opt/ibm/boot.sh"]
CMD ["--start"]
EXPOSE 60000
ADD boot.sh /opt/ibm/
