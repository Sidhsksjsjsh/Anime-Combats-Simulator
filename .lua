local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - " .. lib:ColorFonts("THE PAID VERSION IS OUT WITH DIFF FEATURE!","Sky Blue"))
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")
local T3 = wndw:Tab("Fight")
local T4 = wndw:Tab("Other stuff")

local player = game:GetService("Players")
local self = player.LocalPlayer
local workspace = game:GetService("Workspace")
local const = {
  click = false,
  reb = false,
  session = false,
  egg = {
    table = {},
    name = "null",
    toggle = false,
    easter = false
  },
  enemy = {
    table = {},
    name = "null",
    toggle = false
  },
  easterfarm = false
}

local function descent(path,funct)
  for i,v in pairs(path:GetDescendants()) do
    funct(v)
  end
end

local function children(path,funct)
  for i,v in pairs(path:GetChildren()) do
    funct(v)
  end
end

children(workspace.Worlds,function(a)
    if a.Name ~= "EggHunt" then
      lib:AddTable(a.Gameplay.EggStands,const.egg.table)
      lib:AddTable(a.Gameplay.Enemies,const.enemy.table)
    end
end)

T1:Toggle("Auto click",false,function(value)
    const.click = value
    while wait() do
      if const.click == false then break end
      game:GetService("ReplicatedStorage")["Postie"]["Sent"]:FireServer("Punch/Click_" .. self.UserId,"64808700-a45a-488a-b8cb-44f9125c9521")
    end
end)

T1:Toggle("Auto rebirth",false,function(value)
    const.reb = value
    while wait() do
      if const.reb == false then break end
      game:GetService("ReplicatedStorage")["Postie"]["Sent"]:FireServer("AttemptRebirth_" .. self.UserId,"8cb27ef4-80db-483b-a1f6-efa211e66903")
    end
end)

T1:Toggle("Auto claim session quest",false,function(value)
    const.session = value
    while wait() do
      if const.session == false then break end
      game:GetService("ReplicatedStorage")["Postie"]["Sent"]:FireServer("ClaimSessionQuest","6e2477da-e2ba-4b29-9414-6cb229dd3a62")
    end
end)

T2:Dropdown("Choose egg",const.egg.table,function(value)
    const.egg.name = value
end)

T2:Toggle("Auto hatch",false,function(value)
    const.egg.toggle = value
    while wait() do
      if const.egg.toggle == false then break end
      if const.egg.name ~= "null" then
        game:GetService("ReplicatedStorage")["Postie"]["Sent"]:FireServer("PurchaseHatchEgg","61da9a1f-58a2-4035-ad11-677a4d87eef4",const.egg.name,"Eggs")
      else
        lib:notify("Choose 1 eggs!",10)
        const.egg.toggle = false
      end
    end
end)

T2:Toggle("Auto claim easter egg [ Event Quest ]",false,function(value)
    const.egg.easter = value
    while wait() do
      if const.egg.easter == false then break end
      game:GetService("ReplicatedStorage")["Postie"]["Sent"]:FireServer("PurchaseHatchEgg","428a8c4d-17fb-421f-b47d-f51f1f5b5dd7","EasterEgg","Eggs",1)
    end
end)

local lbl = T3:Label("${enemy.info}")

T3:Dropdown("Choose enemy",const.enemy.table,function(value)
    const.enemy.name = value
end)

T3:Toggle("Auto fight",false,function(value)
    const.enemy.toggle = value
    while wait() do
      if const.enemy.toggle == false then break end
      children(workspace.Worlds,function(array)
          descent(array.Gameplay.Enemies,function(inject)
              if inject:IsA("ProximityPrompt") then
                fireproximityprompt(inject)
              end
          end)
      end)
    end
end)

T4:Toggle("Auto teleport to a hidden easter egg [ Event Quest ]",false,function(value)
    const.easterfarm = value
    while wait() do
      if const.easterfarm == false then break end
      children(workspace["EGG HUNT"].EggSpawns,function(v)
          self.Character.HumanoidRootPart.CFrame = v.CFrame
      end)
    end
end)

task.spawn(function()
    while wait() do
      children(workspace.Worlds,function(array)
          if const.enemy.name ~= "null" then
            lbl:EditLabel("Boss name : " .. lib:ColorFonts(array.Gameplay.Enemies[const.enemy.name].Rig.EnemyTag.EnemyName.Text,"Red") .. "\nStrength : " .. lib:ColorFonts(array.Gameplay.Enemies[const.enemy.name].Rig.EnemyTag.StrengthFrame.Strength.Text,"Red") .. "\nRank : " .. lib:ColorFonts(array.Gameplay.Enemies[const.enemy.name].Rig.EnemyTag.RankTxt.Text,"Red"))
          else
            lbl:EditLabel("Boss name : " .. lib:ColorFonts("#BOSS_NAME","Red") .. "\nStrength : " .. lib:ColorFonts("#BOSS_STRENGTH","Red") .. "\nRank : " .. lib:ColorFonts("#BOSS_RANK","Red"))
          end
      end)
    end
end)
