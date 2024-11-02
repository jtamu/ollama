FROM python:3.11

RUN mkdir /work
RUN mkdir /opt/app && cd /opt/app && git clone https://github.com/mpoon/gpt-repository-loader

WORKDIR /opt/app/gpt-repository-loader

ENTRYPOINT [ "python3", "gpt_repository_loader.py" ]
CMD [ "/work/example_repo", "-o", "example.txt" ]
