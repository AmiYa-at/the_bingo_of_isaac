StartDebug()
Bingo = RegisterMod("Bingo", 1)
Bingo.version = "5.9"
Bingo.userId = ""
Bingo.roomId = ""
Bingo.playerIndex = 0 --- 默认为0（即单人游玩模式）
Bingo.gameMode = 0    --- 0为单人模式，1为多人模式
Bingo.player = Isaac.GetPlayer(0)
Bingo.game = Game()
Bingo.level = Bingo.game:GetLevel()
Bingo.lives = 2
Bingo.newStart = true
Bingo.LIMITED_TIME = 45
Bingo.timerNew = 0
Bingo.timerStart = 0
Bingo.gameTime = 0
Bingo.gameTimeForShow = { minute = "00", second = "00" }
Bingo.readMapTimeForShow = { minute = "00", second = "00" }
Bingo.readMapTime = 0 --专门为多人对战模式设计的读图时间
Bingo.readMapTimeIsStarted = false
Bingo.timerForReadMapNew = 0
Bingo.timerForReadMapStart = 0
Bingo.READMAPTIMELIMIT = 180000 --多人对战模式的读图时间限制，默认为180000毫秒


Bingo.gameIsPaused = false
Bingo.continuedTime = 0;
Bingo.puaseTime = 0  --just for system time
Bingo.gameIsOver = 0 --0 means not over,1 means you win,2 means other situations
Bingo.finalBosses = {
    { type = EntityType.ENTITY_ISAAC,        variant = 0 },
    { type = EntityType.ENTITY_ISAAC,        variant = 1 },
    { type = EntityType.ENTITY_THE_LAMB,     variant = 0 },
    { type = EntityType.ENTITY_MOTHER,       variant = 10 },
    { type = EntityType.ENTITY_SATAN,        variant = 10 },
    { type = EntityType.ENTITY_MEGA_SATAN_2, variant = 0 },
    { type = EntityType.ENTITY_BEAST,        variant = 0 },
    { type = EntityType.ENTITY_DELIRIUM,     variant = 0 }
}
Bingo.finalBossPtr = { type = nil, variant = nil, ref = nil }
Bingo.restartKey = Isaac.GetItemIdByName("Restart Key")
---ui variable---
Bingo.selectArrow = Sprite()
Bingo.startMenu = Font()
Bingo.renderPosition = Isaac.WorldToRenderPosition(Vector(320, 150)) --need to alter
Bingo.nameAndVersion = "以撒宾果mod ver" .. Bingo.version .. "by Amiya9212"
Bingo.startMenuRootString = { "单人模式", "对战模式", "DR模式" }
Bingo.startMenuStringOfSingle = { "随便开把", "种子生图", "趣味模式", "限时模式" }
Bingo.startMenuStringOfBattle = "输入房间号: "
Bingo.startMenuRootSelect = 0
Bingo.startMenuSelectOfSingle = 0
Bingo.enableSpecialMode = false
Bingo.enableTimeLimit = true
Bingo.enableCooperatedMode = false
Bingo.startSignal = 0
Bingo.meunIsChanged = false
Bingo.gameIsStarted = false
Bingo.FONT_OFFSET = 9
---tasks variable---
Bingo.tasks = require("tasks")
Bingo.renderPositionOfTasks = Isaac.WorldToRenderPosition(Vector(100, 420)) --needs to test--
Bingo.finishIcon = Sprite()
Bingo.taskSelection = Sprite()
Bingo.tasksBackground = Sprite()
Bingo.taskMargin = Sprite()
Bingo.taskSelectionPosition = { X = 0, Y = 0 }
Bingo.taskSelectionEnable = false
Bingo.achieveSound = SFXManager()
Bingo.TASKS_COUNT = 100
Bingo.randomTasksQueue = {}
Bingo.finishTasksNum = 0
Bingo.longestLineLength = 0
Bingo.map = {}
Bingo.mapForCallBacks = {
    [ModCallbacks.MC_POST_UPDATE] = {},
    [ModCallbacks.MC_POST_RENDER] = {},
    [ModCallbacks.MC_POST_NEW_LEVEL] = {},
    [ModCallbacks.MC_ENTITY_TAKE_DMG] = {},
    [ModCallbacks.MC_USE_CARD] = {},
    [ModCallbacks.MC_PRE_PICKUP_COLLISION] = {},
    [ModCallbacks.MC_USE_PILL] = {},
    [ModCallbacks.MC_POST_ENTITY_KILL] = {},
    [ModCallbacks.MC_USE_ITEM] = {}
}
Bingo.seedForShow = ""
---virtual keyboard and input variables--
Bingo.keyboard = require("keyboard")
---font path---
local MOD_FOLDER_NAME = "bingo_3555711630"
local CUSTOM_FONT_FILE_PATH = "font/eid9/eid9_9px.fnt"
-- 测试用
Bingo.enableDebugTask = false
Bingo.test = nil

-- 组队对战模式用
local color = {
    RED = 1,
    BLUE = 2
}
local CooperatedModeColor = { color.RED, color.RED, color.BLUE, color.BLUE }


---funtions---

function Bingo.setUserId()
    local hex = ""
    for i = 1, 8, 1 do
        local num = math.random(0, 15)
        hex = hex .. string.format("%X", num)
    end
    return hex
end

local function split(str, sep)
    local result = {}
    -- 模式 "[^" .. sep .. "]+" 表示匹配一个或多个非 sep 的字符
    for part in string.gmatch(str, "[^" .. sep .. "]+") do
        table.insert(result, part)
    end
    return result
end


--- webSocket相关 ---

local dkjson = require("dkjson")

local roomIdParts = {};
local partsSeed = {};
Bingo.ws = nil
local wsConnectStatus = false

local function CallbackOnOpen()
    print("Open")
    if not Bingo.gameIsStarted then
        Bingo.gameMode = 1
        wsConnectStatus = true
        Bingo.roomId = roomIdParts[1]
        Bingo.playerIndex = tonumber(roomIdParts[2])
        local mapMessage = {
            type = "map_data",
            roomId = roomIdParts[1],
            seatIndex = tonumber(roomIdParts[2]),
            content = "初始化地图",
            data = {}
        }
        if Bingo.map ~= {} then
            for i = 1, 5, 1 do
                mapMessage.data[i] = {}
                for j = 1, 5, 1 do
                    mapMessage.data[i][j] = Bingo.map[i][j].task.taskIndex
                end
            end
        end
        local jsonStr, err = dkjson.encode(mapMessage, { indent = true })
        if err then
            print("json转换错误", err)
        else
            --print("json字符串",jsonStr)
            Bingo.ws.Send(jsonStr, false)
        end
    end
end

