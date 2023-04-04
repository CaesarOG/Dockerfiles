FROM ubuntu

WORKDIR /root

COPY . .

ENV valuetest=value

EXPOSE 8888

RUN apt update && apt upgrade && apt install zsh -y && chsh -s $(which zsh) && \
    apt install wget curl vim git -y

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    sed -i 's/^plugins=\(.*\)/plugins=\(git zsh-autosuggestions zsh-syntax-highlighting\)/g' .zshrc

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh && chmod +x Mambaforge-Linux-x86_64.sh

RUN ./Mambaforge-Linux-x86_64.sh -b -p /usr/local/anaconda3 && /usr/local/anaconda3/bin/conda init zsh bash

SHELL [ "/usr/bin/zsh", "--login", "-c"]

RUN source .zshrc && mamba install -c conda-forge jupyter jupyterlab -y && mv ./scripts/* .

RUN source .zshrc && jupyter notebook --generate-config && python password.py && ./run.sh

RUN source .zshrc && mamba create -n cling && \
    conda activate cling && mamba install xeus-cling -c conda-forge -y && mamba install -c conda-forge jupyter jupyterlab -y

RUN mkdir Cpp && rm ./Mambaforge-Linux-x86_64.sh *.txt && mv *.sh *.py Dockerfile ./scripts

WORKDIR /root/Cpp

CMD [ "/usr/bin/zsh", "../scripts/jupyter.sh"]