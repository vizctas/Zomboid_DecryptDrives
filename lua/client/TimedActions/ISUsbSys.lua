require ("TimedActions/ISBaseTimedAction");

DecryptDrive = ISBaseTimedAction:derive("DecryptDrive");

function DecryptDrive:isValid()  
    return true
    end  
        
    function DecryptDrive:update()
        self.item:getItem():setJobDelta(self:getJobDelta());
    end
    function DecryptDrive:start()
        self:setActionAnim("Loot");
        self:setAnimVariable("LootPosition", "Medium");
        self.character:getEmitter():playSound("USBSys");
        self:setOverrideHandModels(nil, nil);
       -- self.item:getItem():setJobType(getText("ContextMenu_Grab"));
    end
    function DecryptDrive:stop()
        ISBaseTimedAction.stop(self);
        self.item:getItem():setJobDelta(0.0);
        self.character:getEmitter():stopSoundByName("USBSys");
    end
    function DecryptDrive:perform()
        forceDropHeavyItems(self.character)
        local inventoryItem = self.character:getInventory()
        local ISUsbAvaible = inventoryItem:getItemCount("USBOpened") -- doublecheck
        local diceroll  = 0
        local randomLvl = 0
        local loopcter  = 0
        local randomPerk = 0

        if ISUsbAvaible < 1  
        then  
            self.character:Say("Need a drive first") 
            return
        end
        diceroll        = ZombRand(18)+1;
        if diceroll >= 8
        then 
            randomLvl = ZombRand(20,260)+1;	
            randomPerk = ZombRand(1,11)+1;
            if randomPerk == 0 then randomPerk = randomPerk+1 end

                if randomPerk == 1 
                then 
                    self.character:getXp():AddXP(Perks.Woodwork, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Some woodcraft tutorials. Should keep trying decrypt...maybe there's still information")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                        --self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end

                if randomPerk == 2 
                then 
                    self.character:getXp():AddXP(Perks.Electricity, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Some Electrecity skills.. So that's how the goverment hid the files. Should keep trying decrypt...")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end

                if randomPerk == 3 
                then 
                    self.character:getXp():AddXP(Perks.Farming, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Amazing corn's farm for situations like this...There's still more info.")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end
                if randomPerk == 4 
                then 
                    self.character:getXp():AddXP(Perks.Aiming, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Military file for perfect aiming...excellent! Should keep decrypting this drive")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end
                if randomPerk == 5 
                then 
                    self.character:getXp():AddXP(Perks.Cooking, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! So the goverment hid the food into bunkers ...! Should keep decrypting this drive ")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end
                if randomPerk == 6 
                then 
                    self.character:getXp():AddXP(Perks.Sneak, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Goverment silent assasins...I knew it. Hmm there might more information.")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end


                if randomPerk == 7 
                then 
                    self.character:getXp():AddXP(Perks.Axe, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! That's a perfect axe swing.")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end



                if randomPerk == 8 
                then 
                    self.character:getXp():AddXP(Perks.Fitness, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Empty your mind. Be formless, shapeless, like water. You put water into a cup, it becomes the cup..")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end


                if randomPerk == 9 
                then 
                    self.character:getXp():AddXP(Perks.Doctor, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Medicines heal doubts as well as diseases...")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end

                if randomPerk == 10
                then 
                    self.character:getXp():AddXP(Perks.Survivalist, randomLvl)
                    diceroll        = ZombRand(13)+1;
                    if diceroll >= 10
                    then
                        self.character:Say("Got it! Survival can be summed up in three words, never give up. That’s the heart of it really. Just keep trying")
                    else -- deployed. This will be change to a number of uses. I dont know how to store variables per each character.
                       -- self.character:Say("Well there is nothing else to decrypt here.")
                        inventoryItem:Remove("USBOpened")
                        inventoryItem:AddItem("GValley.USBOpened_Used",1)
                    end
                end
            else
            self.character:Say("Drive corrupted??")
            inventoryItem:Remove("USBOpened")
            inventoryItem:AddItem("GValley.USBOpened_Damaged")
        end
        ISBaseTimedAction.perform(self);
    end
    function DecryptDrive:new (character, item, time)
        local o = {}
        setmetatable(o, self)
        self.__index = self
        o.character = character;
        o.item = item;
        o.stopOnWalk = true;
        o.stopOnRun = true;
        -- print("time?")		   
        o.maxTime = time;
        o.loopedAction = true;
        return o
    end



