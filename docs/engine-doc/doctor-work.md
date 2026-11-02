# Mdev Doctor e seu funcionamento

## Fluxo de etapas

```
                 mdev doctor
                      |
                      v
                run_doctor()
                      |
           +----------+----------+
           |          |          |
           v          v          v
      Verificações  Verificações  Verificações
      do sistema    de acesso     de ferramentas
           |          |          |
           +----------+----------+
                      |
                      v
               Coleta resultados
                      |
                      v
               generate_report()
                      |
             +--------+--------+
             |                 |
             v                 v
       Exibição no       Salvamento em
       terminal          latest.json
```

## Padrão de resultados

| Estado | Significado |
|---|---|
| `OK` | Requisito atendido |
| `WARN` | Condição não ideal, mas sem impedir o funcionamento |
| `FAIL` | Problema que impede alguma funcionalidade essencial |

## Modelo de saída
```
mdev doctor
==========

[AMBIENTE]
[ OK ] Sistema operacional identificado
[ OK ] Arquitetura identificada
[WARN] Sem acesso a /dev/kvm

[DEPENDÊNCIAS]
[ OK ] git
[ OK ] python3
[WARN] gh não encontrado
[FAIL] Configuração principal não encontrada

[REPOSITÓRIOS]
[ OK ] Notas
[ OK ] Projetos
[WARN] Repositório de trabalho não encontrado

[RESUMO]
Verificações: 9
Sucesso:      6
Avisos:       2
Falhas:       1

==========
```
---