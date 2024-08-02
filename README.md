# server-scripts

包含了一些在服务器部署和维护过程中可能用到的便捷脚本。

- `auto-reboot.sh`
  - 检测服务器 screen 进程是否存在，如果不存在则重启。根据多次试验，这是最为有效的方法。
- ~~`backup.sh`~~
  - ~~与 crontab 搭配使用，复制目录至指定目录，并总维持指定目录内的目录数不变，删去最老的目录。~~
- ~~`deploy-mc.sh`~~
  - ~~实例刚刚创建好以后用于安装环境的脚本。~~
- `oss-archive.sh`
  - 服务器用于存档的脚本
- `oss-backup.sh`
  - 服务器用于定时备份的脚本
  
## 常用片段

- `$(date +%Y-%m-%d_%H:%M:%S)` —— 当前日期时间
- `screen -dm -S [SCREEN_NAME] [EXEC_PATH]` —— 用 screen 启动脚本并 detach，注意此指令不能间接执行
- `ls -tr | head -n -$max_keep_count | xargs --no-run-if-empty rm -rf` —— 保留某个目录下的 `max_keep_count` 个文件
- `blkid` —— 查看所有盘，可查看 UUID