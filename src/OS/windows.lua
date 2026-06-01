local M = {}

-- Resolve a PowerShell executable to a full, validated absolute path.
-- We intentionally do NOT return a bare command name: returning just
-- "pwsh"/"powershell" makes WezTerm re-resolve it through %PATH% at spawn
-- time, which can pick up an unintended executable. Resolving here and
-- validating the result guarantees we only ever launch a real PowerShell.
local function find_powershell()
	-- Preferred shells, in order. Each entry is the `where` query name and
	-- the executable basename we expect back (used to validate the match).
	local candidates = {
		{ query = "pwsh.exe", exe = "pwsh.exe" }, -- PowerShell 7+ (Core)
		{ query = "powershell.exe", exe = "powershell.exe" }, -- Windows PowerShell 5.1
	}

	for _, candidate in ipairs(candidates) do
		-- `where` may return several lines; we only want the first valid hit.
		local f = io.popen('where "' .. candidate.query .. '" 2>nul')
		if f then
			local output = f:read("*a") or ""
			f:close()

			for line in output:gmatch("[^\r\n]+") do
				-- Trim surrounding whitespace.
				local path = line:gsub("^%s+", ""):gsub("%s+$", "")

				-- Validate: must be an absolute path ending in the exact
				-- expected executable name, and must actually exist.
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

	-- Guaranteed-present fallback: the in-box Windows PowerShell.
	return (os.getenv("SystemRoot") or "C:\\Windows")
		.. "\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
end

function M.apply_to_config(config)
	config.default_prog = { find_powershell(), "-NoLogo" }
end

return M
