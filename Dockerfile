FROM fulcrumapp/desktop

ENV DATA_PATH '/data'

RUN fulcrum install-plugin --name postgres
RUN fulcrum install-plugin --name media
RUN fulcrum install-plugin --name reports
RUN fulcrum install-plugin --name geopackage

RUN mv /root/.fulcrum/plugins /root/.fulcrum/plugins-all
RUN mkdir -p /root/.fulcrum/plugins

COPY scripts/start /usr/local/bin/start
COPY scripts/wait-for-postgres /usr/local/bin/wait-for-postgres

RUN mkdir -p $DATA_PATH

CMD '/usr/local/bin/start'
