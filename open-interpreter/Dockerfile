FROM python:3.11

RUN pip install open-interpreter

COPY ./open-interpreter/profiles/codellama.yaml /root/.config/open-interpreter/profiles/codellama.yaml

ENTRYPOINT [ "interpreter", "--profile" ]
CMD [ "/root/.config/open-interpreter/profiles/codellama.yaml" ]
