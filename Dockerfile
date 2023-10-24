# Dockerfile VERSION = v0.8
# docker login registry.cmbi.umcn.nl
# docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') -t registry.cmbi.umcn.nl/x-omics-action-dataset/action_nextflow/miniconda-snf:$VERSION . 
# docker push registry.cmbi.umcn.nl/x-omics-action-dataset/action_nextflow/miniconda-snf:$VERSION
# sudo docker pull registry.cmbi.umcn.nl/x-omics-action-dataset/action_nextflow/miniconda-snf$VERSION
# sudo docker images # to get IMAGE_ID
# sudo docker save $IMAGE_ID -o miniconda-snf.tar
# sudo singularity build miniconda-snf.sif docker-archive://miniconda-snf.tar

FROM continuumio/miniconda3
ARG DEBIAN_FRONTEND=noninteractive
ARG BUILD_DATE

LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vendor="Radboudumc, Medical Biosciences department"
LABEL maintainer="casper.devisser@radboudumc.nl"

WORKDIR /container

# Python packages
RUN pip install snfpy==0.2.2 \
    && pip install pandas==1.4.1 \
    && pip install matplotlib==3.5.2 \
    && pip install papermill==2.4.0 \
    && pip install ipykernel==6.16.0 \
    && pip install statsmodels==0.13.2 \
    && pip install seaborn==0.12.2 \
    && pip install Jinja2==3.1.2

# Install base env as ipykernel
RUN python -m ipykernel install --name base --user 

# Installations for Nextflow metrics, 'ps' command
RUN apt-get update && apt-get install -y procps && rm -rf /var/lib/apt/lists/*

CMD ["/bin/bash"]