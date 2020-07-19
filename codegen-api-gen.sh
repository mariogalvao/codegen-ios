#!/bin/bash

echo "Removendo diretório da API..."
rm -rf codegen-api
echo "Diretório da API removido"

echo "Iniciando geração de código da API..."
swagger-codegen generate \
  -i https://petstore.swagger.io/v2/swagger.json \
  --artifact-version 0.0.1-SNAPSHOT \
  -l swift5 \
  -c codegen-api-config.json \
  -o codegen-api
echo "Geração de código da API finalizada."

echo "Installing pods..."
pod install
echo "Pods installed!"
