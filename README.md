# Página de Login para Testes Manuais, Automatizados e de Performance

Este projeto tem como objetivo a criação de uma **página de login** dedicada à execução de diferentes tipos de testes: **Testes Manuais**, **Testes Automatizados** e **Testes de Performance**.

A página permite a autenticação de usuários por meio de **e-mails** e **senhas** pré-definidos, facilitando a simulação de cenários de login em testes de interface e garantindo uma avaliação completa da funcionalidade de login.

### Tipos de Testes

- **[Testes Manuais](#testes-manuais)**
- **[Testes Automatizados](#testes-automatizados)**
- **[Testes de Performance](#testes-de-performance)**

Com base nos [requisitos definidos](requititos.md), os desenvolvedores serão responsáveis pela implementação da página de login. Após a conclusão, a equipe de **QA** será informada sobre a disponibilidade da página para execução dos testes manuais.

Uma vez realizados os testes manuais e confirmada a conformidade com os requisitos, será iniciado o processo de criação e execução dos **testes automatizados**, seguidos pelos **testes de performance**.

Todos os testes executados devem ser documentados de forma detalhada:

- [Relatório de Testes Manuais](./testes/manuais/relatorio.md)
- [Relatório de Testes Automatizados](./testes/automatizados/relatório.md)
- [Relatório de Testes de Performance](./testes/performance/relatório.md)

## Tecnologias Utilizadas na Página

- **HTML**: Estruturação do conteúdo da página.
- **CSS**: Estilização e layout da página.
- **JavaScript**: Implementação das interações dinâmicas.

---

## Testes Manuais

O teste manual envolve a autenticação de usuários com e-mails e senhas pré-definidos. A página valida as credenciais e exibe mensagens de erro quando os campos estão vazios ou as credenciais fornecidas são inválidas, garantindo a integridade do processo de login.

### Como Executar os Testes Manuais

1. **Acesse o site**: 
2. Utilize as credenciais de login fornecidas para realizar o teste:

```bash
E-mail: usuario@example.com
Senha: 1q2w3e4r
```

3. **Siga o roteiro para Testes Manuais**, que pode ser acessado [aqui](./testes/manuais/roteiro.md).

---

## Testes Automatizados

A página foi projetada para facilitar a implementação de testes automatizados, permitindo a verificação contínua e eficiente da funcionalidade de login.

### Ferramenta Utilizada: **Robot Framework**

O **Robot Framework** será utilizado para automação dos testes. Ele facilita a criação de scripts de teste para verificar diferentes cenários, como a autenticação bem-sucedida e falhas no login devido a credenciais inválidas ou campos vazios.

---

## Testes de Performance

A página de login foi otimizada para realizar testes de performance, com o objetivo de avaliar a rapidez, estabilidade e capacidade de resposta do sistema sob diferentes cenários de carga.

### Ferramenta Utilizada: **k6**

O **k6** é uma ferramenta de testes de performance utilizada para simular múltiplos usuários e avaliar o tempo de resposta e a estabilidade da página de login, incluindo a capacidade do sistema para suportar grandes volumes de requisições simultâneas.

