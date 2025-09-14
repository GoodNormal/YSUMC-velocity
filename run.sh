#!/bin/bash

# 同步代码库
echo "正在同步代码库..."
git pull origin main

if [ $? -ne 0 ]; then
    echo "Git pull 失败，请检查网络连接或仓库状态"
    exit 1
fi

echo "代码库同步完成"

# 启动Velocity代理服务器
echo "正在启动Velocity服务器..."
"/data/program/java/java21/bin/java" -Xms512m -Xmx512m -javaagent:authlib-injector.jar=https://skin.mualliance.ltd/api/union/yggdrasil -Dfile.encoding=UTF-8 -Duser.language=zh -Duser.country=CN -jar velocity.jar

echo "服务器已停止"