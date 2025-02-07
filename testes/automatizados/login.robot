*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser To Login Page
Suite Teardown    Close Browser

*** Variables ***
${URL}    https://horadoqa.github.io/testes-login/login/
${USERNAME_ID}    //*[@id="username"]
${PASSWPRD_ID}    //*[@id="password"]
${VALID_EMAIL}    usuario@example.com
${VALID_EMAIL_SPACE}    usuario@example.com   # Incluindo o espaço
${VALID_PASSWORD}    1q2w3e4r
${INVALID_EMAIL}    invalido@dominio.com
${INVALID_PASSWORD}    SenhaErrada123
${ERROR_MESSAGE}    //*[@id="error-message"]
${EMAIL_PASSWORD_INVALID}    E-mail ou senha inválidos! Tentativas restantes:
${EMAIL_PASSWORD_MANDATORY}    E-mail e senha são obrigatórios!

*** Keywords ***
# Acessa a página de login
Open Browser To Login Page
    Open Browser    ${URL}    Chrome
    Sleep    5s
    # Maximize Browser Window
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

Verify Message Error
    Wait Until Element Is Visible    ${ERROR_MESSAGE}    10s
    ${ERROR_MESSAGE}=    Get Text    ${ERROR_MESSAGE}
    Should Contain    ${ERROR_MESSAGE}    ${EMAIL_PASSWORD_INVALID}

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
    [Tags]    1
    Open Browser To Login Page
    Page Should Contain Element    id=username
    Page Should Contain Element    id=password
    Page Should Contain Element    id=login-button
    [Teardown]    Close Browser
    Sleep    5s

Caso de Teste 2: Login com credenciais válidas
    [Documentation]    Testa o login com credenciais válidas.
    [Tags]    2
    Open Browser To Login Page
    Input Email And Password Valid    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Click Login Button
    Verify Redirect
    [Teardown]    Close Browser

Caso de Teste 3: Login com credenciais inválidas
    [Documentation]    Testa o login com credenciais inválidas.
    [Tags]    3
    Open Browser To Login Page
    Input Email And Password Invalid    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Click Login Button
    Verify Message Error
    [Teardown]    Close Browser

Caso de Teste 4: Campo de "usuário" vazio
    [Documentation]    Verifica se o sistema impede o envio com o campo de "usuário" vazio.
    [Tags]    4
    Open Browser To Login Page
    Input Text    id=password    ${VALID_PASSWORD}
    Click Login Button
    Wait Until Error Message Is Visible    ${EMAIL_PASSWORD_MANDATORY}
    [Teardown]    Close Browser

Caso de Teste 5: Campo de "senha" vazio
    [Documentation]    Verifica se o sistema impede o envio com o campo de "senha" vazio.
    [Tags]    5
    Open Browser To Login Page
    Input Text    id=username    ${VALID_EMAIL}
    Click Login Button
    Wait Until Error Message Is Visible    ${EMAIL_PASSWORD_MANDATORY}
    [Teardown]    Close Browser


Caso de Teste 6: Campos de login com espaços em branco
    [Documentation]    Verifica se o sistema lida corretamente com espaços em branco nos campos.
    [Tags]    6
    Open Browser To Login Page
    Input Email And Password Invalid Space    ${VALID_EMAIL_SPACE}    ${VALID_PASSWORD}
    Click Login Button
    Verify Redirect
    [Teardown]    Close Browser


Caso de Teste 7: Exibição de senha
    [Documentation]    Verifica a funcionalidade de "exibir senha".
    [Tags]    7
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
    [Tags]    8
    Open Browser To Login Page
    Input Email And Password Valid    ${VALID_EMAIL}    ${VALID_PASSWORD}
    Click Login Button
    Sleep    1
    Verify Redirect
    [Teardown]    Close Browser

Caso de Teste 9: Comportamento do botão "entrar"
    [Documentation]    Verifica se o botão "entrar" fica desabilitado com campos vazios.
    [Tags]    9
    Open Browser To Login Page
    Verify Login Button Disabled
    [Teardown]    Close Browser

Caso de Teste 10: Mensagens de erro
    [Documentation]    Verifica se as mensagens de erro são claras.
    [Tags]    10
    Open Browser To Login Page
    Input Email And Password Invalid    ${INVALID_EMAIL}    ${INVALID_PASSWORD}
    Click Login Button
    Wait Until Error Message Is Visible    ${EMAIL_PASSWORD_INVALID}
    [Teardown]    Close Browser


# robot --output results/output.xml --log results/log.html --report results/report.html login.robot
