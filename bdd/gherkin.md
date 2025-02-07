# BDD

BDD (Behavior Driven Development) é uma prática de desenvolvimento ágil que visa melhorar a comunicação entre os membros da equipe (desenvolvedores, testers, analistas de negócios, etc.) por meio de uma linguagem comum e compreensível para todos. O principal objetivo do BDD é garantir que todos os envolvidos no projeto compreendam o comportamento esperado do sistema, e que esse comportamento seja validado automaticamente.

Para transformar os requisitos fornecidos em **BDD (Behavior Driven Development)**, usaremos a estrutura de Gherkin, que descreve o comportamento esperado do sistema em uma linguagem natural. Abaixo estão os **cenários de teste** em formato BDD para os requisitos funcionais e não funcionais que você forneceu.

---

### **1. Campos de Login**

#### **Cenário: O campo de usuário é obrigatório e com validação**
```gherkin
Dado que o usuário está na página de login
Quando ele tenta enviar o formulário sem preencher o campo de usuário
Então o sistema deve exibir a mensagem "Campo de usuário é obrigatório"
E o formulário não deve ser enviado
```

#### **Cenário: O campo de senha é obrigatório e com validação**
```gherkin
Dado que o usuário está na página de login
Quando ele tenta enviar o formulário sem preencher o campo de senha
Então o sistema deve exibir a mensagem "Campo de senha é obrigatório"
E o formulário não deve ser enviado
```

#### **Cenário: O campo de usuário aceita texto alfanumérico**
```gherkin
Dado que o usuário está na página de login
Quando ele digita um valor alfanumérico no campo de usuário
Então o sistema deve aceitar esse valor como válido
```

#### **Cenário: O campo de senha aceita caracteres especiais**
```gherkin
Dado que o usuário está na página de login
Quando ele digita uma senha com caracteres especiais
Então o sistema deve aceitar a senha como válida
```

---

### **2. Funcionalidade do Botão de Login**

#### **Cenário: O botão de login é desabilitado até que os dois campos sejam preenchidos**
```gherkin
Dado que o usuário está na página de login
Quando ele preenche apenas um dos campos (usuário ou senha)
Então o botão de login deve estar desabilitado
```

#### **Cenário: O botão de login é habilitado quando ambos os campos são preenchidos corretamente**
```gherkin
Dado que o usuário está na página de login
Quando ele preenche corretamente os campos de usuário e senha
Então o botão de login deve ser habilitado
```

#### **Cenário: O botão de login submete o formulário**
```gherkin
Dado que o usuário preencheu corretamente os campos de usuário e senha
Quando ele clica no botão "Entrar"
Então o formulário deve ser enviado para o sistema de autenticação
```

---

### **3. Mensagens de Erro**

#### **Cenário: Mensagem de erro para credenciais inválidas**
```gherkin
Dado que o usuário está na página de login
E ele preencheu um usuário ou senha incorretos
Quando ele tenta fazer o login
Então o sistema deve exibir a mensagem "Usuário ou senha incorretos"
```

---

### **4. Exibição de Senha**

#### **Cenário: Exibir senha ao clicar no ícone "olho"**
```gherkin
Dado que o usuário está na página de login
Quando ele clica no ícone de "olho" ao lado do campo de senha
Então a senha deve ser exibida em formato de texto
```

#### **Cenário: Ocultar senha ao clicar novamente no ícone "olho"**
```gherkin
Dado que o usuário está na página de login
E a senha está visível em formato de texto
Quando ele clica novamente no ícone de "olho"
Então a senha deve ser ocultada novamente
```

---

### **5. Lembrar-me (Opcional)**

#### **Cenário: A opção "Lembrar-me" preenche os campos automaticamente**
```gherkin
Dado que o usuário está na página de login
E ele selecionou a opção "Lembrar-me" no login anterior
Quando ele acessa a página de login novamente
Então os campos de usuário e senha devem ser preenchidos automaticamente
```

#### **Cenário: A opção "Lembrar-me" deve ser opcional**
```gherkin
Dado que o usuário está na página de login
Quando ele vê a opção "Lembrar-me"
Então ele deve ter a opção de escolher se deseja ou não selecionar essa opção
```

---

### **6. Redirecionamento Após Login**

#### **Cenário: Redirecionamento para a página inicial após login bem-sucedido**
```gherkin
Dado que o usuário preencheu corretamente os campos de login
Quando ele faz o login com credenciais válidas
Então o sistema deve redirecioná-lo para a página inicial
```

#### **Cenário: Manter o usuário na tela de login após falha de autenticação**
```gherkin
Dado que o usuário preencheu o campo de login com credenciais inválidas
Quando ele tenta fazer login
Então o sistema deve mantê-lo na tela de login
E exibir a mensagem "Usuário ou senha incorretos"
```

---

### **7. Segurança**

#### **Cenário: As credenciais devem ser enviadas via HTTPS**
```gherkin
Dado que o usuário está na página de login
Quando ele submete o formulário
Então as credenciais devem ser enviadas de forma segura através de HTTPS
```

#### **Cenário: Proteção contra ataques de brute force**
```gherkin
Dado que o sistema detecta várias tentativas de login com credenciais erradas
Quando o número de tentativas excede o limite permitido
Então o sistema deve bloquear o acesso temporariamente ou exigir um CAPTCHA
```

---

### **8. Responsividade**

#### **Cenário: A página de login deve ser responsiva em diferentes dispositivos**
```gherkin
Dado que o usuário acessa a página de login
Quando ele utiliza um dispositivo móvel, tablet ou desktop
Então a página de login deve ser exibida corretamente em todos os dispositivos
```

---

### **9. Navegação**

#### **Cenário: A navegação deve ser acessível via teclado e leitores de tela**
```gherkin
Dado que o usuário está na página de login
Quando ele navega pelos campos de usuário, senha e botão "Entrar"
Então ele deve conseguir navegar utilizando o teclado
E os campos devem ser acessíveis por leitores de tela
```

---

### **10. Validação do Formulário**

#### **Cenário: Validação de campos obrigatórios no cliente**
```gherkin
Dado que o usuário está na página de login
Quando ele tenta enviar o formulário com o campo de usuário ou senha vazio
Então o envio deve ser bloqueado
E uma mensagem de erro deve ser exibida
```

#### **Cenário: Validação de formato e comprimento no cliente**
```gherkin
Dado que o usuário está na página de login
Quando ele preenche o campo de usuário apenas com números
Então o sistema deve exibir um erro
E impedir o envio do formulário
```

---

### **Requisitos Não Funcionais**

#### **Cenário: Tempo de carregamento da página de login**
```gherkin
Dado que o usuário acessa a página de login
Quando a página for carregada
Então o tempo de carregamento não deve exceder 3 segundos
```

#### **Cenário: Tempo de resposta do login**
```gherkin
Dado que o usuário clicou no botão "Entrar"
Quando ele envia o formulário
Então o tempo de resposta para autenticação não deve exceder 2 segundos
```

#### **Cenário: Testabilidade do sistema de login**
```gherkin
Dado que o sistema de login foi implementado
Quando um teste automatizado for executado
Então o sistema deve permitir a validação dos campos e das mensagens de erro de forma automatizada
```

---

### **Considerações Finais**

Esses cenários de teste em BDD, escritos em Gherkin, ajudam a garantir que o comportamento da página de login esteja de acordo com os requisitos. Eles podem ser usados para desenvolver testes automatizados que validem a funcionalidade da aplicação durante o desenvolvimento. Se precisar de mais cenários ou ajustes, fique à vontade para pedir!