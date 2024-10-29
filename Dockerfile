# alpine avoids a lot of HIGH/CRIT vulns, recent stable
# python3, recent stable - 3.13 is only just out
FROM python:3.12-alpine3.20 AS base-env

# this gets us bash, expected by nextflow
# also install libcurl4 for pysam
RUN apk add --no-cache curl-dev bash
RUN pip install setuptools

# ---

FROM base-env AS build-env

RUN apk add autoconf automake make gcc musl-dev perl bash zlib-dev bzip2-dev xz-dev openssl-dev

COPY . .
RUN pip install -r requirements.txt \
 && cd crc \
 && python3 setup.py install

# ---

FROM base-env

# install all the python libs from the build env
COPY --from=build-env /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=build-env /usr/local/bin/clockwork /usr/local/bin/clockwork

# do not buffer stdout/stderr
ENV PYTHONUNBUFFERED=1

# set bash as the login shell
ENTRYPOINT ["/bin/bash", "-l", "-c"]
