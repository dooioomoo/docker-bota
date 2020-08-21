# 受到ifui/baota的启发，并引用了 ifui/baota 的部分配置

非常棒的宝塔配置脚本。具体请参考 [ifui/baota](https://github.com/ifui/baota)


# 使用方法


1. 在计算机某处创建一个目录，用来存放服务器内容

2. 从github下载

```git
git clone https://github.com/dooioomoo/docker-bota.git ./
```

3. ``` copy .env-example .env ```

4. windows下运行build.bat,或者

```cmd
docker-compose -p bota up -d --build bota && docker exec -it os sh entrypoint.sh /bin/bash
```


# 修改项目

- env文件增加了xdebug的expose端口对应。默认是9003，方便宝塔对应远程php调试。

- 修改了sh脚本，以对应修改过的路径

- windows下的sh脚本COPY后，会变成DOS格式。增加了```sed -i "s/\r//"```进行修复。

- 为了方便观察，修改了services的命名为bota及bota_backup

- 让宝塔完美运行在/usr/sbin/init下

- 修正docker因为dns配置无效导致的宝塔无法安装软件

- 加入修改宝塔默认帐户和密码的功能

- 自动去除入口限制


- 运行build.bat自动pull centos，自动下载宝塔的install.sh并安装

- 两个service： os,backup


### 备份机能


```
sh /docker_backup/export.sh
```

```
sh /docker_backup/import.sh
```

