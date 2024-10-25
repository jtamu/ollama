FROM python:3.11

RUN pip install open-interpreter

WORKDIR /opt/app/open-interpreter

COPY ./open-interpreter/profiles/codellama.yaml /opt/app/open-interpreter/profiles/codellama.yaml

ENTRYPOINT [ "interpreter", "--profile" ]
CMD [ "/opt/app/open-interpreter/profiles/codellama.yaml" ]
