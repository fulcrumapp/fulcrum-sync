FROM fulcrumapp/desktop

ENV DATA_PATH '/data'

ENV FULCRUM_DATA_PATH '/data/db'
ENV FULCRUM_MEDIA_PATH '/data'
ENV FULCRUM_REPORTS_PATH '/data/reports'
ENV FULCRUM_GPKG_PATH '/data/geopackage'

RUN fulcrum install-plugin --name postgres
RUN fulcrum install-plugin --name mssql
RUN fulcrum install-plugin --name media
RUN fulcrum install-plugin --name reports
RUN fulcrum install-plugin --name geopackage

RUN pip install awscli

RUN mv /root/.fulcrum/plugins /root/.fulcrum/plugins-all
RUN mkdir -p /root/.fulcrum/plugins

COPY scripts/start /usr/local/bin/start
COPY scripts/wait-for-postgres /usr/local/bin/wait-for-postgres

RUN mkdir -p $DATA_PATH

CMD '/usr/local/bin/start'
