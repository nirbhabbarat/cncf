## This guide is to install 1 master and 2 worker nodes in any servers.

### Packages involved.
- docker
- kubectl
- kubeadmin
- kubelet

Note: Except docker all kube versions should be same.

### Enable Network Bridge in Ubuntu Server




```bash
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
sudo modprobe br_filter
sudo sysctl -p
```

### Add Repository
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
```

### Install packages
```bash
sudo apt-get update

sudo apt-get install -y docker-ce=18.06.1~ce~3-0~ubuntu kubelet=1.14.5-00 kubeadm=1.14.5-00 kubectl=1.14.5-00

sudo apt-mark hold docker-ce kubelet kubeadm kubectl
```


### On Master Node
```
sudo nano /proc/sys/net/ipv4/ip_forward
(Change from 0 to 1) 

sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

### Set up local kubeconfig
```
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### Join Kube node server to master
```
sudo kubeadm join $controller_private_ip:6443 --token $token --discovery-token-ca-cert-hash $hash
```

### Verify
```
kubectl get nodes
```