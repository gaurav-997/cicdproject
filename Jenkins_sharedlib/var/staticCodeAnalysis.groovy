def call(credentialsId){

    withSonarQubeEnv(credentialsId: credentialsId) {
         sh 'mvn clean package sonar:sonar'
    }
}

#credentialsId is used to authenticate the sonarQube 