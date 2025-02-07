describe('Login Tests', () => {
    const URL = 'https://horadoqa.github.io/testes-login/login/';
    const VALID_EMAIL = 'usuario@example.com';
    const VALID_PASSWORD = '1q2w3e4r';
    const INVALID_EMAIL = 'invalido@dominio.com';
    const INVALID_PASSWORD = 'SenhaErrada123';
    const ERROR_MESSAGE_SELECTOR = '#error-message';
    const EMAIL_PASSWORD_INVALID = 'E-mail ou senha inválidos! Tentativas restantes:';
    const EMAIL_PASSWORD_MANDATORY = 'E-mail e senha são obrigatórios!';

    beforeEach(() => {
        cy.visit(URL);
    });

    it('Acesso à página de login', () => {
        cy.get('#username').should('be.visible');
        cy.get('#password').should('be.visible');
        cy.get('#login-button').should('be.visible');
    });

    it('Login com credenciais válidas', () => {
        cy.get('#username').type(VALID_EMAIL);
        cy.get('#password').type(VALID_PASSWORD);
        cy.get('#login-button').click();
        cy.get('#inicio').should('be.visible');
    });

    it('Login com credenciais inválidas', () => {
        cy.get('#username').type(INVALID_EMAIL);
        cy.get('#password').type(INVALID_PASSWORD);
        cy.get('#login-button').click();
        cy.get(ERROR_MESSAGE_SELECTOR).should('contain.text', EMAIL_PASSWORD_INVALID);
    });

    it('Campo de "E-mail" vazio', () => {
        cy.get('#password').type(VALID_PASSWORD);
        cy.get('#login-button').click();
        cy.get(ERROR_MESSAGE_SELECTOR).should('contain.text', EMAIL_PASSWORD_MANDATORY);
    });

    it('Campo de "senha" vazio', () => {
        cy.get('#username').type(VALID_EMAIL);
        cy.get('#login-button').click();
        cy.get(ERROR_MESSAGE_SELECTOR).should('contain.text', EMAIL_PASSWORD_MANDATORY);
    });

    it('Campos de login com espaços em branco', () => {
        cy.get('#username').type(' usuario@example.com ');
        cy.get('#password').type(VALID_PASSWORD);
        cy.get('#login-button').click();
        cy.get('#inicio').should('be.visible');
    });

    it('Exibição de senha', () => {
        cy.get('#username').type(VALID_EMAIL);
        cy.get('#password').type(VALID_PASSWORD);
        cy.get('#toggle-password').click().click().click();
        cy.get('#login-button').click();
        cy.get('#inicio').should('be.visible');
    });

    it('Redirecionamento após login', () => {
        cy.get('#username').type(VALID_EMAIL);
        cy.get('#password').type(VALID_PASSWORD);
        cy.get('#login-button').click();
        cy.wait(1000); // esperar um segundo
        cy.get('#inicio').should('be.visible');
    });

    it('Comportamento do botão "entrar"', () => {
        cy.get('#login-button').should('be.disabled');
    });

    it('Mensagens de erro', () => {
        cy.get('#username').type(INVALID_EMAIL);
        cy.get('#password').type(INVALID_PASSWORD);
        cy.get('#login-button').click();
        cy.get(ERROR_MESSAGE_SELECTOR).should('contain.text', EMAIL_PASSWORD_INVALID);
    });
});
