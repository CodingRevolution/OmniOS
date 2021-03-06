--[[
	Interact API in ComputerCraft
	by Creator
	Complete rewrite in OOP
]]--

--Variables
local textutilsserialize = textutils.serialize
local textutilsunserialize = textutils.unserialize
local KeyCodes = {
	[ 2 ] =  1 ,
	[ 3 ] =  2,
	[ 4 ] =  3,
	[ 5 ] =  4,
	[ 6 ] =  5,
	[ 7 ] =  6,
	[ 8 ] =  7,
	[ 9 ] =  8,
	[ 10 ] =  9,
	[ 11 ] =  0,
	[ 12 ] = "-",
	[ 13 ] = "=",
	[ 14 ] = "Backspace",
	[ 15 ] = "Tab",
	[ 16 ] = "q",
	[ 17 ] = "w",
	[ 18 ] = "e",
	[ 19 ] = "r",
	[ 20 ] = "t",
	[ 21 ] = "y",
	[ 22 ] = "u",
	[ 23 ] = "i",
	[ 24 ] = "o",
	[ 25 ] = "p",
	[ 26 ] = "LeftBracket",
	[ 27 ] = "RightBracket",
	[ 28 ] = "Enter",
	[ 29 ] = "LeftControl",
	[ 30 ] = "a",
	[ 31 ] = "s",
	[ 32 ] = "d",
	[ 33 ] = "f",
	[ 34 ] = "g",
	[ 35 ] = "h",
	[ 36 ] = "j",
	[ 37 ] = "k",
	[ 38 ] = "l",
	[ 39 ] = ";",
	[ 40 ] = "\'",
	[ 41 ] = "`",
	[ 42 ] = "LeftShift",
	[ 43 ] = "Backslash",
	[ 44 ] = "z",
	[ 45 ] = "x",
	[ 46 ] = "c",
	[ 47 ] = "v",
	[ 48 ] = "b",
	[ 49 ] = "n",
	[ 50 ] = "m",
	[ 51 ] = ",",
	[ 52 ] = ".",
	[ 53 ] = "/",
	[ 54 ] = "RightShift",
	[ 55 ] = "*",
	[ 56 ] = "LeftAlt",
	[ 57 ] = " ",
	[ 58 ] = "CapsLock",
	[ 59 ] = "F1",
	[ 60 ] = "F2",
	[ 61 ] = "F3",
	[ 62 ] = "F4",
	[ 63 ] = "F5",
	[ 64 ] = "F6",
	[ 65 ] = "F7",
	[ 66 ] = "F8",
	[ 67 ] = "F9",
	[ 68 ] = "F10",
	[ 69 ] = "NumberLock",
	[ 70 ] = "ScrollLock",
	[ 71 ] = "NumPAd7",
	[ 72 ] = "NumPAd8",
	[ 73 ] = "NumPAd9",
	[ 74 ] = "Substract",
	[ 75 ] = "NumPAd4",
	[ 76 ] = "NumPAd5",
	[ 77 ] = "NumPAd6",
	[ 78 ] = "Add",
	[ 79 ] = "NumPAd1",
	[ 80 ] = "NumPAd2",
	[ 81 ] = "NumPAd3",
	[ 82 ] = "NumPAd0",
	[ 83 ] = "Decimal",
	[ 87 ] = "F11",
	[ 88 ] = "F12",
	[ 100] = "F13",
	[ 101] = "F14",
	[ 102] = "F15",
	[ 103] = "F16",
	[ 104] = "F17",
	[ 105] = "F18",
	[ 112] = "Kana",
	[ 113] = "F19",
	[ 121] = "Convert",
	[ 123] = "Noconvert",
	[ 125] = "Yen",
	[ 141] = "NumPadEquals",
	[ 144] = "^",
	[ 145] = "@",
	[ 146] = ":",
	[ 147] = "_",
	[ 148] = "Kanji",
	[ 149] = "Stop",
	[ 150] = "Ax",
	[ 151] = "Unlabeled",
	[ 156] = "NumPadEnter",
	[ 157] = "RightControl",
	[ 157] = "Section",
	[ 179] = "NumPadComma",
	[ 181] = "Dvide",
	[ 183] = "Sysrq",
	[ 184] = "RightAlt",
	[ 196] = "Function",
	[ 197] = "Pause",
	[ 199] = "Home",
	[ 200] = "Up",
	[ 201] = "PageUp",
	[ 203] = "Left",
	[ 205] = "Right",
	[ 207] = "End",
	[ 208] = "Down",
	[ 209] = "PageDown",
	[ 210] = "Insert",
	[ 211] = "Delete",
}

