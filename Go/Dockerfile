FROM ubuntu

WORKDIR /root

COPY . .

ENV GO_V=1.20.3

EXPOSE 8888

RUN apt update && apt upgrade && apt install zsh -y && chsh -s $(which zsh) && \
    apt install wget curl vim git -y

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions && \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting && \
    sed -i 's/^plugins=\(.*\)/plugins=\(git zsh-autosuggestions zsh-syntax-highlighting\)/g' .zshrc

SHELL [ "/usr/bin/zsh", "--login", "-c"]

RUN wget "https://go.dev/dl/go"$GO_V".linux-amd64.tar.gz" && tar -C /usr/local -xzf "go"$GO_V".linux-amd64.tar.gz"

RUN mkdir Projects && rm "go"$GO_V".linux-amd64.tar.gz" && mkdir /usr/local/gopath

RUN echo "\n"\
"GO=\"/usr/local/go/bin\"\n"\
"export GOPATH=\"/usr/local/gopath\"\n"\
"\n"\
"export PATH=\"\$GO:\$PATH\"" >> .zshrc

WORKDIR /root/Projects

CMD [ "/usr/bin/zsh", "-c", "while true; do sleep 1; done"]