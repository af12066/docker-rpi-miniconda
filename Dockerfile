FROM		hypriot/rpi-python
MAINTAINER	T. H.
ENV		CFLAGS -O2
RUN		apt-get update && apt-get upgrade -y
RUN		apt-get install -y git
RUN		git clone https://github.com/yyuu/pyenv.git ~/.pyenv
RUN		echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
RUN		echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
RUN		echo 'eval "$(pyenv init -)"' >> ~/.bashrc
RUN		exec $SHELL
# 以下のパッケージはpyenvに必要
RUN		apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev
RUN		apt-get install -y libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils
RUN		pyenv install miniconda3-latest
RUN		pyenv global miniconda3-latest && pyenv rehash
RUN		conda install anaconda-client
RUN		pip install --upgrade pip
RUN		pip install pep8