--Class declarations--
local Button = {}
local Layout = {}
local Toggle = {}
local BackgroundColor = {}
local ColorField = {}
local BetterPaint = {}
local Text = {}
local TextBox = {}
local Key = {}

function loadObjects(self)
	local output = {}
	output.Button = {}
	output.Toggle = {}
	output.ColorField = {}
	output.BetterPaint = {}
	output.Text = {}
	output.TextBox = {}
	output.Key = {}
	output.Layout = {}
	for o,v in pairs(output) do
		if self[o] == nil then
			self[o] = {}
		end
	end
	for i,v in pairs(self.Button) do
		output.Button[i] = Button.new(self.Button[i])
	end
	for i,v in pairs(self.Toggle) do
		output.Toggle[i] = Toggle.new(self.Toggle[i])
	end
	for i,v in pairs(self.ColorField) do
		output.ColorField[i] = ColorField.new(self.ColorField[i])
	end
	for i,v in pairs(self.BetterPaint) do
		output.BetterPaint[i] = BetterPaint.new(self.BetterPaint[i])
	end
	for i,v in pairs(self.Text) do
		output.Text[i] = Text.new(self.Text[i])
	end
	for i,v in pairs(self.TextBox) do
		output.TextBox[i] = TextBox.new(self.TextBox[i])
	end
	for i,v in pairs(self.Key) do
		output.Key[i] = Key.new(self.Key[i])
	end
	for i,v in pairs(self.Layout) do
		output.Layout[i] = Layout.new(self.Layout[i])
	end
	output.BackgroundColor = self.BackgroundColor or 1
	output.nilClick = self.nilClick or false
	return output
end

function loadLayout(input,output)
	for i,v in pairs(input.Button) do
		output:addButton(input.Button[i])
	end
	for i,v in pairs(input.Toggle) do
		output:addToggle(input.Toggle[i])
	end
	for i,v in pairs(input.ColorField) do
		output:addColorField(input.ColorField[i])
	end
	for i,v in pairs(input.BetterPaint) do
		output:addBetterPaint(input.BetterPaint[i])
	end
	for i,v in pairs(input.Text) do
		output:addText(input.Text[i])
	end
	for i,v in pairs(input.TextBox) do
		output:addTextBox(input.TextBox[i])
	end
	for i,v in pairs(input.Key) do
		output:addKey(input.Key[i])
	end
	for i,v in pairs(input.Layout) do
		output:addLayout(input.Layout[i])
	end
	output.BackgroundColor = input.BackgroundColor
	output.nilClick = input.nilClick
end

--Class Layout--
--Layout initialization function--
Layout.new = function(input)
	local self = {}
	setmetatable(self,{__index = Layout})
	self.Button = {}
	self.Toggle = {}
	self.ColorField = {}
	self.BetterPaint = {}
	self.Text = {}
	self.TextBox = {}
	self.Key = {}
	self.Window = {}
	self.BackgroundColor = 1
	self.xPos = input.xPos or 1
	self.yPos = input.yPos or 1
	self.xLength = input.xLength or 51
	self.yLength = input.yLength or 19
	self.nilClick = input.nilClick or false
	self.windowBuffer = Screen.new(term.current(),self.xPos,self.yPos,self.xLength,self.yLength)
	return self
end

--Add element function--
Layout.addButton = function(self,_elementData)
	self.Button[_elementData.name] = _elementData
end

Layout.addToggle = function(self,_elementData)
	self.Toggle[_elementData.name] = _elementData
end

Layout.addBackgroundColor = function(self,_elementData)
	self.BackgroundColor = _elementData.color
end

Layout.addColorField = function(self,_elementData)
	self.ColorField[_elementData.name] = _elementData
end

Layout.addBetterPaint = function(self,_elementData)
	self.BetterPaint[_elementData.name] = _elementData
end

Layout.addText = function(self,_elementData)
	self.Text[_elementData.name] = _elementData
end

Layout.addTextBox = function(self,_elementData)
	self.TextBox[_elementData.name] = _elementData
end

Layout.addKey = function(self,_elementData)
	self.Key[_elementData.name] = _elementData
end

Layout.addLayout = function(self,_elementData)
	loadLayout(self.Layout[_elementData.name],_elementData)
end

