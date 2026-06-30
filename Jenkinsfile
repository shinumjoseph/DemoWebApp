pipeline {
    agent any

    tools {
        msbuild 'MSBuild2022'
    }

    stages {

        
        stage('Deploy to IIS') {
            steps {
                powershell '.\\deploy.ps1'
            }
        }
    }
}
