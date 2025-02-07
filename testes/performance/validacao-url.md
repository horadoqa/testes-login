# Validando a URL

CURL

curl -I https://horadoqa.github.io/testes-login/login/

curl -Is https://horadoqa.github.io/testes-login/login/

curl -Is https://horadoqa.github.io/testes-login/login/ -H "Content-Type: application/json"

curl -Is https://horadoqa.github.io/testes-login/login/ -H "Content-Type: application/json" > curl.txt