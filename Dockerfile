FROM niuzhenyong/ubuntu

RUN apt-get update && \
    apt-get install --yes \
        git \
        apt-utils \
        ca-certificates \
        inotify-tools \
        lmodern \
        make \
        fontconfig \
        texlive-fonts-recommended \
        texlive-generic-recommended \
        texlive-lang-english \
        texlive-lang-chinese \
        texlive-xetex \
        latexmk && \
    apt-get autoclean && apt-get --purge --yes autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

# 增加方正四种免费字体
COPY founder/ /usr/share/fonts/truetype/founder/
RUN chmod 755 /usr/share/fonts/truetype/founder/* && fc-cache

WORKDIR /doc
VOLUME ["/doc"]
