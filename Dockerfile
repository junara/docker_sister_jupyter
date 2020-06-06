FROM jupyter/scipy-notebook
COPY requirements.txt /home/jovyan
RUN pip install -r /home/jovyan/requirements.txt
