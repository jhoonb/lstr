# lstr.lua


`lstr` módulo de operações comuns em `string` para **Lua**.

funções:
- `lstr.`
  - `count(s, subs) --> number`
  - `replace(s, old, new) --> string`
  - `join(t, sep) --> string`
  - `split(s, sep) --> table`
  - `strip(s) --> string`
  - `startswith(s, subs) -> boolean`
  - `endswith(s, subs) -> boolean`
  - `trim(s) -> string, equal strip`
  

[TODO]: 
- em cada função acima coloca parâmetro `start`, `end` ?


Usando como base de dados para os testes o arquivo: *test_EntireBivle-CPDV.json*.
Arquivo ´json´ com todo o texto da Biblia Católica em inglês:
- 38656 linhas
- 5657180 caracteres

test
===

Linux 18.04.4-Ubuntu. 
Intel® Core™ i7-4500U CPU @ 1.80GHz × 4. 7 GiB RAM.


```bash
time lua test_lstr.lua
Testing function: lstr.count
Tested with success! Tempo de execução: 1.05127s

Testing function: lstr.endwith
Tested with success! Tempo de execução: 7e-06s

Testing function: lstr.join
Tested with success! Tempo de execução: 8e-06s

Testing function: lstr.replace
Tested with success! Tempo de execução: 9e-06s

Testing function: lstr.split
Tested with success! Tempo de execução: 0.045488s

Testing function: lstr.split - version 2
Tested with success! Tempo de execução: 3.9e-05s

Testing function: lstr.split - version 3
Tested with success! Tempo de execução: 1.4e-05s

Testing function: lstr.startwith
Tested with success! Tempo de execução: 3e-06s

Testing function: lstr.strip - (check inside .trim)
Tested with success! Tempo de execução: 0.274943s

lua test_lstr.lua  1,55s user 0,09s system 102% cpu 1,598 total
```