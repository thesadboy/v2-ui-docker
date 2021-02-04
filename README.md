# V2-UI Docker 版

> 基于 https://github.com/sprov065/v2-ui 制作的 Docker镜像

v2-ui 使用说明：https://github.com/sprov065/v2-ui/blob/master/README.md

### Docker版本说明

数据备份：`docker cp v2-ui:/etc/v2-ui/v2-ui.db .`

数据还原：`docker cp v2-ui.db v2-ui:/etc/v2-ui/`

拉取镜像：`docker push thesadboy/v2-ui`

创建容器：`docker run --name v2-ui -d -p 65432:65432 -p 8000-8050:8000-8050/tcp -p 8000-8050:8000-8050/udp thesadboy/v2-ui`

注意：8000-8050是你创建账户用到的端口（同时绑定了TCP/UDP 协议，不建议绑定太多端口），65432 是管理页面访问端口，本地端口也可看自己需求改动，请注意在宿主机上将以上端口放行

***<u>说明：未实际测试，仅在本地测试可正常运行，大家可以先试试啊，哈哈哈</u>***