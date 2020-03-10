FROM python:2.7-alpine

RUN mkdir -p /tests
RUN pip install -U pip
COPY python-required-libraries.txt / 
RUN pip install --no-cache-dir -r python-required-libraries.txt
RUN rm -rf /python-required-libraries.txt
RUN pip install webdrivermanager
RUN webdrivermanager firefox chrome --linkpath /usr/local/bin
#RUN apt install tk-dev

RUN apk update && apk add --no-cache bash \
    alsa-lib \
    at-spi2-atk \
    atk \
    cairo \
    cups-libs \
    dbus-libs \
    eudev-libs \
    expat \
    flac \
    gdk-pixbuf \
    glib \
    libgcc \
    libjpeg-turbo \
    libpng \
    libwebp \
    libx11 \
    libxcomposite \
    libxdamage \
    libxext \
    libxfixes \
    tzdata \ 
    python3-tkinter \
    libexif \
    udev \
    xvfb \
    zlib-dev \
    chromium \
    chromium-chromedriver

COPY custom-libraries        /tests/custom-libraries
COPY keywords                /tests/keywords
COPY entrypoint.sh           /tests/entrypoint.sh
COPY data                    /tests/data
COPY element_mapping         /tests/element_mapping
COPY results                 /tests/results
COPY support                 /tests/support
COPY tests                   /tests/tests


RUN chmod +x /tests/entrypoint.sh

WORKDIR /tests

ENTRYPOINT ["/tests/entrypoint.sh"]
CMD ["--help"]