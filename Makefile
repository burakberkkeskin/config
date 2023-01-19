default:
	echo "Welcome to my arch linux setup makefile"
	echo "updating your packages first"
	pacman -Syyu --noconfirm

update:
	pacman -Syyu --noconfirm

git:
	pacman -S git --noconfirm

base-devel:
	pacman -S --needed base-devel --noconfirm

yay: git base-devel
	git clone https://aur.archlinux.org/yay.git
	USER=$(shell whoami)
	chown -R  $(USER):$(USER) yay
	cd yay ; makepkg -si --noconfirm

brave:
	yay -S brave-bin --noconfirm

discord:
	yay -S discord_arch_electron --noconfirm

spotify:
	yay -S spotify --noconfirm

mailspring:
	yay -S mailspring --noconfirm

flameshot:
	yay -S flameshot --noconfirm

kazam:
	yay -S kazam --noconfirm

qbittorrent:
	yay -S qbittorrent --noconfirm

btop:
	yay -S btop --noconfirm

openvpn:
	yay -S openvpn3 --noconfirm

wireguard:
	yay -S wireguard-tools --noconfirm


clients: brave discord spotify mailspring flameshot kazam qbittorrent btop openvpn wireguard

nodejs:
	pacman -S nodejs npm --noconfirm

python: 
	pacman -S python --noconfirm

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

go:
	pacman -S go --noconfirm

typescript: nodejs
	npm install -g typescript

vscode:
	yay -S code --noconfirm

terminator:
	yay -S terminator --noconfirm

zsh:
	yay -S zsh --noconfirm

ohmyz: zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 

vim:
	yay -S vim --noconfirm

dbeaver:
	yay -S dbeaver --noconfirm

docker:
	yay -S docker docker-buildx docker-compose --noconfirm

kubectl:
	yay -S kubectl --noconfirm

act:
	yay -S act-bin --noconfirm

ansible:
	yay -s ansible --noconfirm

dive:
	yay -S dive --noconfirm

awscli:
	yay -S aws-cli-v2 --noconfirm

postman:
	yay -S postman-bin --noconfirm

infracost:
	curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | sh

trivy:
	yay -S trivy --noconfirm

zenv:
	yay -S zenv --noconfirm

xdm:
	yay -S xdman --noconfirm

terraform:
	yay -S terraform --noconfirm

developer: nodejs python rust go typescript vscode terminator zsh ohmyz vim dbeaver docker kubectl act ansible dive awscli postman infracost trivy zenv xdm terraform

clean:
	echo "cleaning"
