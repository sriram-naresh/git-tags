pipeline{
agent  any
  stages{
    stage("checkout"){
      steps{
	 checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git-tga2', url: 'https://github.com/sriram-naresh/git-tags.git']]])
      }
    }
     stage("Build"){
       steps{
         sh """
           mvn clean
           mvn install
         """
       }
     }
  }
} 
