#
# script apenas para teste de comparação com Lua. 
# Jhonathan Paulo Banczek. 2020 - jpbanczek@gmail.com - github.com/jhoonb
# 


from timeit import default_timer as timer


file_name = "test_EntireBible-CPDV.json"
with open(file_name, "r") as f:
    bible = f.read()

# words = ('lord', 'Lord', 
# 'angel', 'Angel', 
# 'Jesus', 'Mary', 
# 'love', 'Love', 
# 'way', 'Way', 
# 'saint', 'saints', 
# 'Saint', 'Saints')

words_count = {
    'lord': 340, 
    'Lord': 8026,
    'angel': 90,
    'Angel': 289,
    'Jesus': 985,
    'Mary': 55,
    'love': 658,
    'Love': 10,
    'way': 3206,
    'Way': 10,
    'saint': 84,
    'saints': 82,
    'Saint': 7,
    'Saints': 6
}

def frun(f, f_name):
    print("Testing function: ", f_name)
    start = timer()
    f()
    end = timer()
    time_final = end - start
    print("Tested with success! Time: {} \n".format((time_final)))


def test_strip():
    global bible
    bible = bible.strip()

def test_split1():
    for k, v in words_count.items():
        c = bible.split(k)
        assert len(c) == v+1, "error split"


def test_split2():
    s = "In principio erat Verbum, et Verbum erat apud Deum, et Deus erat Verbum"
    
    ok_verbum = ["In principio erat ", ", et ", " erat apud Deum, et Deus erat ", ""]
    
    ok_comma = ["In principio erat Verbum", " et Verbum erat apud Deum", 
    " et Deus erat Verbum"]
    
    ok_space = ["In", "principio", "erat", "Verbum,", "et", "Verbum", "erat", "apud", 
    "Deum,","et", "Deus", "erat", "Verbum"]
    
    resp = s.split("Verbum")
    for i in range(len(resp)):
        assert ok_verbum[i] == resp[i], "error split2: Verbum"

    resp = s.split(",")
    for i in range(len(resp)):
        assert ok_comma[i] == resp[i], "error split2: comma"

    resp = s.split(" ")
    for i in range(len(resp)):
        assert ok_space[i] == resp[i], "error split2: space"


def test_split3():
  link = "/path/dir/dir2/dir3/"
  check = ["", "path", "dir", "dir2", "dir3", ""]
  c = link.split("/")
  for i in range(len(c)):
    assert c[i] == check[i], "error split3"


def test_join():
  t = [ "In", "principio", "erat", "Verbum,", "et", 
  "Verbum", "erat", "apud", "Deum,", "et", "Deus", "erat", "Verbum"]
  ok = "In principio erat Verbum, et Verbum erat apud Deum, et Deus erat Verbum"
  resp = " ".join(t)
  assert ok == resp, "error join" 


def test_startswith():
    s1 = "lua linguagem de programação"
    s2 = "LuaLinguagemde de Programação"
    assert s1.startswith("lua"), "error startswith"
    assert s2.startswith("Lua"), "error startswith"
    assert not s1.startswith("xua l"), "error startswith"


def test_endswitch():
    s = "The Programming Language Lua"
    assert s.endswith("Lua"), "error endswitch"
    assert s.endswith("e Lua"), "error endswitch"
    assert s.endswith("Language Lua"), "error endswitch"
    assert not s.endswith("Haskell"), "error endswitch"


def test_replace():
  s = "In principio erat Verbum, et Verbum erat apud Deum, et Deus erat Verbum"
  # Verbum -> Verbo
  ok = "In principio erat Verbo, et Verbo erat apud Deum, et Deus erat Verbo"
  resp = s.replace("Verbum", "Verbo")
  assert ok == resp, "error replace"
  # et -> e
  ok = "In principio erat Verbum, e Verbum erat apud Deum, e Deus erat Verbum"
  resp = s.replace("et", "e")
  assert ok == resp, "error replace"


def test_count():

    for k, v in words_count.items():
        c = bible.count(k)
        assert c == v, "error count"

# ------------------------------------------------
def run():
    frun(test_strip, "strip")
    frun(test_count, "count")
    frun(test_endswitch, "endswitch")
    frun(test_join, "join")
    frun(test_replace, "replace")
    frun(test_split1, "split")
    frun(test_split2, "split - version 2")
    frun(test_split3, "split - version 3")
    frun(test_startswith, "startswith")


# ------------------------------------------------
run()



# qnt = len(bible.split("Lord"))
# for word in words:
#     #c = bible.count(word)
#     #linha abaixo para gerar os valores e comparar com Lua
#     #print(f"count-> world: {word} = ", c)
#     print(f"count-> world: {word} = ", len(bible.split(word)))
