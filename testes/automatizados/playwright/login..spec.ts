const { test, expect } = require('@playwright/test');

const URL = 'https://horadoqa.github.io/testes-login/login/';
const VALID_EMAIL = 'usuario@example.com';
const VALID_PASSWORD = '1q2w3e4r';
const INVALID_EMAIL = 'invalido@dominio.com';
const INVALID_PASSWORD = 'SenhaErrada123';
const ERROR_MESSAGE_SELECTOR = '#error-message';
const EMAIL_PASSWORD_INVALID = 'E-mail ou senha inválidos! Tentativas restantes:';
const EMAIL_PASSWORD_MANDATORY = 'E-mail e senha são obrigatórios!';

test.describe('Login Tests', () => {

    test.beforeEach(async ({ page }) => {
        await page.goto(URL);
    });

    test('Acesso à página de login', async ({ page }) => {
        await expect(page.locator('#username')).toBeVisible();
        await expect(page.locator('#password')).toBeVisible();
        await expect(page.locator('#login-button')).toBeVisible();
    });

    test('Login com credenciais válidas', async ({ page }) => {
        await page.fill('#username', VALID_EMAIL);
        await page.fill('#password', VALID_PASSWORD);
        await page.click('#login-button');
        await expect(page.locator('#inicio')).toBeVisible();
    });

    test('Login com credenciais inválidas', async ({ page }) => {
        await page.fill('#username', INVALID_EMAIL);
        await page.fill('#password', INVALID_PASSWORD);
        await page.click('#login-button');
        await expect(page.locator(ERROR_MESSAGE_SELECTOR)).toContainText(EMAIL_PASSWORD_INVALID);
    });

    test('Campo de "E-mail" vazio', async ({ page }) => {
        await page.fill('#password', VALID_PASSWORD);
        await page.click('#login-button');
        await expect(page.locator(ERROR_MESSAGE_SELECTOR)).toContainText(EMAIL_PASSWORD_MANDATORY);
    });

    test('Campo de "senha" vazio', async ({ page }) => {
        await page.fill('#username', VALID_EMAIL);
        await page.click('#login-button');
        await expect(page.locator(ERROR_MESSAGE_SELECTOR)).toContainText(EMAIL_PASSWORD_MANDATORY);
    });

    test('Campos de login com espaços em branco', async ({ page }) => {
        await page.fill('#username', ' usuario@example.com ');
        await page.fill('#password', VALID_PASSWORD);
        await page.click('#login-button');
        await expect(page.locator('#inicio')).toBeVisible();
    });

    test('Exibição de senha', async ({ page }) => {
        await page.fill('#username', VALID_EMAIL);
        await page.fill('#password', VALID_PASSWORD);
        await page.click('#toggle-password');
        await page.click('#toggle-password');
        await page.click('#toggle-password');
        await page.click('#login-button');
        await expect(page.locator('#inicio')).toBeVisible();
    });

    test('Redirecionamento após login', async ({ page }) => {
        await page.fill('#username', VALID_EMAIL);
        await page.fill('#password', VALID_PASSWORD);
        await page.click('#login-button');
        await page.waitForTimeout(1000); // esperar um segundo
        await expect(page.locator('#inicio')).toBeVisible();
    });

    test('Comportamento do botão "entrar"', async ({ page }) => {
        const loginButton = page.locator('#login-button');
        const disabled = await loginButton.isDisabled();
        expect(disabled).toBe(true);
    });

    test('Mensagens de erro', async ({ page }) => {
        await page.fill('#username', INVALID_EMAIL);
        await page.fill('#password', INVALID_PASSWORD);
        await page.click('#login-button');
        await expect(page.locator(ERROR_MESSAGE_SELECTOR)).toContainText(EMAIL_PASSWORD_INVALID);
    });
});
