function set_volume(widget)
	local fd = io.popen("amixer get Master | grep -Eo '[[:digit:]]{1,3}%' | head -1")
	local status = fd:read("*all")
	fd:close()

	widget:set_text(status)
end

function volume_toggle(widget)
	local fd = io.popen("amixer get Master | grep -Eo '[[[:alpha:]]+]' | head -1")
	local status = fd:read("*all")
	fd.close()

	if string.find(status, "on", 1, true) then
		widget:set_text("🔊 ")
	else
		widget:set_text("🔇 ")
	end
end
