node{
stage ('scm package'){

}
stage ('mvn package'){
sh 'mvn clean package'
}
stage ('build docker image'){
sh 'sudo docekr build -t mano8888/mydoc .'
}
}
