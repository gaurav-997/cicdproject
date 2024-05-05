def call(String project,String dockerhubUser ,String ImageTag){
    sh """
    docker build -t ${dockerhubUser}/${project} .
    docker tag ${dockerhubUser}/${project} ${dockerhubUser}/${project}:${ImageTag}
    docker tag ${dockerhubUser}/${project} ${dockerhubUser}/${project}:latest
    """
    
}


