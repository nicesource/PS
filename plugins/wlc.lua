do
local function run(msg, matches)
    local nme = msg.to.title
    local r = get_receiver(msg)
    local welc = 'oo:'..msg.to.id
    local bay = 'zz:'..msg.to.id
    local xxxx = redis:get(welc)
    local zzzz = redis:get(bay)
    if is_momod(msg) and matches[1]== 'setwlc' then
        redis:set(welc, matches[2])
        local text = '⚙ متن خوش آمدگویی گروه شما تنظیم شد به :\n\n<i>'..matches[2]..'</i>'
        return reply_msg(msg.id, text, ok_cb, false)
    elseif redis:get(welc) and   is_momod(msg) and  matches[1]== 'delwlc' then
        redis:del(welc)
        local text = '❌ متن خوش آمدگویی گروه پاک شد'
        return reply_msg(msg.id, text, ok_cb, false)
         elseif not redis:get(welc) and is_momod(msg) and matches[1]== 'delwlc' then
        local text = 'متن خوش آمدگویی گروه از قبل حذف شده است👍👍'
        return reply_msg(msg.id, text, ok_cb, false)
    elseif redis:get(welc) and is_momod(msg) and matches[1]== 'gwelc' then
        send_large_msg('user#id'..msg.from.id, xxxx.."\n", ok_cb, false)
       local omar = "تم ✔ ارسال الترحيب الى الخاص"
        return  reply_msg(msg.id, omar, ok_cb, true)
    elseif not redis:get(welc) and is_momod(msg) and matches[1]== 'gwelc' then
        return 'قم بأضافة 🔶 ترحيب اولا 👥🔕 '
    end
    if is_momod(msg) and   matches[1]== 'setbye' then
        redis:set(bay, matches[2])
		local text = '⚙ متن خداحافظی گروه شما تنظیم شد بده \n\n<i>'..matches[2]..'</i>'
        return reply_msg(msg.id, text, ok_cb, false)
    elseif redis:get(bay) and is_momod(msg) and matches[1]== 'delbye' then
        redis:del(bay)
        local text = '⚙ متن خداحافظی گروه شما حذف شد'
        return reply_msg(msg.id, text, ok_cb, false)
         elseif not redis:get(bay) and is_momod(msg) and matches[1]== 'delbye' then
        local text = '⚙ متن خداحافظی از قبل حذف شده بود '
        return reply_msg(msg.id, text, ok_cb, false)
    elseif redis:get(bay) and is_momod(msg) and matches[1]== 'gbay' then
                send_large_msg('user#id'..msg.from.id, zzzz.."\n", ok_cb, false)
       local omar = "تم ✔ ارسال التوديع الى الخاص"
       return  reply_msg(msg.id, omar, ok_cb, true)
         elseif not redis:get(bay) and is_momod(msg) and matches[1]== 'gbay' then
        return 'قم بأضافة 🔶 توديع اولا 👥🔕'
    end
    if redis:get(bay) and matches[1]== 'chat_del_user' then
         return  reply_msg(msg.id, zzzz, ok_cb, true)
     elseif redis:get(welc) and matches[1]== 'chat_add_user' then
        local xxxx = ""..redis:get(welc).."\n"
..' '..(msg.action.user.print_name or '')..'\n'
          reply_msg(msg.id, xxxx, ok_cb, true)
          elseif redis:get(welc) and matches[1]== 'chat_add_user_link' then
        local xxxx = ""..redis:get(welc).."\n"
..' '..(msg.from.print_name or '')..'\n'
          reply_msg(msg.id, xxxx, ok_cb, true)
          elseif redis:get(welc) and matches[1]== 'channel_add_user_link' then
        local xxxx = ""..redis:get(welc).."\n"
..' '..(msg.from.print_name or '')..'\n'
          reply_msg(msg.id, xxxx, ok_cb, true)
    end
end
return {
  patterns = {
       "^[!/#](setwlc) (.*)$",
       "^[!/#](setbye) (.*)$",
       "^[!/#](delwlc)$",
       "^[!/#](delbye)$",
       "^[!/#](gwelc)$",
       "^[!/#](gbay)$",
       "^!!tgservice (chat_add_user)$",
       "^!!tgservice (chat_add_user_link)$",
       "^!!tgservice (channel_add_user_link)$",
       "^!!tgservice (chat_del_user)$"
  },
  run = run,
}

end
