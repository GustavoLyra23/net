#!/usr/bin/env bash
# Roda todos os testes .mag usando o interpretador Mag.
# Uso: MAG_JAR=/caminho/mag.jar bash run_tests.sh
set -euo pipefail

JAR="${MAG_JAR:?defina MAG_JAR com o caminho do mag.jar}"
mkdir -p test_files
echo '{"versao":"1.0","bibliotecas":[]}' > test_files/load.json

fail=0
total=0
for f in testes/teste_*.mag; do
    echo "== $f =="
    out=$(printf 'run %s\nsair\n' "$f" | java -jar "$JAR" 2>&1 | grep -vE "SLF4J|Iniciando|Digite")
    echo "$out" | grep -E "PASS:|FALHA:|ERROR" || true
    n=$(echo "$out" | grep -c "PASS:" || true)
    total=$((total + n))
    if echo "$out" | grep -qE "FALHA:|ERROR"; then
        fail=1
    fi
done

echo "-----------------------------"
echo "Total de asserts PASS: $total"
if [ "$fail" = 0 ]; then
    echo "ALL TESTS PASSED"
else
    echo "TESTS FAILED"
    exit 1
fi
