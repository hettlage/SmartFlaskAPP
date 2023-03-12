pipeline {
  agent any
  stages {
    stage("Checkout code") {
      steps {
        echo "Checkout"
        git branch: 'main', url: 'https://github.com/hettlage/SmartFlaskAPP.git'
        sh 'ls -l'
      }
    }
    stage("Unit tests") {
      steps {
        echo "Unit tests"
        sh 'bash test.sh'
      }
    }
    stage("Publish JUnit report") {
      steps {
        echo "Publish JUnit report"
        junit skipMarkingBuildUnstable: true, testResults: 'xmlReport/output.xml'
      }
    }
    stage("Publish code coverage") {
      steps {
        echo "Publish code coverage"
        cobertura coberturaReportFile: 'coverage.xml'
      }
    }
  }
}
