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

### Observability deployment with Helm
```
helm upgrade --install monitoring prometheus-community/kube-prometheus-stack -n monitoring -f values-monitor


kubectl --namespace monitoring get all -o wide
NAME                                                         READY   STATUS    RESTARTS   AGE   IP              NODE         NOMINATED NODE   READINESS GATES
pod/alertmanager-monitoring-kube-prometheus-alertmanager-0   2/2     Running   0          54m   172.18.85.202   k8s-node01   <none>           <none>
pod/monitoring-grafana-599d5666f8-9w8xp                      3/3     Running   0          55m   172.18.85.198   k8s-node01   <none>           <none>
pod/monitoring-kube-prometheus-operator-64c9dbdc68-8k7js     1/1     Running   0          55m   172.18.85.199   k8s-node01   <none>           <none>
pod/monitoring-kube-state-metrics-7fcd8df45c-2brtd           1/1     Running   0          55m   172.18.85.197   k8s-node01   <none>           <none>
pod/monitoring-prometheus-node-exporter-2kbbf                1/1     Running   0          55m   192.168.1.150   k8s-master   <none>           <none>
pod/monitoring-prometheus-node-exporter-g6km6                0/1     Pending   0          55m   <none>          k8s-node02   <none>           <none>
pod/monitoring-prometheus-node-exporter-kkpx8                1/1     Running   0          55m   192.168.1.151   k8s-node01   <none>           <none>
pod/monitoring-prometheus-node-exporter-kt6vn                0/1     Pending   0          55m   <none>          k8s-node03   <none>           <none>
pod/prometheus-monitoring-kube-prometheus-prometheus-0       2/2     Running   0          54m   172.18.85.201   k8s-node01   <none>           <none>

NAME                                              TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE   SELECTOR
service/alertmanager-operated                     ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP   54m   app.kubernetes.io/name=alertmanager
service/monitoring-grafana                        ClusterIP   10.102.126.249   <none>        80/TCP                       55m   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=grafana
service/monitoring-kube-prometheus-alertmanager   ClusterIP   10.105.221.32    <none>        9093/TCP,8080/TCP            55m   alertmanager=monitoring-kube-prometheus-alertmanager,app.kubernetes.io/name=alertmanager
service/monitoring-kube-prometheus-operator       ClusterIP   10.109.94.41     <none>        443/TCP                      55m   app=kube-prometheus-stack-operator,release=monitoring
service/monitoring-kube-prometheus-prometheus     ClusterIP   10.107.0.36      <none>        9090/TCP,8080/TCP            55m   app.kubernetes.io/name=prometheus,operator.prometheus.io/name=monitoring-kube-prometheus-prometheus
service/monitoring-kube-state-metrics             ClusterIP   10.111.108.165   <none>        8080/TCP                     55m   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=kube-state-metrics
service/monitoring-prometheus-node-exporter       ClusterIP   10.104.65.207    <none>        9100/TCP                     55m   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=prometheus-node-exporter
service/prometheus-operated                       ClusterIP   None             <none>        9090/TCP                     54m   app.kubernetes.io/name=prometheus

NAME                                                 DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE SELECTOR            AGE   CONTAINERS      IMAGES                                    SELECTOR
daemonset.apps/monitoring-prometheus-node-exporter   4         4         2       4            2           kubernetes.io/os=linux   55m   node-exporter   quay.io/prometheus/node-exporter:v1.9.0   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=prometheus-node-exporter

NAME                                                  READY   UP-TO-DATE   AVAILABLE   AGE   CONTAINERS                                            IMAGES                                                                                                     SELECTOR
deployment.apps/monitoring-grafana                    1/1     1            1           55m   grafana-sc-dashboard,grafana-sc-datasources,grafana   quay.io/kiwigrid/k8s-sidecar:1.30.0,quay.io/kiwigrid/k8s-sidecar:1.30.0,docker.io/grafana/grafana:11.5.2   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=grafana
deployment.apps/monitoring-kube-prometheus-operator   1/1     1            1           55m   kube-prometheus-stack                                 quay.io/prometheus-operator/prometheus-operator:v0.81.0                                                    app=kube-prometheus-stack-operator,release=monitoring
deployment.apps/monitoring-kube-state-metrics         1/1     1            1           55m   kube-state-metrics                                    registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.15.0                                              app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=kube-state-metrics

NAME                                                             DESIRED   CURRENT   READY   AGE   CONTAINERS                                            IMAGES                                                                                                     SELECTOR
replicaset.apps/monitoring-grafana-599d5666f8                    1         1         1       55m   grafana-sc-dashboard,grafana-sc-datasources,grafana   quay.io/kiwigrid/k8s-sidecar:1.30.0,quay.io/kiwigrid/k8s-sidecar:1.30.0,docker.io/grafana/grafana:11.5.2   app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=grafana,pod-template-hash=599d5666f8
replicaset.apps/monitoring-kube-prometheus-operator-64c9dbdc68   1         1         1       55m   kube-prometheus-stack                                 quay.io/prometheus-operator/prometheus-operator:v0.81.0                                                    app=kube-prometheus-stack-operator,pod-template-hash=64c9dbdc68,release=monitoring
replicaset.apps/monitoring-kube-state-metrics-7fcd8df45c         1         1         1       55m   kube-state-metrics                                    registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.15.0                                              app.kubernetes.io/instance=monitoring,app.kubernetes.io/name=kube-state-metrics,pod-template-hash=7fcd8df45c

NAME                                                                    READY   AGE   CONTAINERS                     IMAGES
statefulset.apps/alertmanager-monitoring-kube-prometheus-alertmanager   1/1     54m   alertmanager,config-reloader   quay.io/prometheus/alertmanager:v0.28.1,quay.io/prometheus-operator/prometheus-config-reloader:v0.81.0
statefulset.apps/prometheus-monitoring-kube-prometheus-prometheus       1/1     54m   prometheus,config-reloader     quay.io/prometheus/prometheus:v3.2.1,quay.io/prometheus-operator/prometheus-config-reloader:v0.81.0



kubectl patch svc monitoring-grafana -n monitoring -p '{"spec": {"type": "NodePort", "ports": [{"port": 80, "nodePort": 32222, "protocol": "TCP"}]}}'

kubectl patch svc monitoring-kube-prometheus-prometheus -n monitoring -p '{"spec": {"type": "NodePort", "ports": [{"port": 9090, "nodePort": 32323, "protocol": "TCP"}]}}'





kubectl get svc -n monitoring
NAME                                      TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                         AGE
alertmanager-operated                     ClusterIP   None             <none>        9093/TCP,9094/TCP,9094/UDP      55m
monitoring-grafana                        NodePort    10.102.126.249   <none>        80:32222/TCP                    56m
monitoring-kube-prometheus-alertmanager   ClusterIP   10.105.221.32    <none>        9093/TCP,8080/TCP               56m
monitoring-kube-prometheus-operator       ClusterIP   10.109.94.41     <none>        443/TCP                         56m
monitoring-kube-prometheus-prometheus     NodePort    10.107.0.36      <none>        9090:32323/TCP,8080:30087/TCP   56m
monitoring-kube-state-metrics             ClusterIP   10.111.108.165   <none>        8080/TCP                        56m
monitoring-prometheus-node-exporter       ClusterIP   10.104.65.207    <none>        9100/TCP                        56m
prometheus-operated                       ClusterIP   None             <none>        9090/TCP                        55m



http://192.168.1.151:32222/login


http://192.168.1.151:32323/config


kubectl get secret -n monitoring monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
prom-operator
```
