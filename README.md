# V2-UI Docker 版

> 基于 https://github.com/sprov065/v2-ui 制作的 Docker镜像，原汁原味，未做任何改动

v2-ui 使用说明：https://github.com/sprov065/v2-ui/blob/master/README.md

### Docker版本说明

数据备份（旧）：`docker cp v2-ui:/etc/v2-ui/v2-ui.db .`

数据还原（旧）：`docker cp v2-ui.db v2-ui:/etc/v2-ui/`

最新版本可直接绑定数据存放目录，不用额外备份

拉取镜像：`docker push thesadboy/v2-ui`

创建容器：`docker run --restart=always --name v2-ui -d -p 65432:65432 -p 8000-8010:8000-8010/tcp -p 8000-8010:8000-8010/udp --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /你的数据存放路径(最好是绝对路径):/etc/v2-ui thesadboy/v2-ui`

注意：8000-8010是你创建账户用到的端口（同时绑定了TCP/UDP 协议，不建议绑定太多端口），65432 是管理页面访问端口，本地端口也可看自己需求改动，请注意在宿主机上将以上端口放行