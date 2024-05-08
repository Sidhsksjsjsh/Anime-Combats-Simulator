local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4 - " .. lib:ColorFonts("CREATED BY FAHRI & TURTLE TEAM","Sky Blue"))
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Hatch")
local T3 = wndw:Tab("Fight")
local T4 = wndw:Tab("Other stuff")
local T5 = wndw:Tab("Credits")
local T6 = wndw:Tab("Status")

local player = game:GetService("Players")
local self = player.LocalPlayer
local workspace = game:GetService("Workspace")
local const = { -- Workspace.Worlds.World1.Gameplay.Enemies.Enemy5.Rig.EnemyTag.RankTxt
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
    table = {"Enemy1","Enemy2","Enemy3","Enemy4","Enemy5","Enemy6","EnemyTest_Weapon","EnemyTest_Punch","EnemyTest_Beam"},
    name = "null",
    toggle = false
  },
  easterfarm = false,
  trade = false,
  codes = {
    "DUAL",
    "Booroboroboro",
    "500k",
    "TY<3",
    "BETA",
    "LIKES10K",
    "DELAYYY", --EXPIRED
    "LIKES5K",
    "storalus",
    "LIKES2500",
    "LIKES1000",
    "RBXNews",
    "Noah",
    "Spax",
    "RELEASE"
  },
  easterfarm2 = false,
  reward = false,
  xraymeta = false
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

local function AsyncPlayers(funct)
  for i,v in pairs(player:GetPlayers()) do
    funct(v)
  end
end

local function detectEggs(v)
  if const.xraymeta == true then
    local esp = Instance.new("Highlight")
    esp.Name = "XRAY"
    esp.FillColor = Color3.new(0,1,0)
    esp.OutlineColor = Color3.new(1,1,1)
    esp.FillTransparency = 0
    esp.OutlineTransparency = 1
    esp.Adornee = v
    esp.Parent = v
    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
  end
end

children(workspace.Worlds,function(a)
    if a.Name:sub(1,5) == "World" then --a.Name ~= "AdidasStore" then
      lib:AddTable(a.Gameplay.EggStands,const.egg.table)
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
      descent(workspace.Worlds[self:GetAttribute("RegionIn")].Gameplay.Enemies[const.enemy.name],function(inject)
          if inject:IsA("ProximityPrompt") then
            if self.PlayerGui.Combat.Enabled == false then
              wait(0.5)
              fireproximityprompt(inject)
            end
          end
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

T4:Toggle("Auto bring all hidden easter egg [ Event Quest ]",false,function(value)
    const.easterfarm2 = value
    while wait() do
      if const.easterfarm2 == false then break end
      children(workspace["EGG HUNT"].EggSpawns,function(v)
          v.CFrame = self.Character.HumanoidRootPart.CFrame
      end)
    end
end)

T4:Toggle("Chams all hidden easter egg [ Event Quest ]",false,function(value)
    const.xraymeta = value
    children(workspace["EGG HUNT"].EggSpawns,function(v)
        detectEggs(v)
        if value == false and v:FindFirstChild("XRAY") then
          v["XRAY"]:Destroy()
        end
    end)
end)

T4:Toggle("Auto spam trade",false,function(value)
    const.trade = value
    while wait() do
      if const.trade == false then break end
      AsyncPlayers(function(v)
          game:GetService("ReplicatedStorage")["Remotes"]["Trading"]["Request"]:FireServer("Request",v.Name)
      end)
    end
end)

T4:Button("Redeem all codes",function()
      for array = 1,#const.codes do
        game:GetService("ReplicatedStorage")["Remotes"]["Codes"]["Reedem"]:FireServer(const.codes[array])
      end
end)

T4:Button("Claim all unlocked season rewards",function()
      for array = 1,30 do
        game:GetService("ReplicatedStorage")["Postie"]["Sent"]:FireServer("Season_ClaimReward","d591d368-7d3c-4c16-9322-bfd95a219187",array,"Basic")
      end
end)

T4:Toggle("Auto claim all online rewards",false,function(value)
    const.reward = value
    while wait() do
      if const.reward == false then break end
        game:GetService("ReplicatedStorage")["Postie"]["Sent"]:FireServer("ClaimPlaytimeGift","b2d967ba-f34e-4ea9-96cf-676b0ecaabcd",1500)
    end
end)

T5:Label(lib:ColorFonts("Fahri - VS Scripting, Scripting & CEO","Sky Blue"))
T5:Label(lib:ColorFonts("Asya & Aril - UI Scripting ( modified UI )","Sky Blue"))
T5:Label(lib:ColorFonts("Akbar - Bug hunter","Sky Blue"))
T5:Label(lib:ColorFonts("The remaining members not listed here \nbecause they are part of programming vanguard","Red"))

T6:Label("API : " .. lib:ColorFonts("ONLINE","Green"))
T6:Label("Service : " .. lib:ColorFonts("ONLINE","Green"))
T6:Label("Webhook : " .. lib:ColorFonts("OFFLINE","Red"))
T6:Label("AC Detection : " .. lib:ColorFonts("ONLINE","Green"))
T6:Label("Remote Detection : " .. lib:ColorFonts("ONLINE","Green"))
T6:Label("Total : " .. lib:ColorFonts("4 ONLINE","Green") .. " • " .. lib:ColorFonts("1 OFFLINE","Red") .. "\nPercentage : " .. lib:ColorFonts("null","Red"))
--self:GetAttribute("RegionIn")
--Workspace.Worlds.EggHunt.Gameplay.Enemies.EnemyTest_Weapon.Rig.EnemyTagX.EnemyName
task.spawn(function()
    while wait() do
      if const.enemy.name ~= "null" then
        if self:GetAttribute("RegionIn") ~= "EggHunt" then
          lbl:EditLabel("Enemy name : " .. lib:ColorFonts(workspace.Worlds[self:GetAttribute("RegionIn")].Gameplay.Enemies[const.enemy.name].Rig.EnemyTag.EnemyName.Text,"Red") .. "\nStrength : " .. lib:ColorFonts(workspace.Worlds[self:GetAttribute("RegionIn")].Gameplay.Enemies[const.enemy.name].Rig.EnemyTag.StrengthFrame.Strength.Text,"Red") .. "\nRank : " .. lib:ColorFonts(workspace.Worlds[self:GetAttribute("RegionIn")].Gameplay.Enemies[const.enemy.name].Rig.EnemyTag.RankTxt.Text,"Red"))
        else
          lbl:EditLabel("Boss name : " .. lib:ColorFonts("#BOSS_NAME","Red") .. "\nStrength : " .. lib:ColorFonts("#BOSS_STRENGTH","Red") .. "\nRank : " .. lib:ColorFonts("#BOSS_RANK","Red"))
        end
      else
          lbl:EditLabel("Boss name : " .. lib:ColorFonts("#BOSS_NAME","Red") .. "\nStrength : " .. lib:ColorFonts("#BOSS_STRENGTH","Red") .. "\nRank : " .. lib:ColorFonts("#BOSS_RANK","Red"))
      end
    end
end)

--Players.Rivanda_Cheater.CombatMode
