function set_volume(widget)
	local fd = io.popen("amixer sget Master | grep -Eo '[[:digit:]]{1,3}%' | head -1")
	local status = fd:read("*all")
	fd:close()

	widget:set_text(status)
end
