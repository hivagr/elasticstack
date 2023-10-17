#!/bin/zsh
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a sample log entry in the development environment.",
  "severity": "INFO",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-dev",
  "environment": "dev"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a sample log entry in the test environment.",
  "severity": "INFO",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-tst",
  "environment": "tst"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a sample log entry in the acceptance environment.",
  "severity": "INFO",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-acc",
  "environment": "acc"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a sample log entry in the production environment.",
  "severity": "INFO",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-prd",
  "environment": "prd"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a warning sample log entry in the development environment.",
  "severity": "WARN",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-dev",
  "environment": "dev"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a warning sample log entry in the test environment.",
  "severity": "WARN",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-tst",
  "environment": "tst"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a warning sample log entry in the acceptance environment.",
  "severity": "WARN",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-acc",
  "environment": "acc"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a warning sample log entry in the production environment.",
  "severity": "WARN",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-prd",
  "environment": "prd"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a error sample log entry in the development environment.",
  "severity": "ERROR",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-dev",
  "environment": "dev"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a error sample log entry in the test environment.",
  "severity": "ERROR",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-tst",
  "environment": "tst"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a error sample log entry in the acceptance environment.",
  "severity": "ERROR",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-acc",
  "environment": "acc"
}' http://localhost:5044
curl -X POST -H "Content-Type: application/json" -d '{
  "message": "This is a error sample log entry in the production environment.",
  "severity": "ERROR",
  "source": "example.com",
  "application": "myapp",
  "namespace": "myapp-prd",
  "environment": "prd"
}' http://localhost:5044
