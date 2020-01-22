grub.run ("cat (http)/ --set=zfc")
zfc = grub.getenv ("zfc")
local lua_util = {};
function lua_util.url_encode(str)
  if (str) then
    str = string.gsub (str, "\n", "\r\n")
    str = string.gsub (str, "([^%w ])",
        function (c) return string.format ("%%%02X", string.byte(c)) end)
    str = string.gsub (str, " ", "+")
  end
  return str	
end

function lua_util.url_decode(str)
  str = string.gsub (str, "+", " ")
  str = string.gsub (str, "%%(%x%x)",
      function(h) return string.char(tonumber(h,16)) end)
  str = string.gsub (str, "\r\n", "\n")
  return str
end

zfc = lua_util.url_decode (zfc)
zfc = gbk.toutf8(zfc)
print(zfc);
grub.exportenv ("zfc", zfc)	
return lua_util;