local function CallbackOnMessage(message, isBinary)
    if isBinary then
        print("Binary Message,length: " .. #message)
    else
        print("Text Message: ", message)
        local gameStartTable, pos, err = dkjson.decode(message, 1, nil)
        if err then
            print(err, pos)
        else
            if gameStartTable.type == "start_game" then
                Bingo.gameIsPaused=true
                Bingo.readMapTimeIsStarted = true
                Bingo.timerForReadMapStart = Isaac.GetTime()
                print("maptime: ", Bingo.readMapTime)
            elseif gameStartTable.type == "task_confirmed" then
                Bingo.map[gameStartTable.data.row + 1][gameStartTable.data.col + 1].task.isAchieved = true
                Bingo.map[gameStartTable.data.row + 1][gameStartTable.data.col + 1].task.achieveBy = gameStartTable.data
                    .achieveBy
                Bingo.map[gameStartTable.data.row + 1][gameStartTable.data.col + 1].task.signal1 = 1
                if gameStartTable.data.achieveBy == Bingo.playerIndex then
                    Bingo.tasks.achieveSound:Play(579, 20)
                    Bingo.tasks.achieveSound:Play(128, 1)
                    local taskX = gameStartTable.data.col
                    local taskY = gameStartTable.data.row
                    print(taskX, " ", taskY)
                    Bingo:getMapConfig(taskX, taskY)
                    Bingo.finishTasksNum = Bingo.finishTasksNum + 1
                else
                    Bingo.tasks.achieveSound:Play(579, 20)
                end
            end
        end
    end
end

local function CallbackOnClose(closeStatus, statusDescription)
    print("Close: ", closeStatus, statusDescription)
    wsConnectStatus = false
end

local function CallbackOnError(message)
    print("Error: ", message)
end

function Bingo:reconnect()
    if IsaacSocket and Bingo.gameMode == 1 and Bingo.gameIsStarted and ((not Bingo.ws) or Bingo.ws.IsClosed()) then
        Bingo.ws = IsaacSocket.WebSocketClient.New(
            "wss://pbkyopvordqk.sealoshzh.site:443/ws?type=&userId=" ..
            Bingo.userId ..
            "&roomId=" .. roomIdParts[1] .. "&seed=" .. partsSeed[1] ..
            partsSeed[2] .. "&seatIndex=" .. roomIdParts[2], CallbackOnOpen, CallbackOnMessage, CallbackOnClose,
            CallbackOnError)
    end
end

function Bingo:gameStartMenu()
    if Bingo.gameIsStarted == false and Bingo.readMapTimeIsStarted == false then
        Bingo.player.ControlsEnabled = false --stop the player--
        Bingo.game.TimeCounter = 0           --stop time--
        Bingo.startMenu:DrawStringUTF8(Bingo.nameAndVersion, Bingo.renderPosition.X - Bingo.FONT_OFFSET * 8,
            Bingo.renderPosition.Y - Bingo.FONT_OFFSET * 2 + 5, KColor(1, 1, 1, 1))
        for index, value in ipairs(Bingo.startMenuRootString) do
            --print start menu
            Bingo.startMenu:DrawStringUTF8(value, Bingo.renderPosition.X - Bingo.FONT_OFFSET * 2,
                Bingo.renderPosition.Y + Bingo.FONT_OFFSET * index * 3, KColor(1, 1, 1, 1), 0, false)
        end
        if Bingo.meunIsChanged == false then
            --choose the mode via ↑ and ↓--
            Bingo.startMenu:DrawStringUTF8("按↑、↓键切换选择，按使用主动键确认", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 9,
                Bingo.renderPosition.Y - Bingo.FONT_OFFSET * 3, KColor(1, 1, 1, 1))
            if Input.IsActionTriggered(ButtonAction.ACTION_SHOOTDOWN, Bingo.player.ControllerIndex) then
                if Bingo.startMenuRootSelect < 3 then
                    Bingo.startMenuRootSelect = Bingo.startMenuRootSelect + 1
                else
                    Bingo.startMenuRootSelect = 1
                end
            elseif Input.IsActionTriggered(ButtonAction.ACTION_SHOOTUP, Bingo.player.ControllerIndex) then
                if Bingo.startMenuRootSelect > 1 then
                    Bingo.startMenuRootSelect = Bingo.startMenuRootSelect - 1
                else
                    Bingo.startMenuRootSelect = 3
                end
            end
        end
        --render the new selectArrow again--
        Bingo.selectArrow:Render(Vector(Bingo.renderPosition.X + Bingo.FONT_OFFSET * 3,
            Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 3 * Bingo.startMenuRootSelect + 4))
        --choose detailed mode--
        if Input.IsActionTriggered(ButtonAction.ACTION_ITEM, Bingo.player.ControllerIndex) and Bingo.meunIsChanged == false then
            Bingo.meunIsChanged = true
            return
        end
        --single mode's choose--
        if Bingo.meunIsChanged then
            Bingo.startMenu:DrawStringUTF8("按↑、↓键切换选择，按拍主动的键确认", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 22,
                Bingo.renderPosition.Y, KColor(1, 1, 1, 1))
            Bingo.startMenu:DrawStringUTF8("按→键返回上一级菜单", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 18,
                Bingo.renderPosition.Y + Bingo.FONT_OFFSET + 3, KColor(1, 1, 1, 1))
            --print single mode's menu--
            if Bingo.startMenuRootSelect == 1 then
                for index, value in ipairs(Bingo.startMenuStringOfSingle) do
                    Bingo.startMenu:DrawStringUTF8(value, Bingo.renderPosition.X - Bingo.FONT_OFFSET * 15,
                        Bingo.renderPosition.Y + Bingo.FONT_OFFSET * index * 3, KColor(1, 1, 1, 1), 0, false)
                end
                if Bingo.enableSpecialMode then
                    Bingo.startMenu:DrawStringUTF8("√", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 15 - 12,
                        Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 3 * 3, KColor(1, 1, 1, 1), 0, false)
                end
                if Bingo.enableTimeLimit then
                    Bingo.startMenu:DrawStringUTF8("√", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 15 - 12,
                        Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 4 * 3, KColor(1, 1, 1, 1), 0, false)
                end
                if Input.IsActionTriggered(ButtonAction.ACTION_SHOOTDOWN, Bingo.player.ControllerIndex) then
                    if Bingo.startMenuSelectOfSingle <= 3 then
                        Bingo.startMenuSelectOfSingle = Bingo.startMenuSelectOfSingle + 1
                    else
                        Bingo.startMenuSelectOfSingle = 1
                    end
                elseif Input.IsActionTriggered(ButtonAction.ACTION_SHOOTUP, Bingo.player.ControllerIndex) then
                    if Bingo.startMenuSelectOfSingle >= 1 then
                        Bingo.startMenuSelectOfSingle = Bingo.startMenuSelectOfSingle - 1
                    else
                        Bingo.startMenuSelectOfSingle = 4
                    end
                end
                --render the new selectArrow again--
                if Bingo.startMenuSelectOfSingle ~= 0 then
                    Bingo.selectArrow:Render(Vector(Bingo.renderPosition.X - Bingo.FONT_OFFSET * 10,
                        Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 3 * Bingo.startMenuSelectOfSingle + 4))
                end
                --choose "随便开把" mode--
                if Input.IsActionTriggered(ButtonAction.ACTION_ITEM, Bingo.player.ControllerIndex) and Bingo.startMenuSelectOfSingle == 1 then
                    math.randomseed(Random())
                    Bingo:createBingoMap()

                    -- 测试用
                    if Bingo.enableDebugTask then
                        local i = 91
                        Bingo.test = Bingo.tasks["task" .. i]()
                        Bingo.test.task.taskIcon:Load("gfx/tasks/task" .. i .. ".anm2", true)
                        Bingo.tasks.setTaskForCallback(Bingo.test)
                    end
                    ---------------

                    Bingo.gameMode = 0
                    Bingo.gameIsPaused = true
                    Bingo.player.ControlsEnabled = false
                    Bingo.startSignal = 1
                    Bingo.game.TimeCounter = 0
                    Bingo.gameIsStarted = true
                    Bingo.timerStart = Isaac.GetTime()
                    --#needs to refine--
                    --choose "种子生图" mode--
                elseif Input.IsActionTriggered(ButtonAction.ACTION_ITEM, Bingo.player.ControllerIndex) and Bingo.startMenuSelectOfSingle == 2 then
                    math.randomseed(Bingo.game:GetSeeds():GetStartSeed())
                    Bingo:createBingoMap()
                    Bingo.gameMode = 0
                    Bingo.gameIsPaused = true
                    Bingo.player.ControlsEnabled = false
                    Bingo.startSignal = 1
                    Bingo.game.TimeCounter = 0
                    Bingo.gameIsStarted = true
                    Bingo.timerStart = Isaac.GetTime()
                    -- 趣味奖励模式
                elseif Input.IsActionTriggered(ButtonAction.ACTION_ITEM, Bingo.player.ControllerIndex) and Bingo.startMenuSelectOfSingle == 3 then
                    if Bingo.enableSpecialMode == false then
                        Bingo.enableSpecialMode = true
                    elseif Bingo.enableSpecialMode == true then
                        Bingo.enableSpecialMode = false
                    end
                    -- 限时模式
                elseif Input.IsActionTriggered(ButtonAction.ACTION_ITEM, Bingo.player.ControllerIndex) and Bingo.startMenuSelectOfSingle == 4 then
                    if Bingo.enableTimeLimit == false then
                        Bingo.enableTimeLimit = true
                    elseif Bingo.enableTimeLimit == true then
                        Bingo.enableTimeLimit = false
                    end
                end
                --print battle mode's menu--
            elseif Bingo.startMenuRootSelect == 2 then
                Bingo.startMenu:DrawStringUTF8(Bingo.startMenuStringOfBattle, Bingo.renderPosition.X -
                    Bingo.FONT_OFFSET * 15, Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 3, KColor(1, 1, 1, 1), 0, false)
                Bingo.startMenu:DrawStringUTF8(Bingo.keyboard.getRoomIdText(), Bingo.renderPosition.X -
                    Bingo.FONT_OFFSET * 9, Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 3, KColor(1, 1, 1, 1))
                if Input.IsActionTriggered(ButtonAction.ACTION_MAP, Bingo.player.ControllerIndex) then
                    if Bingo.enableCooperatedMode then
                        Bingo.enableCooperatedMode = false
                        Bingo.LIMITED_TIME=45
                    else
                        Bingo.enableCooperatedMode = true
                        Bingo.LIMITED_TIME=35
                    end
                end
                if Bingo.enableCooperatedMode then
                    Bingo.startMenu:DrawStringUTF8("按地图键选择是否是组队模式", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 20,
                        Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 6, KColor(0, 255, 0, 1))
                else
                    Bingo.startMenu:DrawStringUTF8("按地图键选择是否是组队模式", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 20,
                        Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 6, KColor(1, 1, 1, 1))
                end
                if wsConnectStatus then
                    Bingo.startMenu:DrawStringUTF8("连接成功，按主动键断开连接", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 15,
                        Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 4 + 5, KColor(1, 1, 1, 0.7))
                    if Input.IsActionTriggered(ButtonAction.ACTION_ITEM, Bingo.player.ControllerIndex) and IsaacSocket then
                        wsConnectStatus = false;
                        Bingo.ws.Close(1000, "已关闭连接")
                    end
                end
                Bingo.keyboard.inputRoomId()
                if Input.IsActionTriggered(ButtonAction.ACTION_ITEM, Bingo.player.ControllerIndex) and IsaacSocket then
                    Bingo.ws = nil
                    math.randomseed(Bingo.game:GetSeeds():GetStartSeed())
                    Bingo:createBingoMap()
                    Bingo.gameMode = 1
                    roomIdParts = split(Bingo.keyboard.getRoomIdText(), "&")
                    partsSeed = split(Bingo.seedForShow, " ")
                    Bingo.ws = IsaacSocket.WebSocketClient.New(
                        "wss://pbkyopvordqk.sealoshzh.site:443/ws?type=&userId=" ..
                        Bingo.userId ..
                        "&roomId=" .. roomIdParts[1] .. "&seed=" .. partsSeed[1] ..
                        partsSeed[2] .. "&seatIndex=" .. roomIdParts[2], CallbackOnOpen, CallbackOnMessage,
                        CallbackOnClose,
                        CallbackOnError)
                end
                --daily-run mode--
            else
                --daily-run mode--
                --#needs to refine--
            end
            --return to chooses of mode via →--
            if Input.IsActionTriggered(ButtonAction.ACTION_SHOOTRIGHT, Bingo.player.ControllerIndex) then
                Bingo.meunIsChanged = false
            end
        end
    end
    -- 多人模式的读图时间结束后开始游戏
    if (not Bingo.gameIsStarted) and Bingo.readMapTime >= Bingo.READMAPTIMELIMIT then
        Bingo.gameIsPaused = false
        Bingo.player.ControlsEnabled = true
        Bingo.startSignal = 1
        Bingo.game.TimeCounter = 0
        Bingo.gameIsStarted = true
        Bingo.timerStart = Isaac.GetTime()
    end
end

--initialize when a new game is started
--#need to finish
function Bingo:gameInitialize(isContinued)
    Bingo.player = Isaac.GetPlayer(0)
    Bingo.game = Game()
    Bingo.finalBossPtr.type = nil
    Bingo.finalBossPtr.variant = nil
    Bingo.finalBossPtr.ref = nil
    if Bingo.newStart == true then
        roomIdParts = {}
        partsSeed = {}
        Bingo.ws = nil
        Bingo.newStart = false
        Bingo.playerIndex = 0
        Bingo.gameMode = 0
        Bingo.LIMITED_TIME=45
        Bingo.lives = 2
        Bingo.timerNew = 0
        Bingo.timerStart = 0
        Bingo.gameTime = 0
        Bingo.gameTimeForShow.minute = "00"
        Bingo.gameTimeForShow.second = "00"
        Bingo.gameIsPaused = false
        Bingo.puaseTime = 0
        Bingo.continuedTime = 0
        Bingo.readMapTime = 0
        Bingo.readMapTimeIsStarted = false
        Bingo.timerForReadMapNew = 0
        Bingo.timerForReadMapStart = 0
        Bingo.gameIsOver = 0
        Bingo.game:GetSeeds():ClearSeedEffects()
        Isaac.ExecuteCommand("seed " .. (Game():GetSeeds():GetStartSeedString()))
        -----startMenu-----
        Bingo.startMenu:Load("mods/" .. MOD_FOLDER_NAME .. "/resources/" .. CUSTOM_FONT_FILE_PATH)
        Bingo.selectArrow:Load("gfx/ui/select_arrow.anm2", true)
        Bingo.gameIsStarted = false
        Bingo.startMenuRootSelect = 1
        Bingo.startMenuSelectOfSingle = 1
        Bingo.enableSpecialMode = false
        Bingo.enableTimeLimit = true
        Bingo.startSignal = 0
        Bingo.meunIsChanged = false
        Bingo.selectArrow:SetFrame("Select", 0)
        Bingo.selectArrow:Render(Vector(Bingo.renderPosition.X + Bingo.FONT_OFFSET * 3,
            Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 3 + 4))
        -----tasks-----
        Bingo.finishIcon:Load("gfx/ui/finish_icon.anm2", true)
        Bingo.taskSelection:Load("gfx/ui/task_select.anm2", true)
        Bingo.tasksBackground:Load("gfx/ui/tasks_background.anm2", true)
        Bingo.taskMargin:Load("gfx/ui/tab_task_margin.anm2", true)
        Bingo.taskSelectionPosition.X = 0
        Bingo.taskSelectionPosition.Y = 0
        Bingo.taskSelectionEnable = false
        Bingo.randomTasksQueue = {}
        itemPoolOfPickedUpActive = {}
        Bingo.finishTasksNum = 0
        Bingo.longestLineLength = 0

        Bingo.seedForShow = Bingo.game:GetSeeds():GetStartSeedString()
    end
end

--退出该局就会重置整局
function Bingo:resetWhenExit(ShouldSave)
    if ShouldSave then
        Bingo.newStart = true
        Bingo.gameIsStarted = false
        if IsaacSocket and Bingo.ws ~= nil then
            Bingo.ws.Close(1000, "成功关闭连接")
        end
        if next(Bingo.map, nil) ~= nil then
            for i = 1, 5, 1 do
                for j = 1, 5, 1 do
                    Bingo.map[i][j] = nil;
                end
            end
        end
        for key, value in pairs(Bingo.mapForCallBacks) do
            Bingo.mapForCallBacks[key] = {}
        end
        Bingo.map = {}
        -- 测试任务用
        test = nil
    end
end

---------- 时间相关 ----------


-- 设置用于展示的游戏时间gameTime和读图时间readMapTime
function Bingo:setGameTimeForShow()
    local time = Bingo.gameTime // 1000
    local readMapTime = (Bingo.READMAPTIMELIMIT - Bingo.readMapTime) // 1000
    if time // 60 >= 0 and time // 60 <= 9 then
        Bingo.gameTimeForShow.minute = "0" .. time // 60
    else
        Bingo.gameTimeForShow.minute = time // 60
    end
    if time % 60 >= 0 and time % 60 <= 9 then
        Bingo.gameTimeForShow.second = "0" .. time % 60
    else
        Bingo.gameTimeForShow.second = time % 60
    end
    -- 读图时间
    if readMapTime // 60 >= 0 and readMapTime // 60 <= 9 then
        Bingo.readMapTimeForShow.minute = "0" .. readMapTime // 60
    else
        Bingo.readMapTimeForShow.minute = readMapTime // 60
    end
    if readMapTime % 60 >= 0 and readMapTime % 60 <= 9 then
        Bingo.readMapTimeForShow.second = "0" .. readMapTime % 60
    else
        Bingo.readMapTimeForShow.second = readMapTime % 60
    end
end

--rewrite the logic of pressing key-R to restart the game
function Bingo:keyrRestart()
    if Input.IsActionTriggered(ButtonAction.ACTION_RESTART, Bingo.player.ControllerIndex) and Input.IsActionPressed(ButtonAction.ACTION_MAP, Bingo.player.ControllerIndex) then
        Bingo.newStart = true
        Isaac.ExecuteCommand("restart")
    end
end

-- 计算模组提供的gameTime和readMapTime(不是游戏本体的计时器TimeCounter)
function Bingo:countTime()
    if (not Bingo.gameIsPaused) and Bingo.gameIsStarted == true and Bingo.gameIsOver == 0 then
        Bingo.timerNew = Isaac.GetTime()
        Bingo.gameTime = Bingo.gameTime + Bingo.timerNew - Bingo.timerStart
        Bingo.timerStart = Isaac.GetTime()
    elseif Bingo.gameIsPaused and Bingo.gameIsStarted and Bingo.gameIsOver == 0 then
        Bingo.timerStart = Isaac.GetTime()
        Bingo.timerNew = Isaac.GetTime()
    end
    -- 专门为多人对战模式设计的读图时间
    if Bingo.readMapTimeIsStarted and Bingo.gameMode == 1 and (not Bingo.gameIsStarted) and Bingo.gameIsOver == 0 and Bingo.readMapTime < Bingo.READMAPTIMELIMIT then
        Bingo.timerForReadMapNew = Isaac.GetTime()
        Bingo.readMapTime = Bingo.readMapTime + Bingo.timerForReadMapNew - Bingo.timerForReadMapStart
        Bingo.timerForReadMapStart = Isaac.GetTime()
    end
end

--pause the game
function Bingo:pauseGame()
    if ((Input.IsActionTriggered(ButtonAction.ACTION_DROP, Bingo.player.ControllerIndex) and Input.IsActionPressed(ButtonAction.ACTION_MAP, Bingo.player.ControllerIndex)) or
            Input.IsButtonTriggered(Keyboard.KEY_F4, 114514) or
            (Input.IsActionTriggered(ButtonAction.ACTION_MAP, Bingo.player.ControllerIndex) and Input.IsActionPressed(ButtonAction.ACTION_DROP, Bingo.player.ControllerIndex))) and Bingo.gameIsPaused == false and Bingo.gameMode == 0 then
        Bingo.puaseTime = Bingo.game.TimeCounter
        Bingo.gameIsPaused = true
        Bingo.player.ControlsEnabled = false
        return
    elseif ((Input.IsActionTriggered(ButtonAction.ACTION_DROP, Bingo.player.ControllerIndex) and Input.IsActionPressed(ButtonAction.ACTION_MAP, Bingo.player.ControllerIndex)) or
            Input.IsButtonTriggered(Keyboard.KEY_F4, 114514) or
            (Input.IsActionTriggered(ButtonAction.ACTION_MAP, Bingo.player.ControllerIndex) and Input.IsActionPressed(ButtonAction.ACTION_DROP, Bingo.player.ControllerIndex))) and Bingo.gameIsPaused == true and Bingo.gameMode == 0 then
        Bingo.gameIsPaused = false
        Bingo.player.ControlsEnabled = true
        return
    end
end

-- 暂停游戏时将游戏时间TimeCounter和模组当前时间puaseTime保持一致，即暂停游戏时间TimeCounter
function Bingo:setPauseTime()
    if Bingo.gameIsPaused then
        Bingo.game.TimeCounter = Bingo.puaseTime
    end
end

--游戏内置的暂停生效时保证游戏内置时间继续（保证凹凸和bossrush的时间和gameTime一致）
function Bingo:setTimeCounterContinued()
    if Bingo.game:IsPaused()
    then
        Bingo.game.TimeCounter = math.floor((Bingo.gameTime - Bingo.continuedTime) * 0.03)
    end
end

---------- 任务函数加入回调相关 ----------


Bingo.mapForCallBacksFunc = {
    [ModCallbacks.MC_POST_UPDATE] = function()
        if Bingo.gameIsStarted then
            for key, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_POST_UPDATE]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1])
                end
            end
        end
    end,
    [ModCallbacks.MC_POST_RENDER] = function()
        if Bingo.gameIsStarted then
            for key, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_POST_RENDER]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1])
                end
            end
        end
    end,
    [ModCallbacks.MC_POST_NEW_LEVEL] = function()
        if Bingo.gameIsStarted then
            for _, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_POST_NEW_LEVEL]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1])
                end
            end
        end
    end,
    [ModCallbacks.MC_ENTITY_TAKE_DMG] = function(_, entity, amount, damageFlags, source, countdownFrames)
        if Bingo.gameIsStarted then
            for _, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_ENTITY_TAKE_DMG]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1], entity, amount, damageFlags, source, countdownFrames)
                end
            end
        end
    end,
    [ModCallbacks.MC_USE_CARD] = function()
        if Bingo.gameIsStarted then
            for _, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_USE_CARD]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1])
                end
            end
        end
    end,
    [ModCallbacks.MC_PRE_PICKUP_COLLISION] = function(_, pickup, collider, low)
        if Bingo.gameIsStarted then
            for _, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_PRE_PICKUP_COLLISION]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1], pickup, collider, low)
                end
            end
        end
    end,
    [ModCallbacks.MC_USE_PILL] = function()
        if Bingo.gameIsStarted then
            for _, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_USE_PILL]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1])
                end
            end
        end
    end,
    [ModCallbacks.MC_POST_ENTITY_KILL] = function(_, entity)
        if Bingo.gameIsStarted then
            for _, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_POST_ENTITY_KILL]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1], entity)
                end
            end
        end
    end,
    [ModCallbacks.MC_USE_ITEM] = function()
        if Bingo.gameIsStarted then
            for _, value in pairs(Bingo.mapForCallBacks[ModCallbacks.MC_USE_ITEM]) do
                for index, valueFunc in ipairs(value[2]) do
                    valueFunc(value[1])
                end
            end
        end
    end
}














