LaptopList = 
{
    "GValley.AsusZephLaptopOpened",
	"GValley.Laptop90sOpened",
	"GValley.IBM_LP90Opened",
}; -- To be add more models.

LaptopUSBAllowed = 
{
    "GValley.AsusZephLaptopOpened",
}; -- To be add more models.

LaptopFloppyAllowed = 
{
	"GValley.Laptop90sOpened",
	"GValley.IBM_LP90Opened",
}; -- To be add more models.

local function DecryptMyUSBPlease (playerObj, Item,LaptopModel)
local time = 500
local player = getSpecificPlayer(0);
if not player then return end

if (LaptopModel ==  LaptopUSBAllowed[1]) or (LaptopModel ==  LaptopUSBAllowed[2]) or (LaptopModel ==  LaptopUSBAllowed[3])
	then 
		local cn = playerObj:getInventory():getItemCount("USBOpened")
		for i = 1, cnt+1 do
			ISTimedActionQueue.add(DecryptFloppyDisk:new(playerObj, Item, time));
		end
	else
		player:Say("Eh? This laptop is too old for a usb drive...");
		print(LaptopModel);
	end
end

local function DecryptMyFloppyPlease (playerObj, Item,LaptopModel)
	local time = 500
	local player = getSpecificPlayer(0);
	if not player then return end
	if (LaptopModel ==  LaptopFloppyAllowed[1]) or (LaptopModel ==  LaptopFloppyAllowed[2]) or (LaptopModel ==  LaptopFloppyAllowed[3])
		then 
			local cnt = playerObj:getInventory():getItemCount("FloppyDrive")
			for i = 1, cnt+1 do
				ISTimedActionQueue.add(DecryptFloppyDisk:new(playerObj, Item, time));
			end
		else
			player:Say("I must find a laptop with a floppy drive...");
			print(LaptopModel);
		end
	end
function ISWorldObjectContextMenu.getWorldObjectsOnSquares(squares, worldObjects)
	for _,square in ipairs(squares) do
		local squareObjects = square:getWorldObjects()
		for i=1,squareObjects:size() do
			local worldObject = squareObjects:get(i-1)
			local worldObjectN = squareObjects:get(i-1):getName()
			----print("Object:")
			----print (worldObjectN)
			table.insert(worldObjects, worldObject)
		end
	end
end
function LaptopOnFillWorldObjectContextMenu(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local inv = playerObj:getInventory();
	local squares = {}
	local doneSquare = {}
	for i,v in ipairs(worldobjects) do
		if v:getSquare() and not doneSquare[v:getSquare()] then
			doneSquare[v:getSquare()] = true
			table.insert(squares, v:getSquare())
		end
	end
	if #squares == 0 then return false end
	local worldObjects = {}
	if JoypadState.players[player+1] then
		for _,square in ipairs(squares) do
			for i=1,square:getWorldObjects():size() do
				local worldObject = square:getWorldObjects():get(i-1)
				table.insert(worldObjects, worldObject)
			end
		end
	else
		local squares2 = {}
		for k,v in pairs(squares) do
			squares2[k] = v
		end
		local radius = 1
		for _,square in ipairs(squares2) do
			ISWorldObjectContextMenu.getSquaresInRadius(square:getX(), square:getY(), square:getZ(), radius, doneSquare, squares)
		end
		ISWorldObjectContextMenu.getWorldObjectsOnSquares(squares, worldObjects)
	end
	if #worldObjects == 0 then return false end
	for _,worldObject in ipairs(worldObjects) do
		local LaptopName = worldObject:getItem():getFullType();
		
		if (LaptopName == LaptopList[1]) or  (LaptopName == LaptopList[2]) 
		or  (LaptopName == LaptopList[3]) or   (LaptopName == LaptopList[4]) 
		then
				local maxDistance = 1.2;
				local objX = 	worldObject:getX() + 0.5; -- center with 0.5 offset
				local objY = 	worldObject:getY() + 0.5; -- center with 0.5 offset
				local objZ = 	worldObject:getZ();
				
				local pX = playerObj:getX();
				local pY = playerObj:getY();
				local pZ = playerObj:getZ();

				local dX = objX-pX
				local dY = objY-pY
				local dZ = objZ-pZ
				local distance = dX*dX + dY*dY + dZ*dZ
				distance = math.sqrt(distance)
				--dist = dX + dX
				--local distance = (dX*dX + dY*dY + dZ*dZ)
				if distance <= maxDistance then
					local gridSquare = worldObject:getSquare();
					local lineOfSightTestResults = LosUtil.lineClear(playerObj:getCell(), objX, objY, objZ, pX, pY, pZ, false);
					
					if tostring(lineOfSightTestResults) ~= "Blocked" then

						if inv:getItemCount("USBOpened") > 0 then
								local CtxAdd = context:addOptionOnTop("Decrypt drive",playerObj,DecryptMyUSBPlease,worldObject,LaptopName);		
								----print(LaptopName);	
						end
						if inv:getItemCount("FloppyDrive") > 0 then
							local CtxAdd = context:addOptionOnTop("Check Floppy Disk",playerObj,DecryptMyFloppyPlease,worldObject,LaptopName);	
						end

					end
				end			
        end
	end
end



Events.OnFillWorldObjectContextMenu.Add(LaptopOnFillWorldObjectContextMenu);
Events.OnFillInventoryObjectContextMenu.Add(LaptopUpdateInventoryOptions);