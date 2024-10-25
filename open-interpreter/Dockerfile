FROM python:3.11

RUN pip install open-interpreter

WORKDIR /opt/app/open-interpreter

COPY ./open-interpreter/profiles/ollama.yaml /opt/app/open-interpreter/profiles/ollama.yaml

ENTRYPOINT [ "interpreter", "--profile", "/opt/app/open-interpreter/profiles/ollama.yaml" ]
CMD [ "--model", "ollama/codellama" ]
