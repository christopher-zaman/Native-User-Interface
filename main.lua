-- Code to hide the status bar
display.setStatusBar( display.HiddenStatusBar )
local w= display.contentWidth
local h= display.contentHeight

local bg =display.newRect(w/2,h/2,w,h)
bg:setFillColor(0,0,0)

-- Enter a number
local number1Text=display.newText("Enter a number",100,100,Arial,100)
number1Text.anchorX=0

local function number1Listener(event)
 number1=event.target.text
 print(number1)
end
-- Field box
local number1TextField=native.newTextField(100,200,400,80)
number1TextField.anchorX=0
number1TextField.inputType="number"
number1TextField:addEventListener("userInput",number1Listener)

-- Enter another number
local number2Text=display.newText("Enter another number",100,300,Arial, 100)
number2Text.anchorX=0
local function number2Listener(event)
 number2=event.target.text
 print(number2)
end
-- Field box
local number2TextField=native.newTextField(100,400,400,80)
number2TextField.anchorX=0
number2TextField.inputType="number"
number2TextField:addEventListener("userInput",number2Listener)

-- Enter  your name
local nameText=display.newText("What is your name?",100,550,Arial, 80)
nameText.anchorX=0
local function nameListener(event)
 name=event.target.text
 print(name)
end
-- Field box
local nameField=native.newTextField(100,650,400,80)
nameField.anchorX=0
nameField.placeholder="Name here"
nameField:addEventListener("userInput",nameListener)

-- Do calculations
local calcGroup = display.newGroup()
local sumText=display.newText("",w/2,800,Arial,45)
calcGroup:insert(sumText)
local diffText=display.newText("",w/2,850,Arial,45)
calcGroup:insert(diffText)
local productText=display.newText("",w/2,900,Arial,45)
calcGroup:insert(productText)
local maxText=display.newText("",w/2,950,Arial,45)
calcGroup:insert(maxText)
local nameLengthText=display.newText("",w/2,1000,Arial,45)
calcGroup:insert(nameLengthText)
local firstLetterText=display.newText("",w/2,1050,Arial,45)
calcGroup:insert(firstLetterText)
local lastLetterText=display.newText("",w/2,1100,Arial,45)
calcGroup:insert(lastLetterText)

local function calc(event)
	if(nameField.text=="") then
		name=""
	end
	if(number1TextField.text~="" and number2TextField.text~="") then
	sumText.text="The Sum of the numbers is "..(number1+number2)
	diffText.text="The Diff of the numbers is "..math.abs(number1-number2)
	productText.text="The Product of the numbers is "..
	(number1*number2)
	maxText.text="The larger number is "..math.max(number1,number2)
	local l = string.len(name)
	if l>15 then
	native.showAlert("Error Message!","Name is too long !",{"Cancel","OK"})
	end
	nameLengthText.text="Your name has "..string.len(name).." letters"
	firstLetterText.text="The first letter of your name is "..string.sub(name,1,1)
	lastLetterText.text="The last letter of your name is "..string.sub(name,-1)
	
else	
	native.showAlert("Something is wrong!","You forgot to enter a number",{"OK"})
end
end

-- Compute
local computeText=display.newText("Compute",w/2,h-50,Arial,80)
computeText:setFillColor(1,0,0)
	computeText:addEventListener("tap",calc)
	
	












 
