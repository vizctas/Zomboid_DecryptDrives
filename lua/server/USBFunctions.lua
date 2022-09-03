function OnOpen_USB(items, result, player)
	local player = getPlayer();
	local inv = player:getInventory();  
	local items = 
	{"GValley.USBOpened","GValley.USBOpened_Damaged","GValley.USBOpened","GValley.USBOpened_Damaged",};
	inv:AddItem(items[ZombRand(#items)+1]);
	HaloTextHelper.addTextWithArrow(player, "This one seems to work", true, HaloTextHelper.getColorGreen());
end	