# select base image
FROM alpine

# set envirmonment variables
# ENV 

#  
ADD supervisord.conf /etc/supervisord.conf
ADD ./kdc_entrypoint.sh /

# RUN any command that is support from the base image i.e. package manager
RUN apk add --no-cache krb5-server krb5 supervisor tini

# Open ports within the container
EXPOSE 749 464 88

# Entry point script
ENTRYPOINT ["/sbin/tini", "--"]

# Finaly what commands to run at start of the container
CMD ["/kdc_entrypoint.sh"]

