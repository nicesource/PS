local function run(msg, matches) 
if matches[1] == "setpm" then 
if not is_sudo(msg) then
return '<b> You Are Not </b><i>Aryan :D </i>' 
end 
local pm = matches[2] 
redis:set('bot:pm',pm) 
return '<b>Secretary Pm</b> Has Been <b>Seted</b> !' 
end 

if matches[1] == "pm" and is_sudo(msg) then
local hash = ('bot:pm') 
    local pm = redis:get(hash) 
    if not pm then 
    return '<b>Pm</b> Not <b>Seted</b> !' 
    else 
    reply_msg(msg.id, '<b>Secretary Pm</b>:\n\n'..pm, ok_cb, false)
    end
end

if matches[1]=="secretary" then 
if not is_sudo(msg) then 
return 'You Do Not Have any <b>Rank</b> On This <b>Self-Bot</b>'
end 
if matches[2]=="on"then 
redis:set("bot:pm", "no pm")
return "<b>Secretary</b> Enabled \nPlease <b>SetPm</b> Again !" 
end 
if matches[2]=="off"then 
redis:del("bot:pm")
return "<b>Secretary</b> Disabled !" 
end
 end
if not is_sudo(msg) then
  if msg.to.type == "user" and msg.text then
  if redis:get("id:"..msg.to.id..":"..msg.from.id) then
return
end
redis:setex("id:"..msg.to.id..":"..msg.from.id, 36000, true)
    local hash = ('bot:pm') 
    local pm = redis:get(hash)
if msg.from.id == 209238347 or msg.to.type == 'channel' or msg.to.type == 'chat' then
return
else
    reply_msg(msg.id, pm, ok_cb, false)
    end 
    end
end
end
return { 
patterns ={ 
"^[!#/](setpm) (.*)$", 
"^[!#/](secretary) (on)$", 
"^[!#/](secretary) (off)$", 
"^[!#/](pm)$", 
"^(.*)$", 
}, 
run = run 
}


