# V2-UI Docker 版

> 基于 https://github.com/sprov065/v2-ui 制作的 Docker镜像，原汁原味，未做任何改动

v2-ui 使用说明：https://github.com/sprov065/v2-ui/blob/master/README.md

### Docker版本说明

**该版本将不再维护，后续只维护 x-ui docker 版本: https://hub.docker.com/r/thesadboy/x-ui**

数据迁移到 x-ui docker版本：

1. 进入容器：`docker exec -it v2-ui /bin/bash`
2. 安装 x-ui：`bash <(curl -Ls https://raw.githubusercontent.com/sprov065/x-ui/master/install.sh)`
3. 迁移数据：执行 `x-ui v2-ui` 
4. 复制数据：`cp /etc/x-ui/x-ui.db /etc/v2-ui/x-ui.db`
5. 退出容器：`exit`
6. 此时，在你v2-ui数据目录下就有一个x-ui.db 的数据库文件了，安装x-ui docker版本，数据库目录设定为该目录即可


拉取镜像：`docker pull thesadboy/v2-ui`

创建容器：`docker run --restart=always --name v2-ui -d -p 65432:65432 -p 8000-8010:8000-8010/tcp -p 8000-8010:8000-8010/udp --tmpfs /tmp --tmpfs /run --tmpfs /run/lock -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /你的数据存放路径(最好是绝对路径):/etc/v2-ui thesadboy/v2-ui`

注意：8000-8010是你创建账户用到的端口（同时绑定了TCP/UDP 协议，不建议绑定太多端口），65432 是管理页面访问端口，本地端口也可看自己需求改动，请注意在宿主机上将以上端口放行