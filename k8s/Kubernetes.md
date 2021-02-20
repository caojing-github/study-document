# 通过 minikube 快速安装和启动一个 Kubernetes 集群
minikube 是官方提供的一个快速搭建本地 Kubernetes 集群的工具，主要用于本地开发和调试
1、安装 minikube 和 kubectl
安装 minikube
```shell script
curl -LO https://github.com/kubernetes/minikube/releases/download/v1.13.1/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
```
安装kubectl
```shell script
curl -LO https://dl.k8s.io/v1.19.2/kubernetes-client-linux-amd64.tar.gz
tar -xvf kubernetes-client-linux-amd64.tar.gz

kubernetes/
kubernetes/client/
kubernetes/client/bin/
kubernetes/client/bin/kubectl

sudo install kubernetes/client/bin/kubectl /usr/local/bin/kubectl
```

2、安装 Kubernetes 集群
```shell script
minikube start
```

3、检查集群状态
```shell script
kubectl cluster-info

Kubernetes master is running at https://172.17.0.3:8443
KubeDNS is running at https://172.17.0.3:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.
```

# Kubeadm
Kubeadm 是社区官方持续维护的集群搭建工具，在 Kubernertes v1.13 版本的时候就已经 GA 了（GA 即 General Availability，指官方开始推荐广泛使用），它跟着 Kubernetes 的版本一起发布，目前 Kubeadm 代码放在 Kubernetes 的主代码库中。
用 Kubeadm 随时可以搭建出最新的集群。
[官网 安装 kubeadm](https://kubernetes.io/zh/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
kubeadm：用来初始化集群的指令。
kubelet：在集群中的每个节点上用来启动 Pod 和容器等。
kubectl：用来与集群通信的命令行工具。

[kubeadm1.19搭建k8s群集](https://blog.csdn.net/hualinux/article/details/107192116)
查看7个镜像是否下载完整了
```shell script
docker images | grep k8s.gcr.io
```
提示：如果安装出错了，可以执行下面👇命令进行重置，再重新执行kubeadm init...命令
```shell script
kubeadm reset
```



























---
