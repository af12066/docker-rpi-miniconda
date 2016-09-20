FROM		hypriot/rpi-python
MAINTAINER	T. H.
ENV		CFLAGS -O2
ENV		HOME /root
ENV		PYENV_ROOT $HOME/.pyenv
ENV		PATH $PYENV_ROOT/bin:$PATH

RUN		apt-get update && apt-get upgrade -y
RUN		apt-get install -y git make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils
RUN		git clone https://github.com/yyuu/pyenv.git ~/.pyenv
RUN		pyenv install miniconda3-latest
RUN		pyenv global miniconda3-latest && pyenv rehash
RUN		conda install anaconda-client
RUN		pip install --upgrade pip
RUN		pip install pep8
