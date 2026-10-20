# O que é o diretório tests

Representa testes que precisam ser feitos para garantir o funcionamento das implementações desse projeto.

## Subdiretórios

- `unit-tests/`
- `integration-tests/`
- `e2e-tests/`
- `system-tests/`

## Estrutura básica dos testes

```bats
#!/usr/bin/env bats

PROJECT_ROOT="$(cd "$BATS_TEST_DIRNAME/../.." && pwd)"

setup() {
    source "$PROJECT_ROOT/lib/utils/command.sh"
}

@test "descrição do comportamento esperado" {
    # Preparar o cenário
    # Executar a função
    # Verificar o resultado
}

```

## Testando a suíte de testes

- testando tudo e vendo o resultado no terminal: `bash ./tests/main-tests.sh all` 
- escolhendo quais testes: `bash ./tests/main-tests.sh units integration system` 
- pedindo ajuda para usar o script: `bash ./tests/main-tests.sh --help` 

---
