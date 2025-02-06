# Relatório de Testes Automatizados da Página de Login

## Objetivo
O objetivo deste relatório é documentar os resultados dos testes automatizados realizados na página de login, incluindo a verificação de funcionalidades essenciais como **autenticação de usuários**, **validação de credenciais** e **tratamento de erros**.

Os testes foram executados com o intuito de garantir que a página de login atenda aos requisitos especificados, tanto em cenários de sucesso quanto de falha.

## Ferramentas Utilizadas
- **Selenium**: Ferramenta para automação de navegação web.
- **JUnit**: Framework para execução e organização dos testes.
- **Maven**: Gerenciador de dependências e execução de testes.
- **TestNG**: Framework adicional para geração de relatórios detalhados de execução dos testes.

## Cenários de Teste
Os testes automatizados cobriram os seguintes cenários principais:

1. **Teste de Login com Credenciais Válidas**
   - **Objetivo**: Verificar se o usuário consegue realizar o login com um e-mail e senha válidos.
   - **Resultado Esperado**: O usuário deve ser redirecionado para a página principal após um login bem-sucedido.

2. **Teste de Login com Credenciais Inválidas**
   - **Objetivo**: Verificar se o sistema exibe a mensagem de erro adequada quando as credenciais são inválidas.
   - **Resultado Esperado**: O sistema deve apresentar uma mensagem de erro informando que as credenciais estão incorretas.

3. **Teste de Login com Campo de E-mail Vazio**
   - **Objetivo**: Verificar se o sistema valida o campo de e-mail quando ele é deixado vazio.
   - **Resultado Esperado**: O sistema deve exibir uma mensagem de erro informando que o campo de e-mail é obrigatório.

4. **Teste de Login com Campo de Senha Vazio**
   - **Objetivo**: Verificar se o sistema valida o campo de senha quando ele é deixado vazio.
   - **Resultado Esperado**: O sistema deve exibir uma mensagem de erro informando que o campo de senha é obrigatório.

5. **Teste de Redirecionamento Após Login Bem-Sucedido**
   - **Objetivo**: Verificar se após um login bem-sucedido, o usuário é redirecionado corretamente para a página inicial.
   - **Resultado Esperado**: O usuário deve ser redirecionado para a página principal após um login bem-sucedido.

6. **Teste de Mensagem de Erro para Credenciais Vazias**
   - **Objetivo**: Verificar se o sistema exibe mensagens de erro adequadas quando os campos de login estão vazios.
   - **Resultado Esperado**: O sistema deve exibir uma mensagem de erro indicando que os campos são obrigatórios.

---

## Resultados dos Testes

| **Cenário de Teste**                          | **Resultado Esperado**                 | **Resultado Obtido**                 | **Status**   |
|----------------------------------------------|----------------------------------------|--------------------------------------|--------------|
| Login com Credenciais Válidas                | Redirecionamento para página principal | Redirecionado para a página principal | **Passou**   |
| Login com Credenciais Inválidas              | Mensagem de erro: "Credenciais inválidas" | Exibiu mensagem de erro corretamente | **Passou**   |
| Login com Campo de E-mail Vazio              | Mensagem de erro: "Campo obrigatório"   | Exibiu mensagem de erro corretamente | **Passou**   |
| Login com Campo de Senha Vazio               | Mensagem de erro: "Campo obrigatório"   | Exibiu mensagem de erro corretamente | **Passou**   |
| Redirecionamento Após Login Bem-Sucedido     | Redirecionamento para página inicial  | Redirecionado para página inicial corretamente | **Passou** |
| Mensagem de Erro para Credenciais Vazias     | Exibição de mensagens de erro          | Exibiu mensagem de erro corretamente | **Passou**   |

---

## Detalhes dos Resultados

1. **Login com Credenciais Válidas**:
   - O teste foi executado com um e-mail e senha pré-definidos e o login foi realizado com sucesso. O usuário foi redirecionado corretamente para a página principal.

2. **Login com Credenciais Inválidas**:
   - Quando foram fornecidas credenciais inválidas, o sistema exibiu a mensagem de erro "Credenciais inválidas", conforme esperado.

3. **Login com Campo de E-mail Vazio**:
   - Quando o campo de e-mail foi deixado vazio, o sistema corretamente exibiu a mensagem de erro "O campo de e-mail é obrigatório."

4. **Login com Campo de Senha Vazio**:
   - Quando o campo de senha foi deixado vazio, o sistema corretamente exibiu a mensagem de erro "O campo de senha é obrigatório."

5. **Redirecionamento Após Login Bem-Sucedido**:
   - O redirecionamento para a página inicial após um login bem-sucedido ocorreu sem falhas.

6. **Mensagem de Erro para Credenciais Vazias**:
   - Quando ambos os campos (e-mail e senha) foram deixados vazios, o sistema exibiu a mensagem de erro "Preencha os campos obrigatórios."

---

## Conclusões

- Todos os testes foram executados com sucesso e os resultados foram conforme o esperado.
- A página de login se comporta adequadamente em todos os cenários de teste especificados, sem falhas ou comportamentos inesperados.
- Não foram identificados erros críticos durante a execução dos testes automatizados.

## Recomendações

- **Expansão de Testes**: É recomendada a adição de novos cenários, como testes de login com diferentes tipos de credenciais (e.g., e-mails com formatos diferentes, senhas fortes, etc.).
- **Monitoramento Contínuo**: Continuar a execução regular de testes automatizados para garantir que a funcionalidade de login seja mantida durante futuras alterações no código.

