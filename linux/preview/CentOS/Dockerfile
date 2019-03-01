# mssql-server-rhel
# Maintainers: Travis Wright (twright-msft on GitHub)
# GitRepo: https://github.com/twright-msft/mssql-server-rhel

# Base OS layer: latest CentOS 7
FROM centos:7

### Atomic/OpenShift Labels - https://github.com/projectatomic/ContainerApplicationGenericLabels
LABEL name="microsoft/mssql-server-linux" \
      vendor="Microsoft" \
      version="14.0" \
      release="1" \
      summary="MS SQL Server" \
      description="MS SQL Server is ....." \
### Required labels above - recommended below
      url="https://www.microsoft.com/en-us/sql-server/" \
      run='docker run --name ${NAME} \
        -e ACCEPT_EULA=Y -e SA_PASSWORD=RedHat!23 -e MSSQL_PID=Express \
        -p 1433:1433 \
        -d  ${IMAGE}' \
      io.k8s.description="MS SQL Server is ....." \
      io.k8s.display-name="MS SQL Server"

# Install latest mssql-server package
RUN curl -o /etc/yum.repos.d/mssql-server.repo https://packages.microsoft.com/config/rhel/7/mssql-server-2017.repo && \
    curl -o /etc/yum.repos.d/msprod.repo https://packages.microsoft.com/config/rhel/7/prod.repo && \
    ACCEPT_EULA=Y yum install -y mssql-server mssql-tools unixODBC-devel nodejs && \
    yum clean all

COPY uid_entrypoint /opt/mssql-tools/bin/
ENV PATH=${PATH}:/opt/mssql/bin:/opt/mssql-tools/bin
ENV ACCEPT_EULA=Y
ENV SA_PASSWORD=RedHat!23
ENV MSSQL_PID=Express

RUN mkdir -p /usr/sql/bin
COPY *.sh /usr/sql/bin/
COPY *.sql /usr/sql/bin/
COPY *.csv /usr/sql/bin/

RUN mkdir -p /var/opt/mssql/data && \
    chmod -R g=u /var/opt/mssql /etc/passwd
RUN chmod +wx /usr/sql/bin/*

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

### Containers should not run as root as a good practice
USER 10001

# Default SQL Server TCP/Port
EXPOSE 1433

VOLUME /var/opt/mssql/data

### user name recognition at runtime w/ an arbitrary uid - for OpenShift deployments
ENTRYPOINT [ "uid_entrypoint" ]
# Run SQL Server process
CMD /bin/bash /usr/sql/bin/entrypoint.sh
#CMD sqlservr
