# Relatório de Teste de Performance da Página de Login

## Objetivo
O objetivo deste teste de performance foi avaliar a **capacidade de resposta** e a **escabilidade** da página de login em diferentes cenários de uso, incluindo a medição do **TPS (Transações por Segundo)**, **tempo de resposta**, **VUS (Usuários Virtuais Simultâneos)** e o **tempo total de execução do teste**.

## Metodologia
O teste foi conduzido utilizando uma ferramenta de automação de testes de performance para simular a carga de usuários acessando a página simultaneamente. A cada interação de login, foram verificadas as métricas de tempo de resposta, TPS e o comportamento da página com diferentes quantidades de VUS.

### Parâmetros Testados:
- **VUS (Usuários Virtuais Simultâneos)**: Número de usuários simulados acessando a página ao mesmo tempo.
- **TPS (Transações por Segundo)**: Número de transações (logins) realizadas por segundo.
- **Tempo de Resposta**: Tempo médio necessário para a página responder a uma solicitação de login.
- **Tempo de Teste**: Tempo total em que o teste foi executado.

---

## Resultados

| **Métrica**                | **Valor Obtido**  |
|----------------------------|-------------------|
| **Número de VUS**           | 100               |
| **TPS (Transações por Segundo)** | 45                |
| **Tempo Médio de Resposta** | 1.2 segundos      |
| **Tempo Máximo de Resposta**| 2.5 segundos      |
| **Tempo Mínimo de Resposta**| 0.8 segundos      |
| **Tempo Total de Teste**   | 30 minutos        |

### Análise dos Resultados:
- **TPS (Transações por Segundo)**: O sistema conseguiu realizar 45 logins por segundo, o que é considerado satisfatório para a carga simulada.
- **Tempo de Resposta**: O tempo médio de resposta foi de **1.2 segundos**, indicando que a página respondeu rapidamente à maioria das solicitações de login. O tempo máximo de resposta foi de **2.5 segundos**, o que é aceitável, mas deve ser monitorado com maiores quantidades de usuários.
- **VUS**: O sistema foi testado com 100 usuários virtuais simultâneos, representando um cenário de carga moderada. O comportamento da página foi estável durante o teste.
- **Tempo de Teste**: O teste foi executado por um período de 30 minutos, suficiente para avaliar o desempenho sob carga constante.

## Conclusões

- A página apresentou **desempenho satisfatório** com até 100 usuários simultâneos, mantendo uma boa taxa de TPS e um tempo de resposta aceitável.
- Não foram observados **erros críticos** ou **quedas de performance** durante o teste.
- Recomenda-se realizar testes de stress com um número maior de VUS para avaliar a escalabilidade da página em cenários de carga mais alta.

## Recomendações
- **Monitoramento contínuo**: É recomendado continuar monitorando o tempo de resposta com uma maior quantidade de usuários virtuais (por exemplo, 500 ou 1000 VUS) para identificar possíveis problemas de performance em cargas mais pesadas.
- **Otimização de código**: Se o tempo de resposta aumentar significativamente com cargas mais altas, uma revisão de otimização de código pode ser necessária para melhorar o desempenho.

---
