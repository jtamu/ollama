# build from https://github.com/jtamu/x11-test
FROM x11client

# 必要なパッケージのインストール
RUN apt install -y python3-pip python3-venv

# 仮想環境の作成
RUN python3 -m venv /opt/venv

# 仮想環境をアクティブにする
ENV PATH="/opt/venv/bin:$PATH"

# 仮想環境内でpipを最新化
RUN pip install --upgrade pip

RUN pip install open-interpreter

WORKDIR /opt/app/open-interpreter

COPY ./open-interpreter/profiles/ollama.yaml /opt/app/open-interpreter/profiles/ollama.yaml
