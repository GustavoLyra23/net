# net

Networking library (http/net) for the [Mag](https://github.com/GustavoLyra23/mag) language.

Written entirely in Mag and split into modules, so it stays easy to maintain.
It is a layer over Mag native sockets (`ler_socket` and `escrever_socket`)
plus helpers to build HTTP style messages. The wire protocol is line based
(one line per connection).

## Usage

```mag
importar "net.mag"

imprimir(linhaStatus(404));
imprimir(requisicao(GET, "/api/users"));
imprimir(montarUrl("localhost", 8080, "/users"));
imprimir(resposta(200, "ok"));
```

Echo server (see `exemplo_servidor.mag`):

```
run exemplo_servidor.mag
```

Then from another terminal:

```
printf 'ola mundo\n' | nc localhost 8080
```

Build HTTP style messages (see `exemplo_http.mag`):

```
run exemplo_http.mag
```

## Modules

### core
`PORTA_PADRAO`, `HOST_LOCAL`, `escutar`, `escutar_local`, `responder`,
`responder_local`, `eco`

### http/status
`statusTexto`, `ehInformativo`, `ehSucesso`, `ehRedirecionamento`,
`ehErroCliente`, `ehErroServidor`

### http/metodos
`GET`, `POST`, `PUT`, `PATCH`, `DELETE`, `HEAD`, `OPTIONS`, `ehMetodoValido`,
`temCorpo`

### http/headers
`contentType`, `contentLength`, `tipoTexto`, `tipoJson`, `tipoHtml`,
`autorizacaoBearer`

### http/http
`linhaStatus`, `requisicao`, `cabecalho`, `resposta`, `respostaOk`,
`respostaErro`

### url
`autoridade`, `montarUrl`, `comQuery`, `maisQuery`

### utils/texto
`repetir`, `vazio`, `naoVazio`

## Notes

Mag native sockets open and close one connection per call and work line by
line, so this is not a full HTTP server. The HTTP module builds message
strings useful for simple text protocols over TCP.
