*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${URL}    http://127.0.0.1:5500/login/index.html  # Substitua pelo URL correto da sua aplicação
${USERNAME_ID}    //*[@id="username"]
${PASSWPRD_ID}    //*[@id="password"]
${VALID_EMAIL}    usuario@example.com
${VALID_EMAIL_SPACE}    usuario@example.com   # Incluindo o espaço
${VALID_PASSWORD}    1q2w3e4r
${INVALID_EMAIL}    invalido@dominio.com
${INVALID_PASSWORD}    SenhaErrada123


*** Keywords ***
# Acessa a página de login
Open Browser To Login Page
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5s
    
# Ação de preencher email e senha válidos
Input Email And Password Valid
    [Arguments]    ${email}    ${password}
    Input Text   ${USERNAME_ID}    ${email}
    Input Text    ${PASSWPRD_ID}    ${password}

# Ação de preencher email e senha inválidos
Input Email And Password Invalid
    [Arguments]    ${email}    ${password}
    Input Text    ${USERNAME_ID}    ${email}
    Input Text    ${PASSWPRD_ID}    ${password}

# Ação de preencher email com espaço
Input Email And Password Invalid Space
    [Arguments]    ${email}    ${password}
    Input Text    ${USERNAME_ID}    ${email}
    Input Text    ${PASSWPRD_ID}    ${password}

# Clica no botão de login
Click Login Button
    Click Element    id=login-button

# Ação para verificar se o botão está desabilitado
Verify Login Button Disabled
    ${attribute}=    Get Element Attribute    id=login-button    disabled
    Should Not Be Empty    ${attribute}

# Ação para verificar se a página foi redirecionada
Verify Redirect
    Page Should Contain Element    //*[@id="inicio"]

# Espera por um elemento com base no conteúdo
Wait Until Error Message Is Visible
    [Arguments]    ${message}
    Wait Until Element Contains    //*[@id="error-message"]    ${message}

*** Test Cases ***
Caso de Teste 1: Acesso à página de login
    [Documentation]    Verifica se a página de login carrega corretamente.
    Open Browser To Login Page
    Page Should Contain Element    id=username
    Page Should Contain Element    id=password
    Page Should Contain Element    id=login-button
    [Teardown]    Close Browser

Caso de Teste 2: Login com credenciais válidas
    [Documentation]    Testa o login com credenciais válidas.
    Input Email And Password Valid    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Click Login Button
    Verify Redirect
    [Teardown]    Close Browser

Caso de Teste 3: Login com credenciais inválidas
    [Documentation]    Testa o login com credenciais inválidas.
    Input Email And Password Invalid    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Click Login Button
    Wait Until Error Message Is Visible    E-mail ou senha inválidos! Tentativas restantes:
    [Teardown]    Close Browser

Caso de Teste 4: Campo de "usuário" vazio
    [Documentation]    Verifica se o sistema impede o envio com o campo de "usuário" vazio.
    Open Browser To Login Page
    Input Text    id=password    ${VALID_PASSWORD}
    Click Login Button
    Wait Until Error Message Is Visible    E-mail e senha são obrigatórios!
    [Teardown]    Close Browser

Caso de Teste 5: Campo de "senha" vazio
    [Documentation]    Verifica se o sistema impede o envio com o campo de "senha" vazio.
    Open Browser To Login Page
    Input Text    id=username    ${VALID_EMAIL}
    Click Login Button
    Wait Until Error Message Is Visible    E-mail e senha são obrigatórios!
    [Teardown]    Close Browser

Caso de Teste 6: Campos de login com espaços em branco
    [Documentation]    Verifica se o sistema lida corretamente com espaços em branco nos campos.
    Open Browser To Login Page
    Input Email And Password Invalid Space    ${VALID_EMAIL_SPACE}    ${VALID_PASSWORD}
    Click Login Button
    Verify Redirect
    [Teardown]    Close Browser

Caso de Teste 7: Exibição de senha
    [Documentation]    Verifica a funcionalidade de "exibir senha".
    Open Browser To Login Page
    Input Text    id=username    ${VALID_EMAIL}
    Input Text    id=password    ${VALID_PASSWORD}
    Wait Until Element Is Visible    id=toggle-password    timeout=10s
    Click Element    id=toggle-password
    Wait Until Element Is Visible    id=toggle-password    timeout=10s
    Click Element    id=toggle-password
    Wait Until Element Is Visible    id=toggle-password    timeout=10s
    Click Login Button
    Verify Redirect
    [Teardown]    Close Browser

Caso de Teste 8: Redirecionamento após login
    [Documentation]    Verifica se o sistema redireciona corretamente após o login.
    Input Email And Password Valid    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Click Login Button
    Sleep    1
    Verify Redirect
    [Teardown]    Close Browser

Caso de Teste 9: Comportamento do botão "entrar"
    [Documentation]    Verifica se o botão "entrar" fica desabilitado com campos vazios.
    Open Browser To Login Page
    Verify Login Button Disabled
    [Teardown]    Close Browser

Caso de Teste 10: Mensagens de erro
    [Documentation]    Verifica se as mensagens de erro são claras.
    Input Email And Password Invalid    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Click Login Button
    Wait Until Error Message Is Visible    E-mail ou senha inválidos! Tentativas restantes:
    [Teardown]    Close Browser
