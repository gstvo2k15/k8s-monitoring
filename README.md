# k8s-monitoring
Simple repo for k8s-monitoring with Helm deployment


## Usage
```
helm package elk
Successfully packaged chart and saved it to: /root/tomcat/Helm-charts/elk-1.0.0.tgz

helm upgrade elk elk-1.0.0.tgz -n elk --create-namespace
Release "elk" has been upgraded. Happy Helming!


kubectl get pods -o wide -n elk
NAME                             READY   STATUS              RESTARTS   AGE     IP              NODE         NOMINATED NODE   READINESS GATES
elasticsearch-68d7885f59-zpv2n   0/1     ContainerCreating   0          2m45s   <none>          k8s-node01   <none>           <none>
kibana-5f7d6599bf-psr6n          1/1     Running             0          2m45s   172.16.85.221   k8s-node01   <none>           <none>
logstash-54795bb8df-ww87k        0/1     ContainerCreating   0          2m45s   <none>          k8s-node01   <none>           <none>


kubectl get svc -o wide -n elk
NAME            TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE     SELECTOR
elasticsearch   NodePort    10.107.83.122   <none>        9200:30092/TCP   6m40s   app=elasticsearch
kibana          ClusterIP   10.101.8.40     <none>        5601/TCP         6m40s   app=kibana
logstash        ClusterIP   10.97.121.163   <none>        5044/TCP         6m40s   app=logstash




root@k8s-node01:~# kubectl get pods -o wide -n elk
NAME                             READY   STATUS                   RESTARTS      AGE   IP              NODE         NOMINATED NODE   READINESS GATES
elasticsearch-68d7885f59-44fqs   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-47gdh   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-47vbp   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-4sm62   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-4z8h6   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-5kwnn   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-5t4d7   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-76wxw   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-8mt96   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-b6zfm   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-bbkx6   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-dw8xt   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-fm8h2   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-gffcj   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-gjvk2   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-h99hv   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-hdttz   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-hg9k2   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-lq6h6   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-lzv2k   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-nkxps   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-nncg7   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-nxvvv   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-prvlq   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-pvd4t   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-ql8pr   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-qsjtg   1/1     Running                  8 (22h ago)   23h   172.16.85.238   k8s-node01   <none>           <none>
elasticsearch-68d7885f59-s6gnk   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-sfd4l   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-sgclk   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-tg2fz   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-ttxk4   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-w5wlx   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-wb7tw   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-wjpb2   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-xjmlw   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-xwdqg   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-zl56p   0/1     ContainerStatusUnknown   0             23h   <none>          k8s-node01   <none>           <none>
elasticsearch-68d7885f59-zpv2n   0/1     ContainerStatusUnknown   4 (23h ago)   23h   <none>          k8s-node01   <none>           <none>
kibana-5f7d6599bf-psr6n          1/1     Running                  1 (84m ago)   23h   172.16.85.234   k8s-node01   <none>           <none>
```