--show information during the game
function Bingo:showGameInfo()
    Bingo.startMenu:DrawStringUTF8("总用时: " .. Bingo.gameTimeForShow.minute .. ":" .. Bingo.gameTimeForShow.second, 10,
        200, KColor(1, 1, 1, 1))
    Bingo.startMenu:DrawStringUTF8("已完成任务数: " .. Bingo.finishTasksNum, 10, 212, KColor(1, 1, 1, 1))
    Bingo.startMenu:DrawStringUTF8("最长连线: " .. Bingo.longestLineLength, 10, 224, KColor(1, 1, 1, 1))
    Bingo.startMenu:DrawStringUTF8("种子: " .. Bingo.seedForShow, 10, 236, KColor(1, 1, 1, 1))
    Bingo.startMenu:DrawStringUTF8("总时间: "..Bingo.LIMITED_TIME,10,272,KColor(1,1,1,1))
    if Bingo.gameIsPaused then
        Bingo.startMenu:DrawStringUTF8("游戏已暂停，长按地图键+丢弃卡牌键继续", 10, 248, KColor(1, 0, 0, 0.8))
    end
    if Bingo.readMapTimeIsStarted and (not Bingo.gameIsStarted) then
        Bingo.startMenu:DrawStringUTF8("读图时间: "..Bingo.readMapTimeForShow.minute..":"..Bingo.readMapTimeForShow.second,80,212,KColor(1,0,0,1))
    end
    if Bingo.ws == nil or Bingo.ws.IsClosed() then
        Bingo.startMenu:DrawStringUTF8("连接失败", 10, 260, KColor(255, 0, 0, 1))
    elseif Bingo.ws ~= nil and Bingo.ws.IsOpen() then
        Bingo.startMenu:DrawStringUTF8("连接成功", 10, 260, KColor(0, 255, 0, 1))
    end
