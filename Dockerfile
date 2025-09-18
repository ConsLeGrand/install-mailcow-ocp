FROM registry.access.redhat.com/ubi9/ubi

# Installer postfix
RUN dnf install -y postfix && dnf clean all

# Copier ta conf personnalisée
COPY main.cf /etc/postfix/main.cf
#COPY master.cf /etc/postfix/master.cf

# Exposer le port SMTP
EXPOSE 25

# Lancer postfix en mode foreground
CMD ["postfix", "start-fg"]