Layout.draw = function(self,xPlus,yPlus)
	xPlus = xPlus or 0
	yPlus = yPlus or 0
	local oldTerm= term.current()
	term.redirect(self.windowBuffer)
	local buttonFunctions = {}
	local toggleFunctions = {}
	local colorFieldFunctions = {}
	local betterPaintFunctions = {}
	local textFunctions = {}
	local textBoxFunctions = {}
	local layoutFunctions = {}
	setmetatable(buttonFunctions,{__index = Button})
	setmetatable(toggleFunctions,{__index = Toggle})
	setmetatable(colorFieldFunctions,{__index = ColorField})
	setmetatable(betterPaintFunctions,{__index = BetterPaint})
	setmetatable(textFunctions,{__index = Text})
	setmetatable(textBoxFunctions,{__index = TextBox})
	setmetatable(layoutFunctions,{__index = Layout})
	paintutils.drawFilledBox(1,1,self.xLength,self.yLength,self.BackgroundColor)
	for i,v in pairs(self.ColorField) do
		colorFieldFunctions.draw(v,self.xPos-1+xPlus,self.yPos-1+yPlus)
	end
	for i,v in pairs(self.Button) do
		buttonFunctions.draw(v,self.xPos-1+xPlus,self.yPos-1+yPlus)
	end
	for i,v in pairs(self.BetterPaint) do
		betterPaintFunctions.draw(v,self.xPos-1+xPlus,self.yPos-1+yPlus)
	end
	for i,v in pairs(self.Toggle) do
		toggleFunctions.draw(v,self.xPos-1+xPlus,self.yPos-1+yPlus)
	end
	for i,v in pairs(self.Text) do
		textFunctions.draw(v,self.xPos-1+xPlus,self.yPos-1+yPlus)
	end
	for i,v in pairs(self.TextBox) do
		textBoxFunctions.draw(v,self.xPos-1+xPlus,self.yPos-1+yPlus)
	end
	term.redirect(oldTerm)
end

--Class Button--
--Button initialization function
Button.new = function(input)
	local self = {}
	setmetatable(self,{__index = Button})
	self.name = input.name
	self.label = input.label
	self.xPos = input.xPos
	self.yPos = input.yPos
	self.fgColor = input.fgColor
	self.bgColor = input.bgColor
	self.xLength = input.xLength
	self.yLength = input.yLength
	self.returnValue = input.returnValue
	self.xTextPos = input.xTextPos
	self.yTextPos = input.yTextPos
	self.onRightClick = input.onRightClick or nil
	self.onLeftClick = input.onLeftClick or nil
	return self
end

--Draw function
Button.draw = function(self,addX,addY)
	addX = addX or 0
	addY = addY or 0
	local finalX = self.xPos + addX
	local finalY = self.yPos + addY

	self.finalX = finalX
	self.finalY = finalY
	local newText
	if #self.label > self.xLength then
		newText = string.sub(self.label,1,self.xLength)
	else
		newText = self.label
	end
	paintutils.drawFilledBox(finalX,finalY,finalX+self.xLength-1,finalY+self.yLength-1,self.bgColor)
	term.setTextColor(self.fgColor)
	term.setCursorPos(finalX+self.xTextPos-1,finalY+self.yTextPos-1)
	term.write(newText)
end