end

--one of the game-over situations:when 3 lives are spent
function Bingo:playerDeath(IsGameOver)
    if Bingo.lives > 0 and IsGameOver then
        Bingo.lives = Bingo.lives - 1
        Bingo.continuedTime = Bingo.gameTime;
        -- 在多人组队模式下死亡有罚时剩余时间的30%
        if Bingo.enableCooperatedMode then
            Bingo.LIMITED_TIME=Bingo.LIMITED_TIME-math.floor((Bingo.LIMITED_TIME-Bingo.gameTime/60000)*0.30)
        end
    end
    if Bingo.lives <= 0 and IsGameOver then
        Bingo.gameIsOver = 2
    end
end

--another situation of game-over:time is over
function Bingo:timeIsOver()
    if Bingo.gameTime >= Bingo.LIMITED_TIME * 60 * 1000 and Bingo.enableTimeLimit then
        Bingo.gameIsOver = 2
    end
end

--get won
function Bingo:winAct()
    if Bingo.longestLineLength == 5 then
        Bingo.gameIsOver = 1
    end
end

--show game-over information
function Bingo:showGameOverInfo()
    if Bingo.gameIsOver ~= 0 then
        if Bingo.gameIsOver == 1 then
            Bingo.startMenu:DrawStringScaledUTF8(
                "Bingo! 用时" .. Bingo.gameTimeForShow.minute .. ":" .. Bingo.gameTimeForShow.second,
                Bingo.renderPosition.X - Bingo.FONT_OFFSET * 2 * 3, Bingo.renderPosition.Y, 2, 2, KColor(1, 1, 1, 1))
        else
            Bingo.startMenu:DrawStringScaledUTF8("游戏结束!", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 2 * 2 + 7,
                Bingo.renderPosition.Y, 2, 2, KColor(1, 1, 1, 1))
        end
        Bingo.startMenu:DrawStringUTF8("最大连线长度: " .. Bingo.longestLineLength,
            Bingo.renderPosition.X - Bingo.FONT_OFFSET * 3 + 5, Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 3 + 2,
            KColor(1, 1, 1, 1))
        Bingo.startMenu:DrawStringUTF8("完成任务数: " .. Bingo.finishTasksNum,
            Bingo.renderPosition.X - Bingo.FONT_OFFSET * 3 +
            5, Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 4 + 6, KColor(1, 1, 1, 1))
        Bingo.startMenu:DrawStringUTF8("按R键重玩这局", Bingo.renderPosition.X - Bingo.FONT_OFFSET * 4 - 2,
            Bingo.renderPosition.Y + Bingo.FONT_OFFSET * 7, KColor(1, 1, 1, 1))
        if Input.IsActionTriggered(ButtonAction.ACTION_RESTART, Bingo.player.ControllerIndex) and not Bingo.game:IsPaused() then
            Isaac.ExecuteCommand("restart")
            Bingo.newStart = true
        end
    end
