local batntf = nil

function remove_batntf()
	if batntf ~= nil then
		naughty.destroy(batntf)
		batntf = nil
	end
end

function add_batntf()
	remove_batntf()
	local batinf = awful.util.pread("acpi -i | head -1 | sed -e 's/, /\\n/g' | tail -1")
	batntf = naughty.notify({
		text = string.format('<span font_desc="%s">%s</span>',
		"monospace", batinf),
		timeout = 0, hover_timeout = 0.5
		--width = 160
	})
end
