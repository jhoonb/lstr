file_name = "test_EntireBible-CPDV.json"
with open(file_name, "r") as f:
    bible = f.read()

words = ('lord', 'Lord', 
'angel', 'Angel', 
'Jesus', 'Mary', 
'love', 'Love', 
'way', 'Way', 
'saint', 'saints', 
'Saint', 'Saints')

qnt = len(bible.split("Lord"))
for word in words:
    #c = bible.count(word)
    #linha abaixo para gerar os valores e comparar com Lua
    #print(f"count-> world: {word} = ", c)
    print(f"count-> world: {word} = ", len(bible.split(word)))