end

--检索节点之间是否矛盾
local function isTasksConflicted(taskRandomIndex, taskExistIndex)
    if taskExistIndex.conflictTasks == nil then
        return false
    end
    for _, value in ipairs(taskExistIndex.conflictTasks) do
        if taskRandomIndex == value then
            return true
        end
    end
    return false
end
--检索节点和角色之间是否矛盾
local function isTaskConflictWithCharacter(taskRandomIndex, playerType)
    local playerNum = tonumber(Bingo.player:GetPlayerType())
    if playerType["c" .. playerNum] == nil then
        return false
    else
        for _, value in ipairs(playerType["c" .. playerNum]) do
            if taskRandomIndex == value then
                return true
            end
        end
    end
    return false
end
--检查该节点是否与bingo图中已有节点重复或有矛盾
--待完善
local function isTaskNoProblem(row, col, taskIndex, mode)
    -- 检查该任务是否与角色冲突
    if isTaskConflictWithCharacter(taskIndex, Bingo.tasks[1]) then
        return false
    end
    -- 检查是否与地图上已有节点重复
    -- 检查完整生成的行
    for i = 1, row - 1, 1 do
        for j = 1, 5, 1 do
            if taskIndex == Bingo.map[i][j].task.taskIndex then
                return false
            end
        end
    end
    -- 检查残缺的行
    for i = 1, col - 1, 1 do
        if taskIndex == Bingo.map[row][i].task.taskIndex then
            return false
        end
    end
    -- 检查该节点是否与其他节点矛盾
    if mode == 1 then
        -- 检查这一行是否有矛盾的元素
        for i = 1, col - 1, 1 do
            if isTasksConflicted(taskIndex, Bingo.map[row][i]) then
                return false
            end
        end
        -- 检索这一列有没有矛盾的元素
        for i = 1, row - 1, 1 do
            if isTasksConflicted(taskIndex, Bingo.map[i][col]) then
                return false
            end
        end
    end
    return true
