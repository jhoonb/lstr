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
- em cada função acima colocar parâmetro `start`, `end` ?


Usando como base de dados para os testes o arquivo: [test_EntireBible-CPDV.json](https://github.com/jhoonb/lstr/blob/master/test_EntireBible-CPDV.json)

Arquivo `json` com todo o texto da Biblia Católica em inglês:
- 38656 linhas
- 5657180 caracteres

test
===

Linux 18.04.4-Ubuntu. 
Intel® Core™ i7-4500U CPU @ 1.80GHz × 4. 7 GiB RAM.

- *Script* para teste de  comparação (*Python*): [test_python.py](https://github.com/jhoonb/lstr/blob/master/test_python.py)

- Teste em *Lua*, código: [test_lstr.py](https://github.com/jhoonb/lstr/blob/master/test_lstr.lua)

Resultado (*Lua*):
```bash
time lua test_lstr.lua
Testing function: lstr.count
Tested with success! Time: 0.924594s

Testing function: lstr.endwith
Tested with success! Time: 5e-06s

Testing function: lstr.join
Tested with success! Time: 8e-06s

Testing function: lstr.replace
Tested with success! Time: 5e-06s

Testing function: lstr.split
Tested with success! Time: 0.045324s

Testing function: lstr.split - version 2
Tested with success! Time: 4.5e-05s

Testing function: lstr.split - version 3
Tested with success! Time: 1.6e-05s

Testing function: lstr.startwith
Tested with success! Time: 4e-06s

Testing function: lstr.strip - (check inside .trim)
Tested with success! Time: 0.253706s

lua test_lstr.lua  1,40s user 0,07s system 103% cpu 1,420 total
```

Resultado (*Python*):
```bash
time python test_python.py 
Testing function:  strip
Tested with success! Time: 2.9809889383614063e-06 

Testing function:  count
Tested with success! Time: 0.08391829900210723 

Testing function:  endswitch
Tested with success! Time: 7.429975084960461e-06 

Testing function:  join
Tested with success! Time: 5.407026037573814e-06 

Testing function:  replace
Tested with success! Time: 7.64097785577178e-06 

Testing function:  split
Tested with success! Time: 0.13978277595015243 

Testing function:  split - version 2
Tested with success! Time: 1.8385995645076036e-05 

Testing function:  split - version 3
Tested with success! Time: 1.6789999790489674e-05 

Testing function:  startswith
Tested with success! Time: 5.252019036561251e-06 

python test_python.py  0,30s user 0,07s system 104% cpu 0,358 total
```


;)