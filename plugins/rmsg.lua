local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'" پیام اخیر سوپر گروه حذف شد', ok_cb, false)
  else
    send_msg(extra.chatid, 'تعداد پیام مورد نظر شما پاک شد', ok_cb, false)
  end
end
local function run(msg, matches)
  if matches[1] == 'rmsg' and is_owner(msg) then
    if msg.to.type == 'channel' then
	if redis:get("id:"..msg.to.id..":"..msg.from.id) then
return "⚜ این دستور هر نیم ساعت امکان پذیر است\n نیم ساعت شما هنوز تموم نشده است، لطفا دوباره امتحان نکنید"
end
redis:setex("id:"..msg.to.id..":"..msg.from.id, 60, true)
      if tonumber(matches[2]) > 300 or tonumber(matches[2]) < 1 then
        return "تعداد بیشتر از 300 مجاز نیست"
      end
      get_history(msg.to.peer_id, matches[2] + 1 , history , {chatid = msg.to.peer_id, con = matches[2]})
    else
      return "فقط در سوپرگروه ممکن است"
    end
  else
    return "شما دسترسی ندارید"
  end
end

return {
    patterns = {
        '^[!/#](rmsg) (%d*)$'
    },
    run = run
}
