require ("TimedActions/ISBaseTimedAction");

DecryptFloppyDisk = ISBaseTimedAction:derive("DecryptFloppyDisk");

function DecryptFloppyDisk:isValid()  
    return true
    end  
        
    function DecryptFloppyDisk:update()
        self.item:getItem():setJobDelta(self:getJobDelta());
    end
    function DecryptFloppyDisk:start()
        self:setActionAnim("Loot");
        self:setAnimVariable("LootPosition", "Medium");
        self.character:getEmitter():playSound("USBSys");
        self:setOverrideHandModels(nil, nil);

       -- self.item:getItem():setJobType(getText("ContextMenu_Grab"));
    end

    function DecryptFloppyDisk:stop()
        ISBaseTimedAction.stop(self);
        self.item:getItem():setJobDelta(0.0);
        self.character:getEmitter():stopSoundByName("USBSys");
    end
    function DecryptFloppyDisk:perform()
        forceDropHeavyItems(self.character)
        local inventoryItem = self.character:getInventory()
        local ISUsbAvaible = inventoryItem:getItemCount("FloppyDrive") -- doublecheck
        local diceroll          = 0
        local randomLvl         = 0
        local loopcter          = 0
        local randomPerk        = 0
        local probabilityToKppUsing     = 5;
        local probabilityToGain         = 7;
        local maxExpGain = 200
        local minExpGain = 50

        if ISUsbAvaible < 1  
        then  
            self.character:Say("Need a floppy first") 
            return
        end
        diceroll        = ZombRand(15)+1;
        if diceroll >= probabilityToGain
        then 
            randomLvl = ZombRand(minExpGain,maxExpGain)+1;	-- gain exp
            randomPerk = ZombRand(1,6)+1; -- selection

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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
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
                    inventoryItem:Remove("FloppyDrive")
                    inventoryItem:AddItem("GValley.FloppyDrive_Used",1)
                end
            end
            else
            self.character:Say("Disk corrupted??")
            inventoryItem:Remove("FloppyDrive")
            inventoryItem:AddItem("GValley.FloppyDrive_Damaged")
        end
        ISBaseTimedAction.perform(self);
    end

    function DecryptFloppyDisk:new (character, item, time)
        local o = {}
        setmetatable(o, self)
        self.__index = self
        o.character = character;
        o.item = item;
        o.stopOnWalk = true;
        o.stopOnRun = true;
        -- print("time?")		   
        o.maxTime = time;
        o.loopedAction = false;
        return o
    end



