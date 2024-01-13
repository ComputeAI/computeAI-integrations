# Set the base image using miniconda 
FROM jupyter/base-notebook

USER root

# Installs, clean, and update   
RUN sudo apt-get update \
    && sudo apt-get install gcc build-essential libsasl2-dev -y

USER jovyan

# Set environmental variable(s)
ENV ACCEPT_INTEL_PYTHON_EULA=yes

# Add requirements file 
ADD requirements.txt /app/

# Installs, clean, and update   
RUN pip install --upgrade pip \ 
    && pip install -r /app/requirements.txt 

ADD tpchDemo.ipynb /home/jovyan/work
ADD tpcdsDemo.ipynb /home/jovyan/work
ADD tpchHdfsDemo.ipynb /home/jovyan/work
ADD tpcdsHdfsDemo.ipynb /home/jovyan/work
ADD tpchFileDatasetDemo.ipynb /home/jovyan/work
ADD tpcdsFileDatasetDemo.ipynb /home/jovyan/work

CMD start-notebook.sh
