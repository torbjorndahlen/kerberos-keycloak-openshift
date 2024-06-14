FROM registry.redhat.io/rhbk/keycloak-rhel9:24 as builder

FROM registry.redhat.io/rhbk/keycloak-rhel9:24
COPY --from=builder /opt/keycloak/ /opt/keycloak/

#ADD krb5.conf /etc/krb5.conf
#ADD rhbk.keytab /opt/keycloak/conf/rhbk.keytab

#USER root

#FROM registry.access.redhat.com/ubi9 AS ubi-micro-build
#RUN mkdir -p /mnt/rootfs && \
#    mkdir /krb5 && chmod 755 /krb5
#RUN dnf install --installroot /mnt/rootfs krb5-workstation --releasever 9 --setopt install_weak_deps=false --nodocs -y && \
#    dnf --installroot /mnt/rootfs clean all && \
#    rpm --root /mnt/rootfs -e --nodeps setup
    

#FROM registry.redhat.io/rhbk/keycloak-rhel9:24
#COPY --from=ubi-micro-build /mnt/rootfs /

#VOLUME ["/krb5","/dev/shm","/etc/krb5.conf.d"]



ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]