end
-- 生成bingo图
function Bingo:createBingoMap()
    local taskIndex = 0
    for row = 1, 5, 1 do
        Bingo.map[row] = {}
        for col = 1, 5, 1 do
            local searchTime = 0
            local mode = 1
            --for debug
            local debugtime = 0
            taskIndex = math.random(1, Bingo.TASKS_COUNT)
            print("map num: ",taskIndex)
            while (not isTaskNoProblem(row, col, taskIndex, mode)) do
                taskIndex = math.random(1, Bingo.TASKS_COUNT)
                searchTime = searchTime + 1
                debugtime = debugtime + 1
                if searchTime >= Bingo.TASKS_COUNT then
                    mode = 0
                end
                if debugtime >= 1000000000 then
                    print("break")
                    break
                end
            end
            Bingo.map[row][col] = Bingo.tasks["task" .. taskIndex]()
            if Bingo.map[row][col] == nil then
                print("nil")
            end
            Bingo.map[row][col].task.taskIcon:Load("gfx/tasks/task" .. taskIndex .. ".anm2", true)
            Bingo.map[row][col].task.renderXOffset = col - 1
            Bingo.map[row][col].task.renderYOffset = row - 1
            Bingo.tasks.setTaskForCallback(Bingo.map[row][col])
        end
    end
    --如果当前生成节点所在的位置在主对角线上，检索有无矛盾元素
end

--get bingo map config
function Bingo:getMapConfig(taskX, taskY)
    local length = 0
    local maxLength = 0
    --row
    for i = 1, 5, 1 do
        if Bingo.map[i][taskX + 1].task.isAchieved and (Bingo.map[i][taskX + 1].task.achieveBy == Bingo.playerIndex or
                (Bingo.enableCooperatedMode and CooperatedModeColor[Bingo.map[i][taskX + 1].task.achieveBy] == CooperatedModeColor[Bingo.playerIndex])) then
            length = length + 1
        else
            length = 0
        end
        if length > maxLength then
            maxLength = length
        end
    end
    Bingo.longestLineLength = (maxLength > Bingo.longestLineLength) and maxLength or Bingo.longestLineLength
    maxLength = 0
    length = 0
    --col
    for i = 1, 5, 1 do
        if Bingo.map[taskY + 1][i].task.isAchieved and (Bingo.map[taskY + 1][i].task.achieveBy == Bingo.playerIndex or
                (Bingo.enableCooperatedMode and CooperatedModeColor[Bingo.map[taskY + 1][i].task.achieveBy] == CooperatedModeColor[Bingo.playerIndex])) then
            length = length + 1
        else
            length = 0
        end
        if length > maxLength then
            maxLength = length
        end
    end
    Bingo.longestLineLength = (maxLength > Bingo.longestLineLength) and maxLength or Bingo.longestLineLength
    maxLength = 0
    length = 0
    --diag
    if taskX == taskY then
        for i = 1, 5, 1 do
            if Bingo.map[i][i].task.isAchieved and (Bingo.map[i][i].task.achieveBy == Bingo.playerIndex or
                    (Bingo.enableCooperatedMode and CooperatedModeColor[Bingo.map[i][i].task.achieveBy] == CooperatedModeColor[Bingo.playerIndex])) then
                length = length + 1
            else
                length = 0
            end
            if length > maxLength then
                maxLength = length
            end
        end
    end
    Bingo.longestLineLength = (maxLength > Bingo.longestLineLength) and maxLength or Bingo.longestLineLength
    maxLength = 0
    length = 0
    if taskX + taskY == 4 then
        for i = 1, 5, 1 do
            if Bingo.map[6 - i][i].task.isAchieved and (Bingo.map[6 - i][i].task.achieveBy == Bingo.playerIndex or
                    (Bingo.enableCooperatedMode and CooperatedModeColor[Bingo.map[6 - i][i].task.achieveBy] == CooperatedModeColor[Bingo.playerIndex])) then
                length = length + 1
            else
                length = 0
            end
            if length > maxLength then
                maxLength = length
            end
        end
    end
    Bingo.longestLineLength = (maxLength > Bingo.longestLineLength) and maxLength or Bingo.longestLineLength
    maxLength = 0
    length = 0