### In KIBANA URL for connecto to k8s elastic:
```
http://192.168.1.151:30094/

use: https://192.168.1.151:30092


Verification required

Copy the code from the Kibana server or run bin\kibana-verification-code.bat to retrieve it.


kubectl logs -n elk -l app=kibana --tail=50 | grep "verification code"
Your verification code is:  970 420




stern . -n elk --tail 5
+ elasticsearch-68d7885f59-qsjtg › elasticsearch
+ elasticsearch-68d7885f59-zpv2n › elasticsearch
+ kibana-5f7d6599bf-psr6n › kibana
elasticsearch-68d7885f59-qsjtg elasticsearch {"@timestamp":"2025-03-20T17:43:49.672Z", "log.level": "WARN", "message":"received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=/172.16.85.238:9200, remoteAddress=/172.16.85.234:58202}", "ecs.version": "1.2.0","service.name":"ES_ECS","event.dataset":"elasticsearch.server","process.thread.name":"elasticsearch[elasticsearch-68d7885f59-qsjtg][transport_worker][T#2]","log.logger":"org.elasticsearch.http.netty4.Netty4HttpServerTransport","elasticsearch.cluster.uuid":"mQ7Pc4gySUae8B4x0x2XdQ","elasticsearch.node.id":"xXAzeTSMQSi7L4NxHMiCng","elasticsearch.node.name":"elasticsearch-68d7885f59-qsjtg","elasticsearch.cluster.name":"docker-cluster"}
elasticsearch-68d7885f59-qsjtg elasticsearch {"@timestamp":"2025-03-20T17:43:54.658Z", "log.level": "WARN", "message":"received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=/172.16.85.238:9200, remoteAddress=/172.16.85.234:58214}", "ecs.version": "1.2.0","service.name":"ES_ECS","event.dataset":"elasticsearch.server","process.thread.name":"elasticsearch[elasticsearch-68d7885f59-qsjtg][transport_worker][T#1]","log.logger":"org.elasticsearch.http.netty4.Netty4HttpServerTransport","elasticsearch.cluster.uuid":"mQ7Pc4gySUae8B4x0x2XdQ","elasticsearch.node.id":"xXAzeTSMQSi7L4NxHMiCng","elasticsearch.node.name":"elasticsearch-68d7885f59-qsjtg","elasticsearch.cluster.name":"docker-cluster"}
elasticsearch-68d7885f59-qsjtg elasticsearch {"@timestamp":"2025-03-20T17:43:54.665Z", "log.level": "WARN", "message":"received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=/172.16.85.238:9200, remoteAddress=/172.16.85.234:58222}", "ecs.version": "1.2.0","service.name":"ES_ECS","event.dataset":"elasticsearch.server","process.thread.name":"elasticsearch[elasticsearch-68d7885f59-qsjtg][transport_worker][T#2]","log.logger":"org.elasticsearch.http.netty4.Netty4HttpServerTransport","elasticsearch.cluster.uuid":"mQ7Pc4gySUae8B4x0x2XdQ","elasticsearch.node.id":"xXAzeTSMQSi7L4NxHMiCng","elasticsearch.node.name":"elasticsearch-68d7885f59-qsjtg","elasticsearch.cluster.name":"docker-cluster"}
elasticsearch-68d7885f59-qsjtg elasticsearch {"@timestamp":"2025-03-20T17:43:54.680Z", "log.level": "WARN", "message":"received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=/172.16.85.238:9200, remoteAddress=/172.16.85.234:58236}", "ecs.version": "1.2.0","service.name":"ES_ECS","event.dataset":"elasticsearch.server","process.thread.name":"elasticsearch[elasticsearch-68d7885f59-qsjtg][transport_worker][T#1]","log.logger":"org.elasticsearch.http.netty4.Netty4HttpServerTransport","elasticsearch.cluster.uuid":"mQ7Pc4gySUae8B4x0x2XdQ","elasticsearch.node.id":"xXAzeTSMQSi7L4NxHMiCng","elasticsearch.node.name":"elasticsearch-68d7885f59-qsjtg","elasticsearch.cluster.name":"docker-cluster"}
elasticsearch-68d7885f59-qsjtg elasticsearch {"@timestamp":"2025-03-20T17:43:54.689Z", "log.level": "WARN", "message":"received plaintext http traffic on an https channel, closing connection Netty4HttpChannel{localAddress=/172.16.85.238:9200, remoteAddress=/172.16.85.234:58240}", "ecs.version": "1.2.0","service.name":"ES_ECS","event.dataset":"elasticsearch.server","process.thread.name":"elasticsearch[elasticsearch-68d7885f59-qsjtg][transport_worker][T#2]","log.logger":"org.elasticsearch.http.netty4.Netty4HttpServerTransport","elasticsearch.cluster.uuid":"mQ7Pc4gySUae8B4x0x2XdQ","elasticsearch.node.id":"xXAzeTSMQSi7L4NxHMiCng","elasticsearch.node.name":"elasticsearch-68d7885f59-qsjtg","elasticsearch.cluster.name":"docker-cluster"}
kibana-5f7d6599bf-psr6n kibana [2025-03-20T17:41:31.610+00:00][ERROR][plugins.interactiveSetup.elasticsearch] Failed to authenticate with host "https://192.168.1.151:30092": Hostname/IP does not match certificate's altnames: IP: 192.168.1.151 is not in the cert's list: fe80::f465:b5ff:fe6b:9813, ::1, 127.0.0.1, 172.16.85.238
kibana-5f7d6599bf-psr6n kibana [2025-03-20T17:41:36.827+00:00][ERROR][plugins.interactiveSetup.elasticsearch] Failed to authenticate with host "https://192.168.1.151:30092": Hostname/IP does not match certificate's altnames: IP: 192.168.1.151 is not in the cert's list: fe80::f465:b5ff:fe6b:9813, ::1, 127.0.0.1, 172.16.85.238
kibana-5f7d6599bf-psr6n kibana [2025-03-20T17:41:38.347+00:00][ERROR][plugins.interactiveSetup.elasticsearch] Failed to authenticate with host "https://192.168.1.151:30092": Hostname/IP does not match certificate's altnames: IP: 192.168.1.151 is not in the cert's list: fe80::f465:b5ff:fe6b:9813, ::1, 127.0.0.1, 172.16.85.238
kibana-5f7d6599bf-psr6n kibana [2025-03-20T17:41:47.713+00:00][ERROR][plugins.interactiveSetup.elasticsearch] Failed to authenticate with host "https://192.168.1.151:30092": Hostname/IP does not match certificate's altnames: IP: 192.168.1.151 is not in the cert's list: fe80::f465:b5ff:fe6b:9813, ::1, 127.0.0.1, 172.16.85.238
kibana-5f7d6599bf-psr6n kibana [2025-03-20T17:41:54.914+00:00][ERROR][plugins.interactiveSetup.elasticsearch] Failed to authenticate with host "https://192.168.1.151:30092": Hostname/IP does not match certificate's altnames: IP: 192.168.1.151 is not in the cert's list: fe80::f465:b5ff:fe6b:9813, ::1, 127.0.0.1, 172.16.85.238
elasticsearch-68d7885f59-zpv2n elasticsearch to retrieve container logs for containerd://e19652a68d4ffb0ba80bbc72f3c5ca17155a81fbbb885f7ff9109fe3182f9d84
- elasticsearch-68d7885f59-zpv2n › elasticsearch
```

