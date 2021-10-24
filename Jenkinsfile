pipeline{
  stages{
    stage("checkout"){
      steps{
        Script{
	  checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'git-tga2', url: 'https://github.com/sriram-naresh/git-tags.git']]])
	  }
        }
     }
     stage("checkout"){
      steps{
        script{
         sh """
           mvn clean
           mvn install
         """
         }
       }
     }
  }
} 
