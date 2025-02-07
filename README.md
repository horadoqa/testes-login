# Página de Login para Testes Manuais, Automatizados e de Performance

Este projeto tem como objetivo desenvolver uma **página de login** especialmente criada para realizar três tipos de testes: **Testes Manuais**, **Testes Automatizados** e **Testes de Performance**. A página permite autenticação de usuários utilizando **e-mails** e **senhas** pré-definidos, o que facilita a simulação de cenários de login, proporcionando uma avaliação abrangente da funcionalidade e desempenho da aplicação.

## Tipos de Testes

- **[Testes Manuais](#testes-manuais)**
- **[Testes Automatizados](#testes-automatizados)**
- **[Testes de Performance](#testes-de-performance)**

A partir dos **[requisitos](requisitos.md)** definidos, utilizaremos a abordagem **[BDD](./bdd/gherkin.md) (Behavior Driven Development)** para melhorar a comunicação entre todos os envolvidos no projeto. A especificação do comportamento será documentada utilizando a linguagem **Gherkin**, e os desenvolvedores serão responsáveis pela implementação da página de login. Após a conclusão da implementação, a equipe de **QA** será notificada sobre a disponibilidade da página para a execução dos testes manuais.

Com os testes manuais validados e a conformidade com os requisitos confirmada, iniciaremos a criação e execução dos **testes automatizados**, seguidos pelos **testes de performance**.

Todos os testes executados serão devidamente documentados:

- [Relatório de Testes Manuais](./testes/manuais/relatorio.md)
- [Relatório de Testes Automatizados](./testes/automatizados/relatório.md)
- [Relatório de Testes de Performance](./testes/performance/relatório.md)

## Tecnologias Utilizadas na Página

- **HTML**: Estruturação da página e conteúdo.
- **CSS**: Estilo e layout visual da página.
- **JavaScript**: Implementação das interações dinâmicas e validações de login.

---

## Testes Manuais

O objetivo dos **testes manuais** é validar a funcionalidade de login da página, autenticando usuários com e-mails e senhas pré-definidos. A página deve validar corretamente as credenciais e exibir mensagens de erro apropriadas em casos de campos vazios ou credenciais inválidas, garantindo que o processo de login esteja funcionando como esperado.

### Como Executar os Testes Manuais

1. Endpoint: `https://horadoqa.github.io/testes-login/login/`
2. Use as credenciais fornecidas para realizar o teste:

```bash
E-mail: usuario@example.com
Senha: 1q2w3e4r
```

3. **Siga o roteiro para Testes Manuais**, disponível [aqui](./testes/manuais/roteiro.md).

---

## Testes Automatizados

A página foi projetada para facilitar a criação e execução de **testes automatizados**, permitindo verificar de forma contínua e eficiente se a funcionalidade de login está operando conforme o esperado.

### Ferramenta Utilizada: **Robot Framework**

O **Robot Framework** será utilizado para automação dos testes. Com ele, é possível criar scripts de teste que simulam diferentes cenários de login, como autenticação bem-sucedida, tentativas com credenciais inválidas e validação de campos obrigatórios.

---

## Testes de Performance

A **página de login** foi otimizada para suportar **testes de performance**, permitindo a avaliação da velocidade, estabilidade e capacidade de resposta do sistema em diversos cenários de carga.

### Ferramenta Utilizada: **k6**

O **k6** será utilizado para realizar os **testes de performance**. Ele simula múltiplos usuários simultâneos, avaliando a capacidade do sistema de lidar com grande volume de requisições e verificando tempos de resposta sob diferentes condições de carga.

--- 
