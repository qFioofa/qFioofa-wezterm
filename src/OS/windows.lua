local M = {}

local function find_powershell()
	local candidates = {
		{ query = "pwsh.exe", exe = "pwsh.exe" },
		{ query = "powershell.exe", exe = "powershell.exe" },
	}

	for _, candidate in ipairs(candidates) do
		local f = io.popen('where "' .. candidate.query .. '" 2>nul')
		if f then
			local output = f:read("*a") or ""
			f:close()

			for line in output:gmatch("[^\r\n]+") do
				local path = line:gsub("^%s+", ""):gsub("%s+$", "")

				local ends_with_exe = path:lower():sub(-#candidate.exe) == candidate.exe
				local is_absolute = path:match("^%a:[/\\]") ~= nil
				if ends_with_exe and is_absolute then
					local probe = io.open(path, "r")
					if probe then
						probe:close()
						return path
					end
				end
			end
		end
	end

	return (os.getenv("SystemRoot") or "C:\\Windows")
		.. "\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
end

function M.apply_to_config(config)
	config.default_prog = { find_powershell(), "-NoLogo" }
end

return M