--Return function--
Button.returnData = function(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

--Sample Input table--
example = [[
	example = {
		name = "quickSettings",
		label = ">",
		xPos = 1,
		yPos = 3,
		xLength = 1,
		yLength = 6,
		xTextPos = 1,
		yTextPos = 1,
		fgColor = colors.blue,
		bgColor = colors.lightGray,
		returnValue = "quickSettings",
	},
]]

--Class Toggle--
--Initialize Toggle Object--
Toggle.new = function(input)
	local self = {}
	setmetatable(self,{__index = Toggle})
	self.name = input.name or "randomName"
	self.state = input.state or true
	self.xPos = input.xPos or 1
	self.yPos = input.yPos or 1
	self.trueColor = input.trueColor or colors.green
	self.falseColor = input.falseColor or colors.red
	self.trueText = input.trueText or "T"
	self.falseText = input.falseText or "F"
	self.selectedBg = input.selectedBg or colors.gray
	self.notSelectedBg = input.notSelectedBg or colors.lightGray
	self.returnValue = input.returnValue or "mmmmmmm"
	self.moveX = input.moveX or false
	self.moveY = input.moveY or false
	self.onRightClick = input.onRightClick or nil
	self.onLeftClick = input.onLeftClick or nil
	return self
end

function Toggle.draw(self,addX,addY)
	addX = addX or 0
	addY = addY or 0
	local finalX = self.xPos + addX
	local finalY = self.yPos + addY
	self.finalX = finalX
	self.finalY = finalY
	term.setCursorPos(finalX,finalY)
	if self.state == false then
		term.setBackgroundColor(self.notSelectedBg)
		term.setTextColor(self.trueColor)
		term.write(string.sub(self.trueText,1,1))
		term.setBackgroundColor(self.selectedBg)
		term.setTextColor(self.falseColor)
		term.write(" "..string.sub(self.falseText,1,1).." ")
	elseif self.state == true then
		term.setBackgroundColor(self.selectedBg)
		term.setTextColor(self.trueColor)
		term.write(" "..string.sub(self.trueText,1,1).." ")
		term.setBackgroundColor(self.notSelectedBg)
		term.setTextColor(self.falseColor)
		term.write(string.sub(self.falseText,1,1))
	end
end

function Toggle.returnData(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

function Toggle.toggle(self)
	if self.state == true then
		self.state = false
	else
		self.state = true
	end
end

function Toggle.getState(self)
	return self.state
end

--BackgroundColor Class--
function BackgroundColor.new(input)
	local self = {}
	setmetatable(self,{__index = BackgroundColor})
	self.color = input.color
	return self
end

function BackgroundColor.setColor(self,color)
	self.color = color
end

function BackgroundColor.returnData(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

--ColorField Class--
function ColorField.new(input)
	local self = {}
	setmetatable(self,{__index = ColorField})
	self.name = input.name
	self.xPos = input.xPos
	self.yPos = input.yPos
	self.xLength = input.xLength
	self.yLength = input.yLength
	self.color = input.color
	self.moveX = input.moveX or false
	self.moveY = input.moveY or false
	return self
end

function  ColorField.draw(self,addX,addY)
	addX = addX or 0
	addY = addY or 0
	local finalX = self.xPos + addX
	local finalY = self.yPos + addY
	self.finalX = finalX
	self.finalY = finalY
	term.setTextColor(colors.black)
	paintutils.drawFilledBox(finalX,finalY,finalX+self.xLength-1,finalY+self.yLength-1,self.color)
end

function ColorField.returnData(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

--BetterPaint Class--
function BetterPaint.new(input)
	local self = {}
	setmetatable(self,{__index = BetterPaint})
	self.xPos = input.xPos
	self.yPos = input.yPos
	self.name = input.name
	self.path = input.path
	self.xLength = input.xLength
	self.yLength = input.yLength
	self.returnValue = input.returnValue
	self.label = input.label
	self.labelBg = input.labelBg
	self.labelFg = input.labelFg
	self.moveX = input.moveX or false
	self.moveY = input.moveY or false
	self.onRightClick = input.onRightClick or nil
	self.onLeftClick = input.onLeftClick or nil
	return self
end

function BetterPaint.returnData(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

function BetterPaint.draw(self,addX,addY)
	addX = addX or 0
	addY = addY or 0
	local finalX = self.xPos + addX
	local finalY = self.yPos + addY
	self.finalX = finalX
	self.finalY = finalY
	paint.drawImage(self.path,finalX,finalY)
	term.setCursorPos(finalX,finalY+self.yLength)
	term.setTextColor(self.labelFg)
	term.setBackgroundColor(self.labelBg)
	term.write(self.label)
end

--Text Class--
function Text.new(input)
	local self = {}
	setmetatable(self,{__index = Text})
	self.name = input.name
	self.text = input.text
	self.xPos = input.xPos
	self.yPos = input.yPos
	self.bgColor = input.bgColor
	self.fgColor = input.fgColor
	return self
end

function Text.draw(self,addX,addY)
	addX = addX or 0
	addY = addY or 0
	local finalX = self.xPos + addX
	local finalY = self.yPos + addY
	self.finalX = finalX
	self.finalY = finalY
	term.setCursorPos(finalX,finalY)
	term.setTextColor(self.fgColor)
	term.setBackgroundColor(self.bgColor)
	term.write(self.text)
end

function Text.returnData(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

--TextBox Class 

function TextBox.new(input)
	local self = {}
	setmetatable(self,{__index = TextBox})
	self.name = input.name
	self.helpText = input.helpText
	self.xPos = input.xPos
	self.yPos = input.yPos
	self.xLength = input.xLength
	self.yLength = input.yLength
	self.bgColor = input.bgColor
	self.fgColor = input.fgColor
	self.helpFgColor = input.helpFgColor
	self.charLimit = input.charLimit
	self.moveX = input.moveX or false
	self.moveY = input.moveY or false
	self.text = ""
	self.returnValue = input.returnValue
	self.confidential = input.confidential or false
	return self
end

function TextBox.returnData(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

function TextBox.draw(self,addX,addY)
	addX = addX or 0
	addY = addY or 0
	local finalX = self.xPos + addX
	local finalY = self.yPos + addY
	self.finalX = finalX
	self.finalY = finalY
	paintutils.drawFilledBox(finalX,finalY,finalX+self.xLength-1,finalY+self.yLength-1,self.bgColor)
	term.setBackgroundColor(self.bgColor)
	term.setCursorPos(self.finalX,self.finalY)
	if self.text == "" or self.confidential then
		term.setTextColor(self.helpFgColor)
		term.write(self.helpText)
	else
		term.setTextColor(self.fgColor)
		term.write(self.text)
	end
end

function TextBox.read(self,_sReplaceChar, _tHistory)
	paintutils.drawFilledBox(self.finalX,self.finalY,self.finalX+self.xLength-1,self.finalY+self.yLength-1,self.bgColor)
	term.setTextColor(self.fgColor)
	term.setCursorPos(self.finalX,self.finalY)
	return read()
end

--Key Class
function Key.new(input)
	local self = {}
	setmetatable(self,{__index = TextBox})
	self.name = input.name
	self.key = input.key
	self.onPress = input.onPress or nil
	return self
end

function Key.returnData(self)
	local toReturn = {}
	for i,v in pairs(self) do
		toReturn[i] = v
	end
	return toReturn
end

local function localEventHandler(self,event, p1, p2, p3, p4, p5, p6)
	local toAddX = self.xPos - 1
	local toAddY = self.yPos - 1
	while true do
		if event == "mouse_click" then
			for i,v in pairs(self.Button) do
				if v.finalX + toAddX <= p2 and p2 <= v.finalX + v.xLength-1 + toAddX and v.finalY + toAddY <= p3 and p3 <= v.finalY + v.yLength-1 + toAddY then
					if p1 == 1 then
						if v.onLeftClick then 
							v.onLeftClick()
						end
					elseif p1 == 2 then
						if v.onRightClick then
							v.onRightClick()
						end
					end
					return {"Button",tostring(v.returnValue),p1,p2,p3}
				end
			end
			for i,v in pairs(self.Toggle) do
				if v.finalX + toAddX <= p2 and p2 <= v.finalX + 3 + toAddX and v.finalY + toAddY == p3 then
					return {"Toggle",tostring(v.returnValue),p1,p2,p3}
				end
			end
			for i,v in pairs(self.BetterPaint) do 
				if v.finalX + toAddX <= p2 and p2 <= v.finalX + v.xLength-1 + toAddX and v.finalY + toAddY <= p3 and p3 <= v.finalY + v.yLength-1 + toAddY then
					return {"Button",tostring(v.returnValue),p1,p2,p3}
				end
			end
			for i,v in pairs(self.TextBox) do 
				if v.finalX + toAddX <= p2 and p2 <= v.finalX + v.xLength-1 + toAddX and v.finalY + toAddY <= p3 and p3 <= v.finalY + v.yLength-1 + toAddY then
					return {"TextBox",tostring(v.returnValue),p1,p2,p3}
				end
			end
			if self.nilClick then
				if not (self.xPos <= p2 and p2 <= self.xPos+self.xLength-1 and self.yPos <= p3 and p3 <= self.yPos+self.yLength-1) then
					return {"Nil","Nil",p1,p2,p3}
				end
			end
		elseif event == "key" then
			local pressedKey = p1
			for i,v in pairs(self.Key) do
				if v.key == KeyCodes[pressedKey] then
					if v.onPress then
						v.onPress()
					else
						return {"Key",KeyCodes[pressedKey],pressedKey}
					end
				end

			end
		elseif event == "monitor_touch" then
			os.queueEvent("mouse_click", p1, p2, p3, p4, p5, p6)
		end
	end
end

--Event handler function--
eventHandler = function(self)
	local tEvent = {os.pullEvent()}
	return localEventHandler(self,unpack(tEvent))
end

--Load Function--
function Initialize()
	local toReturn = {}
	toReturn.Button = Button
	toReturn.Layout = Layout
	toReturn.Toggle = Toggle
	toReturn.BackgroundColor = BackgroundColor
	toReturn.ColorField = ColorField
	toReturn.BetterPaint = BetterPaint
	toReturn.Text = Text
	toReturn.TextBox = TextBox
	toReturn.Key = Key
	toReturn.eventHandler = eventHandler
	toReturn.loadObjects = loadObjects
	toReturn.loadLayout = loadLayout
	return toReturn
end