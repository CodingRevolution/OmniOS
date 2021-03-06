--Variables--
local notLogin = true
local w,h = term.getSize()
term.redirect(term.native())
local user = nil
local pass = nil

--Code--
--Startup script--
term.setBackgroundColor(colors.white)
term.clear()
term.setCursorPos(1,1)
term.setTextColor(colors.black)

--GUI
gui.resetButtons()
gui.resetKeys()
gui.cPrint("Login",colors.black,nil,math.floor((w-5)/2),3)
--gui.cPrint("Username: >",colors.gray,nil,3,6)
gui.cPrint("Password: >",colors.gray,nil,3,8)
--gui.addField(15,6,20,1,"userField")
--paintutils.drawFilledBox(15,6,35,6,colors.lightGray)
gui.addField(15,8,20,1,"passField")
paintutils.drawFilledBox(15,8,35,8,colors.lightGray)
gui.addKey(keys.enter,"Enter")
gui.drawButton(15,10,8,3,colors.green,2,2,"Ready!",colors.black,"ready")

--Main Loop--
while notLogin do
	--Script
	local result = gui.detectButtonOrKeyHit()
	if result[1] == "userField" then
		paintutils.drawFilledBox(15,6,35,6,colors.lightGray)
		term.setCursorPos(15,6)
		term.setTextColor(colors.black)
		user = read()
	elseif result[1] == "passField" then
		paintutils.drawFilledBox(15,8,35,8,colors.lightGray)
		term.setCursorPos(15,8)
		term.setTextColor(colors.black)
		pass = read("*")
	elseif result[1] == "Enter" or result[1] == "ready" then
		if user == nil or pass == nil then
		else
			paintutils.drawFilledBox(15,15,35,15,colors.lightGray)
			local realPass
			ok = pcall( function()
			f = fs.open("TheOS/Settings/Users/Admin","r")
			realPass = f.readAll()
			f.close()
			end )
			if realPass == Sha.sha256(pass) then
				notLogin = false
			end
			if ok == false or notLogin then
				gui.cPrint("Wrong username or password!",colors.red,colors.white,13,15)
			end
		end
	end
end