local directory_endpoint = "https://api.github.com/repos/IsCoffeeTho/mineix/git/trees/"
local file_endpoint = "https://raw.githubusercontent.com/IsCoffeeTho/mineix/"

--#error This installer is written for CraftOS, please run `sudo minepkg update`

function table.contains(table, element)
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

local completion = require "cc.completion"
term.clear()
term.setCursorPos(1, 1)
term.setTextColor(colors.white)
write("Mineix Installer ")
term.setTextColor(colors.yellow)
print("0.0.2")
term.setTextColor(colors.blue)
print("Written by IsCoffeeTho")
print("")
term.setTextColor(colors.white)
print("Download latest? [Y/n]")
local branches = { "latest", "lts", "dev" }
local branch = branches[1]
term.setTextColor(colors.lightGray)
local dl_latest_resp = read()
term.setTextColor(colors.white)
if string.len(dl_latest_resp) > 0 and string.sub(dl_latest_resp, 1, 1) == 'n' then
	while true do
		print("Which branch is to be installed? [" .. table.concat(branches, "/") .. "]")
		term.setTextColor(colors.lightGray)
		local branch_choice = read()
		term.setTextColor(colors.white)
		local branches_refered = completion.choice(branch_choice, branches)
		if #branches_refered == 1 then
			branch = branch_choice .. branches_refered[1]
			break
		elseif table.contains(branches, branch_choice) then
			branch = branch_choice
			break
		elseif #branches_refered > 1 then
			print("Ambiguous branch option")
		else
			print("Invalid branch option")
		end
	end
end
print("Attempting to install '" .. branch .. "'")