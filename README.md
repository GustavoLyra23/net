# mag-net

Biblioteca de rede (http/net) para a linguagem [Mag](https://github.com/GustavoLyra23/mag).

Escrita 100% em Mag. É uma camada fina sobre os sockets nativos do Mag
(`ler_socket` / `escrever_socket`), com um protocolo baseado em **linhas**
(uma linha por conexão).

## Uso

```mag
importar "net.mag"

imprimir(resposta_ok("ola"));        // 200 OK ola
imprimir(resposta_erro(404, "x"));   // 404 ERRO x
```

Servidor de eco (veja `exemplo_servidor.mag`):

```bash
# terminal 1 — no REPL do Mag
run exemplo_servidor.mag

# terminal 2
printf 'ola mundo\n' | nc localhost 8080
```

## Funções

| Função | Descrição |
|--------|-----------|
| `escutar(host, porta)` | Aguarda uma conexão e retorna a linha recebida |
| `escutar_local(porta)` | Igual, em `localhost` |
| `responder(host, porta, msg)` | Aguarda uma conexão e envia `msg` |
| `responder_local(porta, msg)` | Igual, em `localhost` |
| `resposta_ok(corpo)` | Monta `200 OK <corpo>` |
| `resposta_erro(codigo, corpo)` | Monta `<codigo> ERRO <corpo>` |
| `eco(host, porta)` | Recebe uma linha e devolve `eco: <linha>` |

## Constantes

`PORTA_PADRAO` (8080), `HOST_LOCAL` (`localhost`)

## Limitações

Os sockets nativos do Mag abrem e fecham uma conexão por chamada e operam
linha a linha — não é um servidor HTTP completo. Esta lib facilita protocolos
de texto simples sobre TCP.
