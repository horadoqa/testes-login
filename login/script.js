// Usuários e senhas pré-definidos
const validUsers = {
    "usuario@example.com": "1q2w3e4r",
    "usuario2@example.com": "1q2w3e4r"
};

// Variáveis de controle de tentativas
let failedAttempts = 0;
const maxAttempts = 5;
let lockTime = 0; // Em segundos
const lockDuration = 60; // Duração do bloqueio (em segundos)

// Detectar a tecla Enter para enviar o formulário de login
document.addEventListener("keydown", function(event) {
    if (event.key === "Enter") {
        login();
    }
});

// Função para alternar a visibilidade da senha
function togglePassword() {
    var passwordField = document.getElementById('password');
    var passwordIcon = document.getElementById('toggle-password');
    
    // Alterna entre senha oculta e visível
    if (passwordField.type === "password") {
        passwordField.type = "text";  // Mostra a senha
        passwordIcon.classList.remove('fa-eye');  // Troca o ícone
        passwordIcon.classList.add('fa-eye-slash'); // Ícone de olho fechado
    } else {
        passwordField.type = "password";  // Oculta a senha
        passwordIcon.classList.remove('fa-eye-slash');
        passwordIcon.classList.add('fa-eye'); // Ícone de olho aberto
    }
}

// Detecta as entradas nos campos de usuário e senha
document.getElementById("username").addEventListener("input", toggleLoginButton);
document.getElementById("password").addEventListener("input", toggleLoginButton);

function toggleLoginButton() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const loginButton = document.getElementById("login-button");
    const errorMessage = document.getElementById("error-message");

    // Desabilitar o botão de login
    loginButton.disabled = !(username && password);

    // Verificar se os campos estão vazios
    if (!username || !password) {
        errorMessage.textContent = "E-mail e senha são obrigatórios!";
        errorMessage.classList.add("error");
    } else {
        errorMessage.textContent = ""; // Limpar mensagem de erro quando ambos os campos estiverem preenchidos
    }
}

function login() {
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const errorMessage = document.getElementById("error-message");

    // Limpar mensagens de erro
    errorMessage.textContent = "";

    // Verificar se o bloqueio está ativo
    if (lockTime > 0) {
        const timeLeft = Math.ceil((lockTime - Math.floor(Date.now() / 1000)) / 60); // Correção aqui
        errorMessage.textContent = `Você excedeu o número de tentativas. Tente novamente em ${timeLeft} minutos.`;
        errorMessage.classList.add("error");
        return;
    }

    // Verificar campos obrigatórios
    if (username === "" || password === "") {
        errorMessage.textContent = "E-mail e senha são obrigatórios!";
        errorMessage.classList.add("error");
        return;
    }

    // Verificar credenciais
    if (validUsers[username] && validUsers[username] === password) {
        // Redirecionar para a página de boas-vindas
        window.location.href = "welcome/index.html";
        failedAttempts = 0; // Resetar tentativas falhas após login bem-sucedido
    } else {
        failedAttempts++;

        if (failedAttempts >= maxAttempts) {
            // Bloquear o acesso temporariamente
            lockTime = Math.floor(Date.now() / 1000) + lockDuration; // Atualiza lockTime
            const timeLeft = Math.ceil((lockTime - Math.floor(Date.now() / 1000)) / 60); // Correção aqui
            errorMessage.textContent = `Você excedeu o número máximo de tentativas. Tente novamente em ${timeLeft} minutos.`;
            errorMessage.classList.add("error");
        } else {
            // Exibir mensagem de erro
            errorMessage.textContent = `E-mail ou senha inválidos! Tentativas restantes: ${maxAttempts - failedAttempts}`;
            errorMessage.classList.add("error");
        }
    }
}
