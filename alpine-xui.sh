#!/bin/sh
#
# check root
[[ $EUID -ne 0 ]] && echo -e "${red}错误：${plain} 必须使用root用户运行此脚本！\n" && exit 1

# check os
if cat /etc/issue | grep -Eqi "alpine"; then
    release="alpine"
else
    echo -e "${red}未检测到系统版本，请联系脚本作者！${plain}\n" && exit 1
fi

arch=$(arch)

if [[ $arch == "x86_64" || $arch == "x64" || $arch == "amd64" ]]; then
    arch="amd64"
elif [[ $arch == "aarch64" || $arch == "arm64" ]]; then
    arch="arm64"
else
    arch="amd64"
    echo -e "${red}检测架构失败，使用默认架构: ${arch}${plain}"
fi

os_version=""

# os version
if [[ -f /etc/os-release ]]; then
    os_version=$(awk -F'[= ."]' '/VERSION_ID/{print $3}' /etc/os-release)
fi
if [[ -z "$os_version" && -f /etc/lsb-release ]]; then
    os_version=$(awk -F'[= ."]+' '/DISTRIB_RELEASE/{print $2}' /etc/lsb-release)
fi

if [[ x"${release}" == x"alpine" ]]; then
    if [[ ${os_version} -le 3 ]]; then
        echo -e "${red}请使用 Alpine 3 或更高版本的系统！${plain}\n" && exit 1
    fi
fi


echo "检查安装环境"
apk add curl && apk add bash && apk add sudo && apk add wget
mkdir /lib64
cp /lib/ld-musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

echo "安装Alpine所需文件"
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/alpine-xui/main/Dependency/x-ui.db -o x-ui.db
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/alpine-xui/main/Dependency/config.json -o config.json
curl -Ls https://raw.githubusercontent.com/Lynn-Becky/alpine-xui/main/Dependency/x-ui -o x-ui
mv x-ui.db /etc/x-ui/
mv x-ui /etc/init.d/
mv config.json  /usr/local/x-ui/bin/
chown 501.dialout /etc/x-ui/x-ui.db
chown 501.dialout /usr/local/x-ui/bin/config.json
chmod +x /etc/init.d/x-ui
chmod 0644 /etc/x-ui/x-ui.db
chmod 0644 /usr/local/x-ui/bin/config.json
rc-update add /etc/init.d/x-ui
/etc/init.d/x-ui start

# install x-ui
bash <(curl -Ls https://raw.githubusercontent.com/Lynn-Becky/x-ui/main/install.sh)

echo -e "${plain}x-ui安装完成"
echo -e "${green}正在启动x-ui...."
/etc/init.d/x-ui restart
