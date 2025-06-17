pipeline {
    agent any
    stages {
	stage('Pulling Code') {
            steps {
	echo "Pulling code from GitHub"
	git https://github.com/Koushik0802/Tourism.git  
            }
        }
        stage('Building Docker image') {
            steps {
                bat 'docker build -t travel:1.0.0 .'
            }
        }
   
    }
}
