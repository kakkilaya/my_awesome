function bat_init(widget)
	local fd = io.popen("acpi -i | grep -Eo '[[:digit:]]{1,3}%' | head -1")
	local status = fd:read("*all")
	fd:close()

	widget:set_text(status)
end