end

---------- 渲染相关 ----------


function Bingo:setPosition()
    Bingo.renderPosition = Isaac.WorldToRenderPosition(Vector(320, 150))
    if Bingo.taskSelectionEnable then
        Bingo.renderPositionOfTasks = Isaac.WorldToRenderPosition(Vector(100, 200))
    else
        Bingo.renderPositionOfTasks = Isaac.WorldToRenderPosition(Vector(100, 420))
    end
end

function Bingo:tasksIconRender()
    if Bingo.gameIsStarted == true or Bingo.readMapTimeIsStarted then
        if not Bingo.taskSelectionEnable then
            Bingo.tasksBackground:SetFrame("background", 0)
            Bingo.tasksBackground:Render(Vector(Bingo.renderPositionOfTasks.X - 3, Bingo.renderPositionOfTasks.Y - 3))
        end
        if not Bingo.taskSelectionEnable then
            for indexRow, valueRow in ipairs(Bingo.map) do
                for indexCol, valueCol in ipairs(valueRow) do
                    if valueCol.task == nil then
                        print("nil")
                        break
                    end
                    valueCol.task.taskIcon:SetFrame("task", 0)
                    valueCol.task.taskIcon:Render(Vector(Bingo.renderPositionOfTasks.X + 10 * valueCol.task
                        .renderXOffset + 1, Bingo.renderPositionOfTasks.Y + 10 * valueCol.task.renderYOffset + 1))
                    if valueCol.task.isAchieved and valueCol.task.achieveBy ~= -1 then
                        local achieveBy = valueCol.task.achieveBy
                        if Bingo.enableCooperatedMode then
                            if achieveBy == 2 then
                                achieveBy = 1
                            elseif achieveBy == 4 then
                                achieveBy = 3
                            end
                        end
                        Bingo.finishIcon:SetFrame("Finish" .. achieveBy, 0)
                        Bingo.finishIcon:Render(Vector(Bingo.renderPositionOfTasks.X + 10 * valueCol.task.renderXOffset,
                            Bingo.renderPositionOfTasks.Y + 10 * valueCol.task.renderYOffset))
                    end
                end
            end
        else
            for indexRow, valueRow in ipairs(Bingo.map) do
                for indexCol, valueCol in ipairs(valueRow) do
                    valueCol.task.taskIcon:SetFrame("task", 0)
                    valueCol.task.taskIcon:Render(Vector(Bingo.renderPositionOfTasks.X + 26 * valueCol.task
                        .renderXOffset + 1, Bingo.renderPositionOfTasks.Y + 26 * valueCol.task.renderYOffset + 1))
                    Bingo.taskMargin:SetFrame("margin", 0);
                    Bingo.taskMargin:Render(Vector(
                        Bingo.renderPositionOfTasks.X + 26 * valueCol.task.renderXOffset + 1 -
                        7, Bingo.renderPositionOfTasks.Y + 26 * valueCol.task.renderYOffset + 1 - 7))
                    if valueCol.task.isAchieved and valueCol.task.achieveBy ~= -1 then
                        local achieveBy = valueCol.task.achieveBy
                        if Bingo.enableCooperatedMode then
                            if achieveBy == 2 then
                                achieveBy = 1
                            elseif achieveBy == 4 then
                                achieveBy = 3
                            end
                        end
                        Bingo.finishIcon:SetFrame("Finish" .. achieveBy, 0)
                        Bingo.finishIcon:Render(Vector(Bingo.renderPositionOfTasks.X + 26 * valueCol.task.renderXOffset,
                            Bingo.renderPositionOfTasks.Y + 26 * valueCol.task.renderYOffset))
                    end
                end
            end
        end
        if Bingo.taskSelectionEnable then
            Bingo.taskSelection:SetFrame("taskselect", 0)
            Bingo.taskSelection:Render(Vector(Bingo.renderPositionOfTasks.X + Bingo.taskSelectionPosition.X * 26 + 1,
                Bingo.renderPositionOfTasks.Y + Bingo.taskSelectionPosition.Y * 26 + 1))
        else
            if not Bingo.taskSelectionEnable then
                Bingo.taskSelection:SetFrame("taskselect1", 0)
                Bingo.taskSelection:Render(Vector(Bingo.renderPositionOfTasks.X + Bingo.taskSelectionPosition.X * 10 + 1,
                    Bingo.renderPositionOfTasks.Y + Bingo.taskSelectionPosition.Y * 10 + 1))
            end
        end

        if Input.IsActionPressed(ButtonAction.ACTION_MAP, Bingo.player.ControllerIndex) then
            Bingo.taskSelectionEnable = true
        else
            Bingo.taskSelectionEnable = false
        end
        if Bingo.taskSelectionEnable then
            if Bingo.taskSelectionPosition.X <= 3 and Input.IsActionTriggered(ButtonAction.ACTION_SHOOTRIGHT, Bingo.player.ControllerIndex) then
                Bingo.taskSelectionPosition.X = Bingo.taskSelectionPosition.X + 1
            end
            if Bingo.taskSelectionPosition.X >= 1 and Input.IsActionTriggered(ButtonAction.ACTION_SHOOTLEFT, Bingo.player.ControllerIndex) then
                Bingo.taskSelectionPosition.X = Bingo.taskSelectionPosition.X - 1
            end
            if Bingo.taskSelectionPosition.Y <= 3 and Input.IsActionTriggered(ButtonAction.ACTION_SHOOTDOWN, Bingo.player.ControllerIndex) then
                Bingo.taskSelectionPosition.Y = Bingo.taskSelectionPosition.Y + 1
            end
            if Bingo.taskSelectionPosition.Y >= 1 and Input.IsActionTriggered(ButtonAction.ACTION_SHOOTUP, Bingo.player.ControllerIndex) then
                Bingo.taskSelectionPosition.Y = Bingo.taskSelectionPosition.Y - 1
            end
        else
            Bingo.renderPositionOfTasks = Isaac.WorldToRenderPosition(Vector(100, 420 + (99 - Options.MaxScale) / 2))
        end
        local taskSelected = Bingo.map[Bingo.taskSelectionPosition.Y + 1][Bingo.taskSelectionPosition.X + 1]
        if Bingo.taskSelectionEnable then
            if taskSelected.detailedTaskPart.achieveCount ~= nil and taskSelected.detailedTaskPart.TARGET_NUM ~= nil then
                Bingo.startMenu:DrawStringScaledUTF8(
                    taskSelected.task.description ..
                    " " .. taskSelected.detailedTaskPart.achieveCount .. "/" .. taskSelected.detailedTaskPart.TARGET_NUM,
                    Bingo.renderPositionOfTasks.X + 130, Bingo.renderPositionOfTasks.Y, 1.6, 1.6, KColor(1, 1, 1, 1))
            else
                Bingo.startMenu:DrawStringScaledUTF8(taskSelected.task.description, Bingo.renderPositionOfTasks.X + 130,
                    Bingo.renderPositionOfTasks.Y, 1.6, 1.6, KColor(1, 1, 1, 1))
            end
        else
            if taskSelected.detailedTaskPart.achieveCount ~= nil and taskSelected.detailedTaskPart.TARGET_NUM ~= nil then
                Bingo.startMenu:DrawStringUTF8(
                    taskSelected.task.description ..
                    " " .. taskSelected.detailedTaskPart.achieveCount .. "/" .. taskSelected.detailedTaskPart.TARGET_NUM,
                    Bingo.renderPositionOfTasks.X + 80, Bingo.renderPositionOfTasks.Y, KColor(1, 1, 1, 1))
            else
                Bingo.startMenu:DrawStringUTF8(taskSelected.task.description, Bingo.renderPositionOfTasks.X + 80,
                    Bingo.renderPositionOfTasks.Y, KColor(1, 1, 1, 1))
            end
        end
    end
