--[[
  Jhonathan Paulo Banczek. 2020 - jpbanczek@gmail.com - github.com/jhoonb
--]]


--
-- 
local lstr = require("lstr")
local open = io.open
local tostring = tostring
local sub = string.sub
local clock = os.clock
local time = os.time
local difftime = os.difftime
local string = string

--
-- load complete bible text
local file_name = "test_EntireBible-CPDV.json"
local bible = open(file_name):read("*a")

--
-- occurrence table
local words_count = {
  [1] = {'lord', 340},
  [2] = {'Lord', 8026},
  [3] = {'angel', 90},
  [4] = {'Angel', 289},
  [5] = {'Jesus', 985},
  [6] = {'Mary', 55},
  [7] = {'love', 658},
  [8] = {'Love', 10},
  [9] = {'way', 3206},
  [10] = {'Way', 10},
  [11] = {'saint', 84},
  [12] = {'saints', 82},
  [13] = {'Saint', 7},
  [14] = {'Saints', 6}
}

--
-- ferror return a message error
local ferror = function(expected, received)
  return "expected: " .. tostring(expected) .. "| received: " .. tostring(received)
end

--
--  runf running test
local runf = function(f, name_f)
  -- usar .clock()? ou .time()?
  print("Testing function: " .. name_f)
  local starttime = clock()
  -- local starttime = time()
  f()
  local endtime = clock()
  -- local endtime = time()
  local finaltime = string.format("Time: %gs\n", endtime-starttime) 
  -- local finaltime = string.format("Time: %gs\n", difftime(endtime, starttime))
  print("Tested with success! " .. finaltime .. "\n")
end

--
-- lstr.count test
-- using input = bible complete text
local test_count = function()
  for i=1, #words_count do
    local c = lstr.count(bible, words_count[i][1])
    assert(c == words_count[i][2], 
    ferror(words_count[i][2], c))
  end
end

--
-- lstr.replace test
local test_replace = function()
  local s = "In principio erat Verbum, et Verbum erat apud Deum, et Deus erat Verbum"
  -- Verbum -> Verbo
  local ok = "In principio erat Verbo, et Verbo erat apud Deum, et Deus erat Verbo"
  local resp = lstr.replace(s, "Verbum", "Verbo")
  assert(ok == resp, ferror(ok, resp))
  -- et -> e
  local ok = "In principio erat Verbum, e Verbum erat apud Deum, e Deus erat Verbum"
  local resp = lstr.replace(s, "et", "e")
  assert(ok == resp, ferror(ok, resp))
end

--
-- lstr.split test
-- using: bible complete text
local test_split = function()
  for i = 1, #words_count do
    local c = lstr.split(bible, words_count[i][1])
    --print(words_count[i][2] .. " -> " .. words_count[i][1] .. " = " .. #c)
    assert(#c == words_count[i][2]+1, 
    ferror(#c, words_count[i][2]+1))
  end
end

--
-- lstr.startwith test
local test_startwith = function()
  local s1 = "lua linguagem de programação"
  local s2 = "LuaLinguagemde de Programação"
  assert(lstr.startwith(s1, "lua"))
  assert(lstr.startwith(s2, "Lua"))
  assert(not lstr.startwith(s1, "xua l"))
end

-- lstr.endwith test
local test_endwith = function()
  local s = "The Programming Language Lua"
  local n = lstr.endwith(s, "Lua")
  assert(n, ferror(true, n))
  local n = lstr.endwith(s, "Language Lua")
  assert(n, ferror(true, n))
  local n = lstr.endwith(s, "Haskell")
  assert(not n, ferror(false, n))
end

--
-- lstr.split test
local test_split3 = function()
  local link = "/path/dir/dir2/dir3/"
  local check = {"", "path", "dir", "dir2", "dir3", ""}
  local c = lstr.split(link, "/")
  -- print(table.unpack(c))
  -- print(words_count[i][2] .. " -> " .. words_count[i][1] .. " = " .. c)
  for i=1, #check do 
    assert(c[i] == check[i], ferror(c[i], check[i]))
    --print(check[i] .. " -> " .. c[i])
  end
end

--
-- lstr.split test
local test_split2 = function()

  local s = "In principio erat Verbum, et Verbum erat apud Deum, et Deus erat Verbum"

  local ok_verbum = {
    "In principio erat ", 
    ", et ", 
    " erat apud Deum, et Deus erat ",
    ""
  }

  local ok_comma = {
    "In principio erat Verbum", 
    " et Verbum erat apud Deum", 
    " et Deus erat Verbum"
  }

  local ok_space = {
    "In", "principio", "erat", "Verbum,", "et", 
    "Verbum", "erat", "apud", "Deum,", 
    "et", "Deus", "erat", "Verbum"
  }

  local resp = lstr.split(s, "Verbum")
  -- print(table.unpack(resp), #resp)
  for i=1, #ok_verbum do 
    assert(ok_verbum[i] == resp[i], ferror(ok_verbum[i], resp[i])) 
  end

  local resp = lstr.split(s, ",")
  for i=1, #ok_comma do 
    assert(ok_comma[i] == resp[i], ferror(ok_comma[i], resp[i])) 
  end

  local resp = lstr.split(s, " ")
  for i=1, #ok_space do 
    assert(ok_space[i] == resp[i], ferror(ok_space[i], resp[i])) end
end

--
-- lstr.strip test
local test_strip = function()
  -- print(#bible)
  local c = lstr.strip(bible)
  assert(sub(bible, 1, 1) ~= "" and sub(bible, #bible) ~= "")
  -- check function
  assert(lstr.trim == lstr.strip, ferror(lstr.trim, lstr.strip))
end

--
-- lstr.join test
local test_join = function()
  local t = {
    "In", "principio", "erat", "Verbum,", "et", 
    "Verbum", "erat", "apud", "Deum,", 
    "et", "Deus", "erat", "Verbum"
  }
  local ok = "In principio erat Verbum, et Verbum erat apud Deum, et Deus erat Verbum"
  resp = lstr.join(t, " ")
  assert(ok == resp, ferror(ok, resp))
end



--------------------------------------------
--------------------------------------------
local function run()
  runf(test_count, "lstr.count")
  runf(test_endwith, "lstr.endwith")
  runf(test_join, "lstr.join")
  runf(test_replace, "lstr.replace")
  runf(test_split, "lstr.split")
  runf(test_split2, "lstr.split - version 2")
  runf(test_split3, "lstr.split - version 3")
  runf(test_startwith, "lstr.startwith")
  runf(test_strip, "lstr.strip - (check inside .trim)")
end

--------------------------------------------
-- running test!
run()