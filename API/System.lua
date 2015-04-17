--[[
	System API
	for 
	TheOS
	by Creator
]]--

function reboot()
	os.reboot()
end

function newTask(name,title,...)
	local mainPath = "OmniOS/Programs/"..name..".app/Main.lua"
	local permissionPath = "OmniOS/Programs/"..name..".app/permission.data"
	local file = fs.open(permissionPath,"r")
	local permission = file.readAll()
	file.close()
	if fs.exists(mainPath) then
		local func, err = loadfile(mainPath)
		if func then
			newRoutine(name,title,func,permission,...)
		end
	end
	return false
end

function getPerimssion(program)
	return getPerimssion(program)
end