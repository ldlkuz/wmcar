#!/bin/bash
echo "----------------------------------------------"
echo "-----飞鱼系统-----破解车机环境配置脚本 -----V1.0" 
echo "----特别感谢@夕阳下午睡的猫 提供的支持 -------"
echo "----------------------------------------------"
echo "                   | |                        "
echo "挂载本地存储，弹窗请允许"
sleep 2
termux-setup-storage
echo "更换清华源，安装卡住请输入 y 回车"
sleep 2
echo "deb https://mirrors.tuna.tsinghua.edu.cn/termux stable main" > $PREFIX/etc/apt/sources.list.d/tuna.list
pkg update -y && pkg upgrade -y
# 安装Android-tools
echo "安装adb工具，安装卡住请输入 y 回车"
sleep 2
# 安装Android-tools
pkg install -y android-tools  
echo "装下载工具"
sleep 2
pkg install -y curl 
echo "下载工具包"
curl -O https://quesans.com/down/down/wanmei.zip
echo "解压并移动到sdcard/wanmei目录"
unzip wanmei.zip
sleep 1
mv wanmei /sdcard/
read -p "$(LANG=C echo '环境配置完成，请检查是否有错误，按回车键继续')" key
sh /sdcard/wanmei/wanmei.sh