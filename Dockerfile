FROM scratch
MAINTAINER "Adam Buran <aburan28@gmail.com>"
ADD oraclelinux-7.4-rootfs.tar.xz /

# Strictly used in a namespaced environment only 
USER root
RUN yum update -y && yum upgrade -y && yum clean all && rm -rf /var/cache/yum
RUN yum remove wget curl ssh* -y 

ONBUILD RUN yum update -y && yum clean all
CMD ["/bin/bash"]
