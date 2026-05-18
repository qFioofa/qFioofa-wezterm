return function(config)
	local find_powershell = function()
		local candidates = {
			"pwsh",
			"powershell",
		}

		for _, cmd in ipairs(candidates) do
			local f = io.popen("where " .. cmd .. " 2>nul")
			if f then
				local path = f:read("*a")
				f:close()
				if path and path:find(cmd, 1, true) then
					return cmd
				end
			end
		end
		return os.getenv("SystemRoot")
			.. "\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
	end
	config.default_prog = { find_powershell(), "-NoLogo" }
end
