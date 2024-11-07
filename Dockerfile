FROM condaforge/mambaforge:24.9.0-0

# do not buffer stdout/stderr
ENV PYTHONUNBUFFERED=1

# do not print deprecation warnings
# warning is: DeprecationWarning: pkg_resources is deprecated as an API.
ENV PYTHONWARNINGS="ignore::DeprecationWarning"

COPY . .
RUN pip3 install -r requirements.txt \
 && cd clockwork \
 && python3 setup.py install
