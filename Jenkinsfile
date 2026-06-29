pipeline {
    agent any

    tools {
        msbuild 'MSBuild2022'
    }

    stages {

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/shinumjoseph/DemoWebApp.git' 
            }
        }

        stage('Restore NuGet Packages') {
            steps {
                bat 'nuget restore DemoWebApp.sln'
            }
        }

        stage('Build') {
            steps {
                bat 'MSBuild DemoWebApp.sln /p:Configuration=Release'
            }
        }

        stage('Publish') {
            steps {
                bat '''
                MSBuild DemoWebApp.sln ^
                /p:DeployOnBuild=true ^
                /p:WebPublishMethod=FileSystem ^
                /p:PublishUrl="C:\\Users\\hp\\Desktop\\DevOps\\DemoWebApp\\DemoWebAppPublish" ^
                /p:Configuration=Release
                '''
            }
        }

        stage('Deploy to IIS') {
            steps {
                powershell '.\\deploy.ps1'
            }
        }
    }
}
