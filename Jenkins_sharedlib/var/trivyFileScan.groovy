def call(String project,String dockerhubUser ,String Imagetag){
    sh trivy image ${dockerhubUser}/${project}:latest >scan.txt
}