end

-- 测试任务用
function Bingo:testTaskRender()
    if Bingo.gameIsStarted and Bingo.enableDebugTask then
        Bingo.test.task.taskIcon:SetFrame("task", 0)
        Bingo.test.task.taskIcon:Render(Vector(100, 100))
        if Bingo.test.task.isAchieved then
            Bingo.finishIcon:SetFrame("Finish1", 0)
            Bingo.finishIcon:Render(Vector(100, 100))
        end
    end
end

-- 当玩家击败结局boss时，生成重开的道具并阻止可能的结局动画播放
function Bingo:killFinalBosses()
    local entityList = Isaac.GetRoomEntities();
    for _, value in ipairs(entityList) do
        for _, value1 in ipairs(Bingo.finalBosses) do
            if value.Type == value1.type and value.Variant == value1.variant then
                Bingo.finalBossPtr.type = value1.type
                Bingo.finalBossPtr.variant = value1.variant
                Bingo.finalBossPtr.ref = EntityPtr(value)
            end
        end
    end
    if Bingo.finalBossPtr.ref ~= nil and Bingo.finalBossPtr.ref.Ref ~= nil and Bingo.finalBossPtr.ref.Ref:IsDead() then
        if Bingo.finalBossPtr.type == EntityType.ENTITY_BEAST or Bingo.finalBossPtr.type == EntityType.ENTITY_MEGA_SATAN_2 then
            Isaac.Spawn(Isaac.GetEntityTypeByName("stopEndAnimation"), 0, 0,
                Isaac.GetFreeNearPosition(Bingo.player.Position, 3), Vector(0, 0), Bingo.player)
            Isaac.Spawn(5, 340, 0, Vector(0, 0), Vector(0, 0), nil)
        end
        local restartKey=Bingo.game:Spawn(EntityType.ENTITY_PICKUP,100,Isaac.GetFreeNearPosition(Bingo.player.Position, 3),Vector(0,0),nil,Bingo.restartKey,100)
        restartKey:ToPickup():Morph(EntityType.ENTITY_PICKUP,100,Bingo.restartKey,false,true,true)
        Bingo.finalBossPtr.ref.Ref:Remove()
        Bingo.finalBossPtr.type = nil
        Bingo.finalBossPtr.variant = nil
        Bingo.finalBossPtr.ref = nil
    end
end

function Bingo:restartKeyUse()
    if Bingo.lives > 0 then
        Isaac.ExecuteCommand("restart")
        Bingo.lives = Bingo.lives - 1
        Bingo.continuedTime = Bingo.gameTime;
    end
    if Bingo.lives <= 0 then
        Bingo.gameIsOver = 2
    end
end

math.randomseed(Random())
Bingo.userId = Bingo.setUserId()

Bingo:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, Bingo.gameInitialize)
Bingo:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, Bingo.resetWhenExit)

Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.setGameTimeForShow)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.keyrRestart)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.countTime)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.pauseGame)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.setPauseTime)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.setTimeCounterContinued)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.showGameInfo)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.timeIsOver)
Bingo:AddCallback(ModCallbacks.MC_POST_GAME_END, Bingo.playerDeath)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.winAct)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.showGameOverInfo)
---add callbacks---
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.setPosition)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.gameStartMenu)
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.tasksIconRender)
Bingo:AddCallback(ModCallbacks.MC_POST_UPDATE, Bingo.killFinalBosses)

---for tasks---
for key, value in pairs(Bingo.mapForCallBacksFunc) do
    Bingo:AddCallback(key, value)
end

Bingo:AddCallback(ModCallbacks.MC_USE_ITEM, Bingo.isUseVoid, CollectibleType.COLLECTIBLE_VOID)
Bingo:AddCallback(ModCallbacks.MC_USE_CARD, Bingo.isUseBlackRune, Card.RUNE_BLACK)
Bingo:AddCallback(ModCallbacks.MC_USE_ITEM, Bingo.isUseBlackRune, CollectibleType.COLLECTIBLE_ABYSS)
Bingo:AddCallback(ModCallbacks.MC_USE_ITEM, Bingo.restartKeyUse, Bingo.restartKey)

-- 测试任务用
Bingo:AddCallback(ModCallbacks.MC_POST_RENDER, Bingo.testTaskRender)

-- 断线重连
Bingo:AddCallback(ModCallbacks.MC_POST_UPDATE, Bingo.reconnect)
