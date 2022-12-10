def COLOR_MAP = [
    'SUCCESS': 'good', 
    'FAILURE': 'danger',
]

pipeline {
    agent any

    stages {
        stage('Git checkout') {
            steps {
                echo 'Cloning project codebase...'
                git 'https://github.com/Dreo57/Project-1.git'
                sh 'ls'
            }
        }
        
         stage('Verify Terraform Version') {
            steps {
                echo 'verifying the terrform version...'
                sh 'terraform --version'
               
            }
        }
        
        stage('Terraform init') {
            steps {
                echo 'Initiliazing terraform project...'
                sh 'sudo terraform init'
               
            }
        }
        
        
        stage('Terraform validate') {
            steps {
                echo 'Code syntax checking...'
                sh 'sudo terraform validate'
               
            }
        }
        
        
        stage('Terraform plan') {
            steps {
                echo 'Terraform plan for the dry run...'
                sh 'sudo terraform plan'
               
            }
        }
        
        
        
        
        stage('Checkov scan') {
            steps {
                
                sh """
                sudo pip3 install checkov
                #checkov -d .
                checkov -d . --skip-check CKV_AWS_131,CKV_AWS_91,CKV_AWS_150,CKV_AWS_2,CKV_AWS_153,CKV_AWS_79,CKV_AWS_126,CKV_AWS_135,CKV_AWS_88,CKV_AWS_8,CKV_AWS_65,CKV_AWS_37,CKV_AWS_39,CKV_AWS_38,CKV_AWS_58,CKV_AWS_129,CKV_AWS_226,CKV_AWS_16,CKV_AWS_118,CKV_AWS_161,CKV_AWS_157,CKV_AWS_260,CKV_AWS_23,CKV_AWS_130,CKV2_AWS_20,CKV2_AWS_28,CKV_AWS_103,CKV2_AWS_6,CKV_AWS_19,CKV2_AWS_5,CKV2_AWS_11,CKV_AWS_18,CKV_AWS_144,CKV_AWS_145,CKV2_AWS_12,CKV_AWS_21
                #checkov -d . --skip-check CKV_AWS*
                """
               
            }
        }
        
        
        
        stage('Manual approval') {
            steps {
                
                input 'Approval required for deployment'
               
            }
        }
        
        
         stage('Terraform apply') {
            steps {
                echo 'Terraform apply...'
                sh 'sudo terraform apply --auto-approve'
               
               
            }
        }
        
        
    }
    
     post { 
        always { 
            echo 'I will always say Hello again!'
            slackSend channel: '#team-devops', color: COLOR_MAP[currentBuild.currentResult], message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
        }
    }
    
    
    
}