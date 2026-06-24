# net

Networking library (http/net) for the [Mag](https://github.com/GustavoLyra23/mag) language.

Written entirely in Mag. It is a thin layer over Mag native sockets
(`ler_socket` and `escrever_socket`), using a line based protocol
(one line per connection).

## Usage

```mag
importar "net.mag"

imprimir(resposta_ok("ola"));
imprimir(resposta_erro(404, "x"));
```

Echo server (see `exemplo_servidor.mag`):

```
run exemplo_servidor.mag
```

Then from another terminal:

```
printf 'ola mundo\n' | nc localhost 8080
```

## Functions

* `escutar(host, porta)` wait for a connection and return the received line
* `escutar_local(porta)` same, on localhost
* `responder(host, porta, msg)` wait for a connection and send msg
* `responder_local(porta, msg)` same, on localhost
* `resposta_ok(corpo)` build `200 OK <corpo>`
* `resposta_erro(codigo, corpo)` build `<codigo> ERRO <corpo>`
* `eco(host, porta)` receive a line and return `eco: <line>`

## Constants

`PORTA_PADRAO` (8080) and `HOST_LOCAL` (localhost)

## Notes

Mag native sockets open and close one connection per call and work line by
line, so this is not a full HTTP server. The library helps with simple text
protocols over TCP.
