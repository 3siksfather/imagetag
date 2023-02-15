# 이미지 수집 태그변경
# skopeo 패키지 필수

images=(
docker.io/library/nginx:1.21.4
k8s.gcr.io/dns/k8s-dns-node-cache:1.21.1
k8s.gcr.io/kube-apiserver:v1.23.7
k8s.gcr.io/kube-controller-manager:v1.23.7
k8s.gcr.io/kube-proxy:v1.23.7
k8s.gcr.io/kube-scheduler:v1.23.7
k8s.gcr.io/pause:3.3
quay.io/calico/cni:v3.23.2
quay.io/calico/kube-controllers:v3.23.2
quay.io/calico/node:v3.23.2
quay.io/calico/pod2daemon-flexvol:v3.23.2
quay.io/calico/typha:v3.23.2
k8s.gcr.io/ingress-nginx/controller:v1.2.1
k8s.gcr.io/metrics-server/metrics-server:v0.5.2
docker.io/kubernetesui/metrics-scraper:v1.0.7
)


for image in "${images[@]}"
do
push=`echo $image | cut -d "/" -f2-`
echo $image
echo $push
skopeo copy --dest-tls-verify=false docker://${image} docker://ip:5000/$push
done
