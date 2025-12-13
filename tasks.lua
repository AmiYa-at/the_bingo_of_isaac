--item pools--
local itemPoolOfNull = {}
local itemPoolOfAngel = {
    7, 33, 72, 78, 98, 101, 108, 112, 124, 138, 142, 146, 156, 162, 173, 178,
    182, 184, 185, 197, 243, 313, 326, 331, 332, 333, 334, 335, 363, 374, 387,
    390, 400, 407, 413, 415, 423, 464, 477, 490, 498, 499, 510, 519, 526, 528,
    533, 543, 567, 568, 573, 574, 579, 584, 586, 601, 622, 634, 640, 643, 651,
    653, 685, 686, 691, 696
}
local itemPoolOfDevil = {
    8, 34, 35, 51, 67, 74, 79, 80, 81, 82, 83, 84, 97, 109, 113, 114, 115, 118, 122,
    123, 127, 133, 134, 145, 157, 159, 163, 172, 186, 187, 212, 215, 216, 225, 230,
    237, 241, 259, 262, 268, 269, 275, 278, 292, 311, 360, 391, 399, 408, 409, 411,
    412, 417, 420, 431, 433, 441, 442, 462, 468, 475, 477, 498, 503, 506, 519, 526,
    530, 536, 545, 554, 556, 569, 572, 577, 606, 634, 646, 654, 665, 672, 679, 684,
    692, 694, 695, 698, 699, 702, 704, 705, 706, 712, 728
}
local itemPoolOfSecret = {
    11, 16, 17, 20, 35, 84, 120, 121, 127, 168, 190, 213, 226, 242, 258, 262, 263, 271,
    286, 287, 316, 321, 348, 388, 389, 402, 405, 424, 450, 489, 500, 501, 546, 562, 571,
    580, 582, 609, 612, 625, 628, 632, 636, 664, 667, 669, 674, 675, 677, 688, 689, 691,
    697, 700, 701, 703, 711, 716, 717, 719, 721, 723
}
local itemPoolOfUltraSecret = {
    12, 13, 15, 30, 31, 40, 45, 49, 51, 53, 67, 72, 73, 79, 80, 82, 96, 105, 109, 110, 118,
    119, 122, 135, 137, 157, 159, 166, 167, 176, 177, 182, 193, 208, 214, 230, 247, 253,
    254, 261, 276, 289, 334, 373, 394, 399, 411, 412, 421, 435, 443, 452, 462, 466, 475,
    481, 506, 511, 531, 541, 554, 556, 565, 572, 573, 580, 606, 607, 614, 616, 618, 621,
    637, 650, 654, 657, 671, 678, 682, 684, 692, 694, 695, 700, 702, 703, 704, 705, 706,
    711, 724, 726, 728

}
local itemPoolOfPlanetarium = {
    588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598
}
local itemTagOfFood = {
    collectibles = { 22, 23, 24, 25, 26, 346, 456, 707 }
}
local itemTagOfDice = {
    collectibles = { 476, 284, 105, 437, 406, 285, 386, 166, 283, 489, 609, 723 },
    Trinkets = { 67, 154 },
    pickUps = { 49 }
}
local itemTagOfIllness = {
    collectibles = { 103, 214, 261, 347, 350, 368, 379, 440, 446, 452, 453, 454, 459, 460,
        466, 469, 502, 510, 525, 531, 549, 553, 645, 657, 558, 680, 683, 724, 725, 726, 731 }
}
local itemTagOfCollectiblesWithChargeBar = {
    collectibles = { 69, 114, 118, 229, 275, 276, 316, 384, 395, 399, 471, 537, 556, 579, 597, 643, 678, 679, 680 }
}
local slotPoolOfBeggar = {
    4, 5, 6, 7, 9, 13, 15, 18
}
local pickupPoolOfChest = {
    50, 51, 52, 53, 54, 55, 56, 57, 58, 60, 360, 390
}
local entityPoolOfSins = {
    { type = EntityType.ENTITY_SLOTH },
    { type = EntityType.ENTITY_LUST },
    { type = EntityType.ENTITY_WRATH },
    { type = EntityType.ENTITY_GLUTTONY },
    { type = EntityType.ENTITY_GREED },
    { type = EntityType.ENTITY_ENVY },
    { type = EntityType.ENTITY_PRIDE }
}
--use the void or the blackrune--
local isUseVoidOrBlackRune = {
    isUseVoid = false,
    isUseBlackRune = false
}
-- 存储角色和任务相矛盾的键值对表
local conflictCharacter = {
    c0 = { 50 },                             -- 表以撒
    c10 = { 19, 26, 29, 34, 36, 50, 53,81,84 },    -- 表罗
    c4 = { 19, 42, 53 },                     --表蓝人
    c7 = { 29 },                             --表az
    c8 = { 59 },
    c12 = { 19, 53 },                        --黑犹大
    c14 = { 16, 19, 26, 53 },                --表店长
    c16 = { 19, 26, 29, 53 },                --表骨哥
    c17 = { 19, 26, 29, 53 },                --表骨哥魂
    c18 = { 19 },                            --表伯大尼
    c24 = { 19, 53 },                        --里犹大
    c25 = { 19, 42, 53, 100 },               --里蓝人
    c31 = { 19, 26, 29, 34, 36, 5, 53,79, 81,84 }, --里罗
    c33 = { 16, 19, 26, 53 },                --里店长
    c36 = { 19, 53 },                        --里伯大尼
    c35 = { 19, 29, 53 },                    --里骨哥
    c40 = { 19, 29, 53 },                    --里骨哥魂
    ---------表伊甸----------
    c9 = { 3, 10, 11, 12, 13, 17, 19, 20, 29, 30, 38, 39, 42, 43, 44, 50 }
}
-- 趣味模式奖励表
local specialModeReward = {
    type = { 5 },
    variantWithSubType = { { 10, 12 }, { 20, 7 }, { 30, 4 }, { 40, 7 }, { 50, 0 }, { 51, 0 }, { 52, 0 }, { 53, 0 }, { 54, 0 }, { 55, 0 }, { 56, 0 },
        { 57, 0 }, { 58, 0 }, { 60, 0 }, { 69, 2 }, { 70, 14 }, { 90, 4 }, { 100, 732 } }
}

-- 任务描述表
local taskDescriptionList = {
    [1] = "在天使房拿1个天使房道具",
    [2] = "在恶魔房拿3个恶魔房道具",
    [3] = "拥有死亡证明",
    [4] = "拥有饰品A+",
    [5] = "针套",
    [6] = "在隐藏房拿1个道具",
    [7] = "在红隐藏房拿1个道具",
    [8] = "拿1个0级道具",
    [9] = "拿1个4级道具",
    [10] = "射速≥7",
    [11] = "钥匙数量≥30",
    [12] = "金币数量≥99",
    [13] = "炸弹数量≥30",
    [14] = "猫套",
    [15] = "在星象房拿1个星象房道具",
    [16] = "碎心数量≥4",
    [17] = "拥有R键",
    [18] = "当前房间底座数量≥6",
    [19] = "同时拥有魂心、黑心和红心",
    [20] = "幸运≥4",
    [21] = "集齐两个钥匙碎片",
    [22] = "击败以撒",
    [23] = "击败小蓝人",
    [24] = "击败凹凸",
    [25] = "书套",
    [26] = "拥有完整两排血量",
    [27] = "摧毁x石头或超级x石头1次",
    [28] = "击败羔羊",
    [29] = "获得飞行能力",
    [30] = "攻击力>=15",
    [31] = "击败见证者",
    [32] = "完成一次矿层追逐战（神庙逃亡）",
    [33] = "天使套",
    [34] = "献祭踩单个刺踩到第10下",
    [35] = "在1分钟内击杀第一层的boss",
    [36] = "拥有5个带食物标签的道具（大胃王）",
    [37] = "同时有10个跟班",
    [38] = "触发1次传送",
    [39] = "拥有1张倒卡",
    [40] = "拥有硫磺火妈刀组合效果",
    [41] = "击败撒旦",
    [42] = "脸的颜色变成红色或蓝色",
    [43] = "拥有道具小石头",
    [44] = "拥有饰品血虱",
    [45] = "卖爆1台预言机",
    [46] = "打完1次Boss Rush",
    [47] = "击败超级撒旦",
    [48] = "恶魔套",
    [49] = "前两层所有普通房间全探索",
    [50] = "拥有1个骰子主题的道具、饰品或掉落物",
    [51] = "弹速>=1.8",
    [52] = "完成回溯线",
    [53] = "拥有至少6个心之容器",
    [54] = "喂饱1个除黑乞丐和白乞丐以外的乞丐",
    [55] = "移速等于2",
    [56] = "第一层不拿除了初始携带的道具以外的任何道具",
    [57] = "打2个Boss挑战房",
    [58] = "击败大小贪婪头目",
    [59] = "拥有1个疾病主题的道具",
    [60] = "进入5个商店房",
    [61] = "进入5个宝箱房",
    [62] = "镜子世界中的白房间全探索",
    [63] = "妈套",
    [64] = "连续3个房间不清理",
    [65] = "喂饱2个乞丐",
    [66] = "不打某一层boss并跳层",
    [67] = "摧毁6个店长尸体",
    [68] = "摧毁3个乞丐",
    [69] = "击败3个七宗罪boss",
    [70] = "完成全支线路线，以离开陵墓2层为完成",
    [71] = "Boss Rush和凹凸连打",
    [72] = "打完凹凸后直接打百变怪",
    [73] = "喂饱1个抽奖乞丐",
    [74] = "拥有1个带蓄力条的道具",
    [75] = "拥有1个符文",
    [76] = "击败腐化妈腿",
    [77] = "玩爆1台机器",
    [78] = "玩爆1台夹娃娃机",
    [79] = "进入3个诅咒房",
    [80] = "进入1个夹层房间",
    [81] = "累计受到50滴血伤害（1滴血为半颗心）",
    [82] = "累计使用卡牌、符文和魂石10次",
    [83] = "连续3层探索所有隐藏房和超级隐藏房",
    [84] = "拥有卖血袋和血袋",
    [85] = "清空 2 个商店",
    [86] = "宝宝套",
    [87] = "击败大幽灵",
    [88] = "在商店累计买5个道具",
    [89] = "累计使用药丸15次",
    [90] = "射程≥15",
    [91] = "对怪物累计造成5000点伤害",
    [92] = "累计杀死200只怪物",
    [93] = "击败2个天启boss",
    [94] = "累计使用主动15次",
    [95] = "红箱子开出1个道具",
    [96] = "箱子开出2个道具",
    [97] = "炸1个梳妆台",
    [98] = "只用无视护甲的炸弹伤害斩杀1个Boss",
    [99] = "累计消耗15把钥匙",
    [100] = "累计消耗20个炸弹"
}


local function getHashMapLength(map)
    local length = 0
    for key, value in pairs(map) do
        length = length + 1
    end
    return length
end

local function checkElementInTable(element, table)
    for _, value in ipairs(table) do
        if element == value then
            return true
        end
    end
    for _, value in pairs(table) do
        if element == value then
            return true
        end
    end
    return false
end


local dkjson = require("dkjson")

--tasks--
--组合类 tasks
local achieveSound = SFXManager()
local function tasks_new(map, index, description_)
    local obj = {
        taskIcon = Sprite(),
        taskIndex = index,
        isAchieved = false,
        achieveBy = -1,
        renderXOffset = 0,
        renderYOffset = 0,
        signal1 = 0,
        conflictTasks = nil,
        isOnMap = map,
        description = description_
    }
    return obj
end

local function setTaskForCallback(task)
    for key, value in pairs(task) do
        if type(key) == "number" then
            table.insert(Bingo.mapForCallBacks[key], { task, task[key] })
        end
    end
end

local function checkTaskIfAchived(task)
    if task.detailedTaskPart.achieveCount ~= nil and task.detailedTaskPart.TARGET_NUM ~= nil and
        task.detailedTaskPart.achieveCount >= task.detailedTaskPart.TARGET_NUM then
        task.task.isAchieved = true
    end
end

local function updateBingoMapConfigAndRemoveCallBack(task)
    if task.task.isAchieved and task.task.signal1 == 0 and task.task.isOnMap then
        if Bingo.gameMode == 1 and IsaacSocket and task.task.achieveBy == -1 then
            local taskMessage = {
                type = "achieve_task",
                roomId = Bingo.roomId,
                seatIndex = Bingo.playerIndex - 1,
                content = "完成任务" .. task.task.taskIndex,
                data = {
                    row = task.task.renderYOffset,
                    col = task.task.renderXOffset,
                    achieveBy = Bingo.playerIndex,
                    time = Bingo.gameTime
                }
            }
            local jsonStr, err = dkjson.encode(taskMessage, { indent = true })
            if err then
                print("json转换错误", err)
            else
                Bingo.ws.Send(jsonStr, false)
                print("finish_task: ",task.task.taskIndex,",finish_time: ",Bingo.gameTime)
            end
            task.task.signal1 = 1
        end
        if Bingo.gameMode == 0 then
            task.task.achieveBy = 0
            achieveSound:Play(579, 20)
            achieveSound:Play(128, 1)
            Bingo:getMapConfig(task.task.renderXOffset, task.task.renderYOffset)
            Game():GetHUD():ShowItemText("任务完成！", task.task.description)
            Bingo.finishTasksNum = Bingo.finishTasksNum + 1
            print("finish_task: ",task.task.taskIndex,",finish_time: ",Bingo.gameTime)
            task.task.signal1 = 1
            if Bingo.enableSpecialMode then
                local randomNum = math.random(18)
                Bingo.game:Spawn(specialModeReward.type[1], specialModeReward.variantWithSubType[randomNum][1],
                    Vector(100, 100), Vector(0, 0), Bingo.player, specialModeReward.variantWithSubType[randomNum][2],
                    math.random(1145141919))
            end
        end
    end
end

------------------------------------------

--组合类1 pickUpCollectible

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetNum: 目标道具的数量
--   item: 用于记录拾取的拿一个道具的类型（主动or被动）
--   pool: 目标道具的道具池
--   room: 当前房间的类型
--   targetItem: 目标道具，当不需要此选项时赋值为-1
--   targetQuality: 目标道具品质，当不需要此选项时赋值为-1
local function pickUpCollectibleOption(targetNum, item, pool, room, targetItem, targetQuality)
    local obj = {
        achieveCount = 0,
        TARGET_NUM = targetNum,
        item = item,
        itemPool = pool,
        roomType = room,
        targetItem = targetItem,
        targetQuality = targetQuality,
        signal = 0,
    }
    return obj
end

local function isItemInPool(numOfItem, itemPool)
    for index, value in ipairs(itemPool) do
        if value == numOfItem then
            return true
        end
    end
    return false
end

local function isItemInCurrentRoomItemPool(task)
    if (not Bingo.player:IsItemQueueEmpty()) and (Bingo.player.QueuedItem ~= nil) and
        (Bingo.player.QueuedItem.Item.Type ~= ItemType.ITEM_TRINKET) and
        ((isItemInPool(Bingo.player.QueuedItem.Item.ID, task.detailedTaskPart.itemPool) and
                (function()
                    for _, value in ipairs(task.detailedTaskPart.roomType) do
                        if Bingo.level:GetCurrentRoomDesc().Data.Type == value then
                            return true
                        end
                    end
                    return false
                end)() and task.detailedTaskPart.itemPool ~= itemPoolOfNull) or
            (task.detailedTaskPart.itemPool == itemPoolOfNull and task.detailedTaskPart.targetQuality == -1 and Bingo.player.QueuedItem.Item.ID == task.detailedTaskPart.targetItem) or
            (task.detailedTaskPart.itemPool == itemPoolOfNull and task.detailedTaskPart.targetItem == -1 and Bingo.player.QueuedItem.Item.Quality == task.detailedTaskPart.targetQuality)) and
        Bingo.player.QueuedItem.Touched == false then
        task.detailedTaskPart.signal = 1
        task.detailedTaskPart.item = Bingo.player.QueuedItem.Item.Type
        isUseVoidOrBlackRune.isUseVoid = false
        isUseVoidOrBlackRune.isUseBlackRune = false
    end
    if Bingo.player:IsItemQueueEmpty() and task.detailedTaskPart.signal == 1 and task.task.isAchieved == false and task.detailedTaskPart.achieveCount < task.detailedTaskPart.TARGET_NUM then
        if isUseVoidOrBlackRune.isUseBlackRune or (isUseVoidOrBlackRune.isUseVoid and (task.detailedTaskPart.item == ItemType.ITEM_PASSIVE or task.detailedTaskPart.item == ItemType.ITEM_FAMILIAR)) then
            isUseVoidOrBlackRune.isUseBlackRune = false
            isUseVoidOrBlackRune.isUseVoid = false
            task.detailedTaskPart.item = ItemType.ITEM_NULL
            task.detailedTaskPart.signal = 0
        elseif isUseVoidOrBlackRune.isUseVoid and task.detailedTaskPart.item == ItemType.ITEM_ACTIVE then
            isUseVoidOrBlackRune.isUseVoid = false
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
            task.detailedTaskPart.signal = 0
            task.detailedTaskPart.item = ItemType.ITEM_NULL
        end
    end
    if Bingo.player:IsItemQueueEmpty() and task.detailedTaskPart.signal == 1 and not (isUseVoidOrBlackRune.isUseBlackRune or isUseVoidOrBlackRune.isUseVoid) then
        if task.detailedTaskPart.item == ItemType.ITEM_PASSIVE or task.detailedTaskPart.item == ItemType.ITEM_FAMILIAR or task.detailedTaskPart.item == ItemType.ITEM_ACTIVE then
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
            task.detailedTaskPart.signal = 0
            task.detailedTaskPart.item = ItemType.ITEM_NULL
        end
    end
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end


-- pickUpCollectible 的子类，都为具体的任务

-- 任务1：在天使房拿1个天使房底座道具
local function task1()
    local obj = {
        task = tasks_new(true, 1, taskDescriptionList[1]),
        detailedTaskPart = pickUpCollectibleOption(1, ItemType.ITEM_NULL, itemPoolOfAngel, { RoomType.ROOM_ANGEL }, -1,
            -1),
        [ModCallbacks.MC_POST_UPDATE] = {
            isItemInCurrentRoomItemPool
        }
    }
    return obj
end

-- 任务2：在恶魔房拿3个恶魔房底座道具
local function task2()
    local obj = {
        task = tasks_new(true, 2, taskDescriptionList[2]),
        detailedTaskPart = pickUpCollectibleOption(3, ItemType.ITEM_NULL, itemPoolOfDevil, { RoomType.ROOM_DEVIL }, -1,
            -1),
        [ModCallbacks.MC_POST_UPDATE] = {
            isItemInCurrentRoomItemPool
        }
    }
    return obj
end

-- 任务6：在隐藏房拿1个隐藏房底座道具
local function task6()
    local obj = {
        task = tasks_new(true, 6, taskDescriptionList[6]),
        detailedTaskPart = pickUpCollectibleOption(1, ItemType.ITEM_NULL, itemPoolOfSecret,
            { RoomType.ROOM_SECRET, RoomType.ROOM_SUPERSECRET }, -1, -1),
        [ModCallbacks.MC_POST_UPDATE] = {
            isItemInCurrentRoomItemPool
        }
    }
    return obj
end

-- 任务7：在红隐藏房拿1个红隐藏底座道具
local function task7()
    local obj = {
        task = tasks_new(true, 7, taskDescriptionList[7]),
        detailedTaskPart = pickUpCollectibleOption(1, ItemType.ITEM_NULL, itemPoolOfUltraSecret,
            { RoomType.ROOM_ULTRASECRET }, -1, -1),
        [ModCallbacks.MC_POST_UPDATE] = {
            isItemInCurrentRoomItemPool
        }
    }
    return obj
end

-- 任务15：在星象房拿1个星象房底座道具
local function task15()
    local obj = {
        task = tasks_new(true, 15, taskDescriptionList[15]),
        detailedTaskPart = pickUpCollectibleOption(1, ItemType.ITEM_NULL, itemPoolOfPlanetarium,
            { RoomType.ROOM_PLANETARIUM }, -1, -1),
        [ModCallbacks.MC_POST_UPDATE] = {
            isItemInCurrentRoomItemPool
        }
    }
    return obj
end

-- 任务8： 拿到1个0级底座道具
local function task8()
    local obj = {
        task = tasks_new(true, 8, taskDescriptionList[8]),
        detailedTaskPart = pickUpCollectibleOption(1, ItemType.ITEM_NULL, itemPoolOfNull, RoomType.ROOM_NULL, -1, 0),
        [ModCallbacks.MC_POST_UPDATE] = {
            isItemInCurrentRoomItemPool
        }
    }
    return obj
end

-- 任务9：拿到1个4级底座道具
local function task9()
    local obj = {
        task = tasks_new(true, 9, taskDescriptionList[9]),
        detailedTaskPart = pickUpCollectibleOption(1, ItemType.ITEM_NULL, itemPoolOfNull, RoomType.ROOM_NULL, -1, 4),
        [ModCallbacks.MC_POST_UPDATE] = {
            isItemInCurrentRoomItemPool
        }
    }
    return obj
end

---------------------------------------------

-- 子类2 hasItems

-- 构造函数参数说明：
--   itemTag: 目标道具所带的标签
--   targetNum: 目标道具的数量
local function hasItemsOption(itemTag, itemCount, targetNum)
    local obj = {
        achieveCount = 0,
        itemTag = itemTag,
        itemCount = itemCount,
        TARGET_NUM = targetNum
    }
    return obj
end

local function hasItemsWithTag(task)
    local ItemCount = 0
    if task.detailedTaskPart.itemTag.collectibles ~= nil then
        local type_ = type(task.detailedTaskPart.itemCount)
        if type_ == "number" then
            for _, value in ipairs(task.detailedTaskPart.itemTag.collectibles) do
                if Bingo.player:HasCollectible(value, true) then
                    ItemCount = ItemCount + Bingo.player:GetCollectibleNum(value, true)
                end
            end
        elseif type_ == "table" then
            for index, value in ipairs(task.detailedTaskPart.itemTag.collectibles) do
                if Bingo.player:HasCollectible(value, true) and Bingo.player:GetCollectibleNum(value, true) >= task.detailedTaskPart.itemCount[index] then
                    ItemCount = ItemCount + 1
                end
            end
        end
    end
    if task.detailedTaskPart.itemTag.Trinkets ~= nil then
        for _, value in ipairs(task.detailedTaskPart.itemTag.Trinkets) do
            if Bingo.player:HasTrinket(value, true) then
                ItemCount = ItemCount + 1
            end
        end
    end
    if task.detailedTaskPart.itemTag.pickUps ~= nil then
        for _, value in ipairs(task.detailedTaskPart.itemTag.pickUps) do
            if (function()
                    for i = 0, 2, 1 do
                        if Bingo.player:GetCard(i) == value then
                            return true
                        end
                    end
                    return false
                end)() then
                ItemCount = ItemCount + 1
            end
        end
    end
    task.detailedTaskPart.achieveCount = ItemCount
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end





-- hasItems 的子类，都为具体的任务

-- 任务3：拥有死亡证明
local function task3()
    local obj = {
        task = tasks_new(true, 3, taskDescriptionList[3]),
        detailedTaskPart = hasItemsOption({ collectibles = { 628 } }, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务17：拥有R键
local function task17()
    local obj = {
        task = tasks_new(true, 17, taskDescriptionList[17]),
        detailedTaskPart = hasItemsOption({ collectibles = { 636 } }, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务4：拥有饰品A+
local function task4()
    local obj = {
        task = tasks_new(true, 4, taskDescriptionList[4]),
        detailedTaskPart = hasItemsOption({ Trinkets = { 145 } }, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务21：凑齐两把钥匙碎片
local function task21()
    local obj = {
        task = tasks_new(true, 21, taskDescriptionList[21]),
        detailedTaskPart = hasItemsOption({ collectibles = { 238, 239 } }, { 1, 1 }, 2),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务36：拥有5个带食物标签的道具
local function task36()
    local obj = {
        task = tasks_new(true, 36, taskDescriptionList[36]),
        detailedTaskPart = hasItemsOption(itemTagOfFood, 5, 5),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务50：拥有1个骰子主题的道具、饰品、掉落物
local function task50()
    local obj = {
        task = tasks_new(true, 50, taskDescriptionList[50]),
        detailedTaskPart = hasItemsOption(itemTagOfDice, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务44：拥有饰品血虱
local function task44()
    local obj = {
        task = tasks_new(true, 44, taskDescriptionList[44]),
        detailedTaskPart = hasItemsOption({ Trinkets = { 53 } }, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end


-- 任务43：拥有道具小石头
local function task43()
    local obj = {
        task = tasks_new(true, 43, taskDescriptionList[43]),
        detailedTaskPart = hasItemsOption({ collectibles = { 90 } }, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务39 拿到1张倒卡
local function task39()
    local obj = {
        task = tasks_new(true, 39, taskDescriptionList[39]),
        detailedTaskPart = hasItemsOption(
            { pickUps = { 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77 } },
            1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务59：拥有一个疾病主题的道具
local function task59()
    local obj = {
        task = tasks_new(true, 59, taskDescriptionList[59]),
        detailedTaskPart = hasItemsOption(itemTagOfIllness, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务75：拥有1个符文
local function task75()
    local obj = {
        task = tasks_new(true, 75, taskDescriptionList[75]),
        detailedTaskPart = hasItemsOption(
            { pickUps = { 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97 } },
            1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务74: 拥有1个带蓄力条的道具
local function task74()
    local obj = {
        task = tasks_new(true, 74, taskDescriptionList[74]),
        detailedTaskPart = hasItemsOption(itemTagOfCollectiblesWithChargeBar, 1, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end

-- 任务84: 拥有卖血袋和血袋
local function task84()
    local obj = {
        task = tasks_new(true, 84, taskDescriptionList[84]),
        detailedTaskPart = hasItemsOption({ collectibles = { 119, 135 } }, { 1, 1 }, 2),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasItemsWithTag
        }
    }
    return obj
end


---------------------------------------------

-- 子类3 bosses

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   TARGET_BOSS: 目标boss
local function bossesOption(targetBosses, targetNum)
    local obj = {
        bossPtr = {},
        TARGET_BOSS = targetBosses,
        TARGET_NUM = targetNum,
        currentRoom = 0,
        achieveCount = 0
    }
    return obj
end

local function hasKilledBosses(task)
    local room = Bingo.game:GetLevel():GetCurrentRoomDesc().ListIndex
    if task.detailedTaskPart.currentRoom ~= room and task.detailedTaskPart.TARGET_BOSS[1].type ~= EntityType.ENTITY_MOTHERS_SHADOW then
        task.detailedTaskPart.bossPtr = {}
        task.detailedTaskPart.currentRoom = room
    end
    for _, value in ipairs(Isaac.GetRoomEntities()) do
        for _, value1 in ipairs(task.detailedTaskPart.TARGET_BOSS) do
            if value.Type == value1.type and
                (value.Variant == value1.variant or value1.variant == nil) and
                (value.SubType == value1.subType or value1.subType == nil) and
                (task.detailedTaskPart.bossPtr[GetPtrHash(value)] == nil) then
                task.detailedTaskPart.bossPtr[GetPtrHash(value)] = EntityPtr(value)
            end
        end
    end
    for key, value in pairs(task.detailedTaskPart.bossPtr) do
        if value ~= true and ((value.Ref ~= nil and value.Ref:IsDead()) or value.Ref == nil) then
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
            print("114")
            task.detailedTaskPart.bossPtr[key] = true
        end
    end
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- bosses 的子类，都为具体的任务

-- 任务22：击败以撒
local function task22()
    local obj = {
        task = tasks_new(true, 22, taskDescriptionList[22]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_ISAAC, variant = 0 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 28, 31, 41, 52, 72 }
    }
    return obj
end

-- 任务23：击败小蓝人
local function task23()
    local obj = {
        task = tasks_new(true, 23, taskDescriptionList[23]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_ISAAC, variant = 1 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 28, 31, 41, 52, 72 }
    }
    return obj
end

-- 任务24：击败凹凸
local function task24()
    local obj = {
        task = tasks_new(true, 24, taskDescriptionList[24]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_HUSH, variant = 0 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 31, 52 }
    }
    return obj
end

-- 任务28：击败羔羊
local function task28()
    local obj = {
        task = tasks_new(true, 28, taskDescriptionList[28]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_THE_LAMB, variant = 0 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 22, 23, 31, 52, 72 }
    }
    return obj
end

-- 任务31：击败见证者
local function task31()
    local obj = {
        task = tasks_new(true, 31, taskDescriptionList[31]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_MOTHER, variant = 10 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 22, 23, 24, 28, 41, 47, 52, 71, 72 }
    }
    return obj
end

-- 任务41：击败撒旦
local function task41()
    local obj = {
        task = tasks_new(true, 41, taskDescriptionList[41]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_SATAN, variant = 10 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 22, 23, 31, 52, 72 }
    }
    return obj
end

-- 任务47：击败超级撒旦
local function task47()
    local obj = {
        task = tasks_new(true, 47, taskDescriptionList[47]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_MEGA_SATAN_2, variant = 0 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 31, 52, 72 }
    }
    return obj
end

-- 任务32：完成一次矿层追逐战（神庙逃亡）
local function task32()
    local obj = {
        task = tasks_new(true, 32, taskDescriptionList[32]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_MOTHERS_SHADOW, variant = 0 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        }
    }
    return obj
end

-- 任务52：击败祸兽
local function task52()
    local obj = {
        task = tasks_new(true, 52, taskDescriptionList[52]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_BEAST, variant = 0 } }),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        },
        conflictTasks = { 22, 23, 24, 28, 31, 41, 47, 71, 72 }
    }
    return obj
end

-- 任务58：击败大小贪婪头目
local function task58()
    local obj = {
        task = tasks_new(true, 58, taskDescriptionList[58]),
        detailedTaskPart = bossesOption(
            { { type = EntityType.ENTITY_GREED, variant = 0 }, { type = EntityType.ENTITY_GREED, variant = 1 } }, 2),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        }
    }
    return obj
end

-- 任务67：摧毁6次店长尸体
local function task67()
    local obj = {
        task = tasks_new(true, 67, taskDescriptionList[67]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_SHOPKEEPER, variant = 0 },
            { type = EntityType.ENTITY_SHOPKEEPER, variant = 1 },
            { type = EntityType.ENTITY_SHOPKEEPER, variant = 2 },
            { type = EntityType.ENTITY_SHOPKEEPER, variant = 3 },
            { type = EntityType.ENTITY_SHOPKEEPER, variant = 4 } }, 6),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        }
    }
    return obj
end

-- 任务69：击败3个七宗罪boss
local function task69()
    local obj = {
        task = tasks_new(true, 69, taskDescriptionList[69]),
        detailedTaskPart = bossesOption(entityPoolOfSins, 3),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        }
    }
    return obj
end

-- 任务76：击败腐化妈腿
local function task76()
    local obj = {
        task = tasks_new(true, 76, taskDescriptionList[76]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_MOM, subType = 3 },
            { type = EntityType.ENTITY_MOM, variant = 10, subType = 3 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        }
    }
    return obj
end

-- 任务87: 击败大幽灵
local function task87()
    local obj = {
        task = tasks_new(true, 87, taskDescriptionList[87]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_THE_HAUNT, variant = 0 } }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        }
    }
    return obj
end

-- 任务93: 击败2个天启boss
local function task93()
    local obj = {
        task = tasks_new(true, 93, taskDescriptionList[93]),
        detailedTaskPart = bossesOption({ { type = EntityType.ENTITY_FAMINE }, { type = EntityType.ENTITY_PESTILENCE },
            { type = EntityType.ENTITY_WAR,   variant = 10 }, { type = EntityType.ENTITY_DEATH, variant = 30 },
            { type = EntityType.ENTITY_WAR,   variant = 1 }, { type = EntityType.ENTITY_BEAST, variant = 10 },
            { type = EntityType.ENTITY_BEAST, variant = 20 }, { type = EntityType.ENTITY_BEAST, variant = 30 },
            { type = EntityType.ENTITY_BEAST, variant = 40 } }, 2),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasKilledBosses
        }
    }
    return obj
end


---------------------------------------------

-- 子类4 playerForms

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   TARGET_PLAYERFORM: 目标套装
local function playerFormsOption(playerForm)
    local obj = {
        TARGET_PLAYERFORM = playerForm
    }
    return obj
end

local function hasPlayerForm(task)
    if Bingo.player:HasPlayerForm(task.detailedTaskPart.TARGET_PLAYERFORM) then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- playerForms 的子类，都为具体的任务

-- 任务5：针套
local function task5()
    local obj = {
        task = tasks_new(true, 5, taskDescriptionList[5]),
        detailedTaskPart = playerFormsOption(PlayerForm.PLAYERFORM_DRUGS),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasPlayerForm
        }
    }
    return obj
end

-- 任务14：猫套
local function task14()
    local obj = {
        task = tasks_new(true, 14, taskDescriptionList[14]),
        detailedTaskPart = playerFormsOption(PlayerForm.PLAYERFORM_GUPPY),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasPlayerForm
        }
    }
    return obj
end

-- 任务25：书套
local function task25()
    local obj = {
        task = tasks_new(true, 25, taskDescriptionList[25]),
        detailedTaskPart = playerFormsOption(PlayerForm.PLAYERFORM_BOOK_WORM),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasPlayerForm
        }
    }
    return obj
end

-- 任务33：天使套
local function task33()
    local obj = {
        task = tasks_new(true, 33, taskDescriptionList[33]),
        detailedTaskPart = playerFormsOption(PlayerForm.PLAYERFORM_ANGEL),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasPlayerForm
        }
    }
    return obj
end

-- 任务48：恶魔套
local function task48()
    local obj = {
        task = tasks_new(true, 48, taskDescriptionList[48]),
        detailedTaskPart = playerFormsOption(PlayerForm.PLAYERFORM_EVIL_ANGEL),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasPlayerForm
        }
    }
    return obj
end

-- 任务63：妈套
local function task63()
    local obj = {
        task = tasks_new(true, 63, taskDescriptionList[63]),
        detailedTaskPart = playerFormsOption(PlayerForm.PLAYERFORM_MOM),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasPlayerForm
        }
    }
    return obj
end

--任务86: 宝宝套
local function task86()
    local obj = {
        task = tasks_new(true, 86, taskDescriptionList[86]),
        detailedTaskPart = playerFormsOption(PlayerForm.PLAYERFORM_BABY),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasPlayerForm
        }
    }
    return obj
end

---------------------------------------------

-- 子类5 attribute

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetAttribute: 目标属性
--   TARGET_NUM: 属性的目标数值
local function attributeOption(attribute, targetNum)
    local obj = {
        targetAttribute = attribute,
        TARGET_NUM = targetNum,
        achieveCount = 0
    }
    return obj
end

local function attributeComparison(task)
    task.detailedTaskPart.achieveCount = task.detailedTaskPart.targetAttribute()
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- attribute 的子类，都为具体的任务

-- 任务10：射速≥7
local function task10()
    local obj = {
        task = tasks_new(true, 10, taskDescriptionList[10]),
        detailedTaskPart = attributeOption(function()
            return 30.0000 / (Bingo.player.MaxFireDelay + 1)
        end, 7.00),
        [ModCallbacks.MC_POST_UPDATE] = {
            attributeComparison
        }
    }
    return obj
end

-- 任务20：幸运≥4
local function task20()
    local obj = {
        task = tasks_new(true, 20, taskDescriptionList[20]),
        detailedTaskPart = attributeOption(function()
            return Bingo.player.Luck
        end, 4.00),
        [ModCallbacks.MC_POST_UPDATE] = {
            attributeComparison
        }
    }
    return obj
end

-- 任务30：攻击力≥15
local function task30()
    local obj = {
        task = tasks_new(true, 30, taskDescriptionList[30]),
        detailedTaskPart = attributeOption(function()
            return Bingo.player.Damage
        end, 15.00),
        [ModCallbacks.MC_POST_UPDATE] = {
            attributeComparison
        }
    }
    return obj
end

-- 任务51：弹速≥1.8
local function task51()
    local obj = {
        task = tasks_new(true, 51, taskDescriptionList[51]),
        detailedTaskPart = attributeOption(function()
            return Bingo.player.ShotSpeed
        end, 1.80),
        [ModCallbacks.MC_POST_UPDATE] = {
            attributeComparison
        }
    }
    return obj
end

-- 任务55：移速等于2.0
local function task55()
    local obj = {
        task = tasks_new(true, 55, taskDescriptionList[55]),
        detailedTaskPart = attributeOption(function()
            return Bingo.player.MoveSpeed
        end, 2.00),
        [ModCallbacks.MC_POST_UPDATE] = {
            attributeComparison
        }
    }
    return obj
end

-- 任务90: 射程大于等于15
local function task90()
    local obj = {
        task = tasks_new(true, 90, taskDescriptionList[90]),
        detailedTaskPart = attributeOption(function()
            return Bingo.player.TearRange / 40
        end, 15.00),
        [ModCallbacks.MC_POST_UPDATE] = {
            attributeComparison
        }
    }
    return obj
end

---------------------------------------------

-- 子类6 pickUps

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetPickup: 目标掉落
--   TARGET_NUM: 属性的目标数值
local function pickUpsOption(targetPickup, targetNum)
    local obj = {
        targetPickup = targetPickup,
        TARGET_NUM = targetNum,
        achieveCount = 0
    }
    return obj
end

local function pickUpComprison(task)
    task.detailedTaskPart.achieveCount = task.detailedTaskPart.targetPickup()
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- pickUps 的子类，都为具体的任务

-- 任务11：钥匙数量≥30
local function task11()
    local obj = {
        task = tasks_new(true, 11, taskDescriptionList[11]),
        detailedTaskPart = pickUpsOption(function()
            return Bingo.player:GetNumKeys()
        end, 30),
        [ModCallbacks.MC_POST_UPDATE] = {
            pickUpComprison
        }
    }
    return obj
end

-- 任务12：金币数量≥99
local function task12()
    local obj = {
        task = tasks_new(true, 12, taskDescriptionList[12]),
        detailedTaskPart = pickUpsOption(function()
            return Bingo.player:GetNumCoins()
        end, 99),
        [ModCallbacks.MC_POST_UPDATE] = {
            pickUpComprison
        }
    }
    return obj
end

-- 任务13：炸弹数量≥30
local function task13()
    local obj = {
        task = tasks_new(true, 13, taskDescriptionList[13]),
        detailedTaskPart = pickUpsOption(function()
            return Bingo.player:GetNumBombs()
        end, 30),
        [ModCallbacks.MC_POST_UPDATE] = {
            pickUpComprison
        }
    }
    return obj
end

---------------------------------------------

-- 子类7 hearts

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetHeart: 目标属性的方法
--   TARGET_NUM: 属性的目标数值
local function heartsOption(targetHeart, targetNum)
    local obj = {
        targetHeart = targetHeart,
        TARGET_NUM = targetNum,
        achieveCount = 0
    }
    return obj
end

local function heartComparison(task)
    task.detailedTaskPart.achieveCount = task.detailedTaskPart.targetHeart()
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- hearts 的子类，都为具体的任务

-- 任务16：碎心数量≥4
local function task16()
    local obj = {
        task = tasks_new(true, 16, taskDescriptionList[16]),
        detailedTaskPart = heartsOption(function()
            return Bingo.player:GetBrokenHearts()
        end, 4),
        [ModCallbacks.MC_POST_UPDATE] = {
            heartComparison
        }
    }
    return obj
end

-- 任务26：有两排血量
local function task26()
    local obj = {
        task = tasks_new(true, 26, taskDescriptionList[26]),
        detailedTaskPart = heartsOption(function()
            return (Bingo.player:GetMaxHearts() + Bingo.player:GetSoulHearts() +
                Bingo.player:GetBoneHearts() * 2) / 2
        end, 12),
        [ModCallbacks.MC_POST_UPDATE] = {
            heartComparison
        }
    }
    return obj
end

-- 任务19：同时拥有魂心、黑心和红心
local function task19()
    local obj = {
        task = tasks_new(true, 19, taskDescriptionList[19]),
        detailedTaskPart = heartsOption(function()
            local heartsCount = 0
            if Bingo.player:GetHearts() >= 1 then
                heartsCount = heartsCount + 1
            end
            local blackheartsNum = (function(blackHearts)
                local sum = 0
                if blackHearts == 0 then
                    return 0
                end
                while blackHearts > 0 do
                    if blackHearts % 2 == 1 then
                        sum = sum + 1
                    end
                    blackHearts = math.floor(blackHearts / 2)
                end
                return sum
            end)(Bingo.player:GetBlackHearts())
            if blackheartsNum >= 1 then
                heartsCount = heartsCount + 1
            end
            if Bingo.player:GetSoulHearts() - blackheartsNum * 2 >= 1 then
                heartsCount = heartsCount + 1
            end
            return heartsCount
        end, 3),
        [ModCallbacks.MC_POST_UPDATE] = {
            heartComparison
        }
    }
    return obj
end

-- 任务53：拥有至少6个心之容器
local function task53()
    local obj = {
        task = tasks_new(true, 53, taskDescriptionList[53]),
        detailedTaskPart = heartsOption(function()
            return Bingo.player:GetMaxHearts() / 2
        end, 6),
        [ModCallbacks.MC_POST_UPDATE] = {
            heartComparison
        }
    }
    return obj
end

---------------------------------------------

-- 子类8 entities

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetEntities: 目标实体
--   variant: 目标实体变种清单（包含白名单和黑名单）
--   TARGET_NUM: 实体的目标数值
local function entitiesOption(entities, variant, targetNum)
    local obj = {
        targetEntities = entities,
        variant = variant,
        TARGET_NUM = targetNum,
        achieveCount = 0
    }
    return obj
end

local function isInWhiteList(task, entityVariant)
    if task.detailedTaskPart.variant.whiteList ~= nil then
        for _, value in ipairs(task.detailedTaskPart.variant.whiteList) do
            if entityVariant == value then
                return true
            end
        end
        return false
    end
end

local function isInBlackList(task, entityVariant)
    if task.detailedTaskPart.variant.blackList ~= nil then
        for _, value in ipairs(task.detailedTaskPart.variant.blackList) do
            if entityVariant == value then
                return true
            end
        end
        return false
    end
end

local function entitiesComparison(task)
    local entities = Isaac.GetRoomEntities()
    local entitiesCount = 0
    for _, value in ipairs(entities) do
        if value.Type == task.detailedTaskPart.targetEntities and ((isInWhiteList(task, value.Variant) ~= nil
                    and isInWhiteList(task, value.Variant))
                or ((isInBlackList(task, value.Variant)) ~= nil and not isInBlackList(task, value.Variant))) then
            entitiesCount = entitiesCount + 1
        end
    end
    task.detailedTaskPart.achieveCount = entitiesCount
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- entities 的子类，都为具体的任务

-- 任务18：单个房间内有6个道具底座
local function task18()
    local obj = {
        task = tasks_new(true, 18, taskDescriptionList[18]),
        detailedTaskPart = entitiesOption(EntityType.ENTITY_PICKUP, { whiteList = { 100 } }, 6),
        [ModCallbacks.MC_POST_UPDATE] = {
            entitiesComparison
        }
    }
    return obj
end

-- 任务37：可见跟班的数量达到10个
local function task37()
    local obj = {
        task = tasks_new(true, 37, taskDescriptionList[37]),
        detailedTaskPart = entitiesOption(EntityType.ENTITY_FAMILIAR, { blackList = { 43, 73, 201, 237, 228, 220 } }, 10),
        [ModCallbacks.MC_POST_UPDATE] = {
            entitiesComparison
        }
    }
    return obj
end

---------------------------------------------

-- 子类9 gridEntities

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetGridEntities: 目标实体的哈希表
--   TARGET_NUM: 实体的目标数值
local function gridEntityOption(gridEntities, targetNum)
    local obj = {
        targetGridEntities = gridEntities,
        TARGET_NUM = targetNum,
        achieveCount = 0,
        gridEntitiesMap = {}
    }
    return obj
end

local function isGridEntitiesDestroyed(task)
    for i = 0, 1000, 1 do
        if task.task.isAchieved then
            break
        end
        local gridEntity = Bingo.game:GetLevel():GetCurrentRoom():GetGridEntity(i)
        if gridEntity ~= nil and task.detailedTaskPart.targetGridEntities[gridEntity.Desc.Type] ~= nil and
            gridEntity.State == 2 and (task.detailedTaskPart.gridEntitiesMap[GetPtrHash(gridEntity)] == nil) then
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
            task.detailedTaskPart.gridEntitiesMap[GetPtrHash(gridEntity)] = true
            checkTaskIfAchived(task)
        end
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end


-- gridEntities 的子类，都为具体的任务

-- 任务27：摧毁x石头或超级x石头1次
local function task27()
    local obj = {
        task = tasks_new(true, 27, taskDescriptionList[27]),
        detailedTaskPart = gridEntityOption({
            [GridEntityType.GRID_ROCKT] = true,
            [GridEntityType.GRID_ROCK_SS] = true
        }, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            isGridEntitiesDestroyed
        }
    }
    return obj
end

---------------------------------------------

-- 子类10 gameState

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetStateFlag: 目标游戏状态
local function gameStateOption(stateFlag)
    local obj = {
        targetStateFlag = stateFlag
    }
    return obj
end

local function isTargetStateFlagFinished(task)
    if Bingo.game:GetStateFlag(task.detailedTaskPart.targetStateFlag) then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- gameState 的子类，都为具体的任务

-- 任务46：打完Boss Rush
local function task46()
    local obj = {
        task = tasks_new(true, 46, taskDescriptionList[46]),
        detailedTaskPart = gameStateOption(GameStateFlag.STATE_BOSSRUSH_DONE),
        [ModCallbacks.MC_POST_UPDATE] = {
            isTargetStateFlagFinished
        }
    }
    return obj
end

---------------------------------------------

-- 子类11 playerState

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   targetPlayerStateMethod: 目标玩家状态的方法
local function playerStateOption(playerStateMethod)
    local obj = {
        targetPlayerStateMethod = playerStateMethod
    }
    return obj
end

local function isPlayerStateFinished(task)
    if task.detailedTaskPart.targetPlayerStateMethod() then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- playerState 的子类，都为具体的任务

-- 任务29：获得飞行能力
local function task29()
    local obj = {
        task = tasks_new(true, 29, taskDescriptionList[29]),
        detailedTaskPart = playerStateOption(function()
            return Bingo.player.CanFly
        end),
        [ModCallbacks.MC_POST_UPDATE] = {
            isPlayerStateFinished
        }
    }
    return obj
end

--任务38：触发1次传送
local function task38()
    local obj = {
        task = tasks_new(true, 38, taskDescriptionList[38]),
        detailedTaskPart = playerStateOption(function()
            local playerSprite = Bingo.player:GetSprite()
            if playerSprite ~= nil and playerSprite:IsPlaying("TeleportUp") then
                return true
            end
            if playerSprite ~= nil and playerSprite:IsPlaying("TeleportDown") then
                return true
            end
        end),
        [ModCallbacks.MC_POST_RENDER] = {
            isPlayerStateFinished
        }
    }
    return obj
end

-- 任务40：拥有硫磺火妈刀组合效果
local function task40()
    local obj = {
        task = tasks_new(true, 40, taskDescriptionList[40]),
        detailedTaskPart = playerStateOption(function()
            if Bingo.player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_KNIFE) and
                Bingo.player:HasCollectible(CollectibleType.COLLECTIBLE_BRIMSTONE) then
                return true
            end
        end),
        [ModCallbacks.MC_POST_UPDATE] = {
            isPlayerStateFinished
        }
    }
    return obj
end

-- 任务42：头的肤色变成蓝色或者红色
local function task42()
    local obj = {
        task = tasks_new(true, 42, taskDescriptionList[42]),
        detailedTaskPart = playerStateOption(function()
            if Bingo.player:GetHeadColor() == SkinColor.SKIN_BLUE or
                Bingo.player:GetHeadColor() == SkinColor.SKIN_RED then
                return true
            end
        end),
        [ModCallbacks.MC_POST_UPDATE] = {
            isPlayerStateFinished
        }
    }
    return obj
end

---------------------------------------------

-- 子类12 machine

-- 参数说明：
--  Variant: 目标机器的变种
--  targetMachineState: 机器的目标状态（1为机器被卖爆，2为机器被摧毁）
--  TARGET_NUM: 目标数量
local function machineOption(variant, machineState, targetNum)
    local obj = {
        variant = variant,
        targetMachineState = machineState,
        TARGET_NUM = targetNum,
        achieveCount = 0,
        achieveMap = {},
        machinePositionMap = {},
        currentRoom = 0
    }
    return obj
end

local function getMachineState(machine)
    local machineSprite = machine:GetSprite()
    if machineSprite:IsPlaying("Death") then
        print("jijijiji")
        return 1
    end
    if machineSprite:IsPlaying("Broken") then
        return 2
    end
end

local function isEntityInMachinePool(task, entity)
    for _, value in ipairs(task.detailedTaskPart.variant) do
        if entity.Variant == value then
            return true
        end
    end
    return false
end

local function hasMachineInTargetState(task)
    local roomIndex = Bingo.game:GetLevel():GetCurrentRoomDesc().ListIndex
    if task.detailedTaskPart.currentRoom ~= roomIndex then
        task.detailedTaskPart.currentRoom = roomIndex
        task.detailedTaskPart.machinePositionMap = {}
    end

    local entityList = Isaac.GetRoomEntities()
    for _, value in ipairs(entityList) do
        -- 检索房间内有没有目标机器，有就把他的坐标放到machinePositionMap内
        if value.Type == EntityType.ENTITY_SLOT and isEntityInMachinePool(task, value) and (function()
                for _, value_ in ipairs(task.detailedTaskPart.machinePositionMap) do
                    if value.Position:Distance(value_) == 0 then
                        return false
                    end
                end
                return true
            end)() then
            table.insert(task.detailedTaskPart.machinePositionMap, value.Position)
        end
        -- 对应机器被卖爆出道具的情况: 当机器被卖爆出道具时，检索machinePositionMap内是否有与道具坐标相等的机器坐标，有就相当于原机器被卖爆了
        if value.Type == EntityType.ENTITY_PICKUP and value.Variant == 100 and task.detailedTaskPart.targetMachineState == 1 then
            for index, machinePosition in ipairs(task.detailedTaskPart.machinePositionMap) do
                if value.Position:Distance(machinePosition) == 0 then
                    task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
                    checkTaskIfAchived(task)
                    task.detailedTaskPart.machinePositionMap[index] = nil
                end
            end
        end
        -- 对应机器被卖爆没出道具或者是机器被摧毁的情况
        if (((value.Type == EntityType.ENTITY_SLOT and isEntityInMachinePool(task, value) and
                    getMachineState(value) == task.detailedTaskPart.targetMachineState)) and
                task.detailedTaskPart.achieveMap[GetPtrHash(value)] == nil) then
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
            task.detailedTaskPart.achieveMap[GetPtrHash(value)] = true
            checkTaskIfAchived(task)
        end
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- machine 的子类，都为具体的任务

-- 任务45: 玩爆1台预言机
local function task45()
    local obj = {
        task = tasks_new(true, 45, taskDescriptionList[45]),
        detailedTaskPart = machineOption({ 3 }, 1, 1),
        [ModCallbacks.MC_POST_RENDER] = {
            hasMachineInTargetState
        }
    }
    return obj
end

-- 任务77: 玩爆1台机器
local function task77()
    local obj = {
        task = tasks_new(true, 77, taskDescriptionList[77]),
        detailedTaskPart = machineOption({ 1, 2, 3, 16, 17 }, 1, 1),
        [ModCallbacks.MC_POST_RENDER] = {
            hasMachineInTargetState
        }
    }
    return obj
end

-- 任务78: 玩爆1台夹娃娃机
local function task78()
    local obj = {
        task = tasks_new(true, 78, taskDescriptionList[78]),
        detailedTaskPart = machineOption({ 16 }, 1, 1),
        [ModCallbacks.MC_POST_RENDER] = {
            hasMachineInTargetState
        }
    }
    return obj
end

-- 任务97: 炸1个梳妆台
local function task97()
    local obj = {
        task = tasks_new(true, 97, taskDescriptionList[97]),
        detailedTaskPart = machineOption({ 12 }, 2, 1),
        [ModCallbacks.MC_POST_UPDATE] = {
            hasMachineInTargetState
        }
    }
    return obj
end

---------------------------------------------

-- 子类14 specialRoomsAtStage

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   maxStage: 最高楼层（若不需要该选项则设为true，请传入一个函数）
--   targetRoom: 目标房间种类，请传入一个函数
--   TARGET_NUM: 特殊房间全部清理的楼层的目标数量
--   clearType: 房间完成清理的类型（普通房间完成清理和挑战房完成清理不同，1为普通房间，2为挑战房)
--   isCountByStage: 计算目标数量时是否以楼层数为基准（false则为以房间数为基准）
local function specialRoomsAtStageOption(maxStage, targetRoom, targetNum, clearType, isCountByStage)
    local obj = {
        maxStage = maxStage,
        targetRoom = targetRoom,
        TARGET_NUM = targetNum,
        clearType = clearType,
        isCountByStage = isCountByStage,
        achieveCount = 0,
        achieveMap = {},
        roomNum = 0,
        signal = 0
    }
    return obj
end

local function checkClearType(task, room)
    if task.detailedTaskPart.clearType == 1 then
        return room.Clear
    else
        return room.ChallengeDone
    end
end

local function checkSpecialRoomCleard(task)
    if task.detailedTaskPart.maxStage() then
        local roomList = Bingo.game:GetLevel():GetRooms()
        for i = 0, roomList.Size - 1, 1 do
            local room = task.detailedTaskPart.targetRoom(i)
            if type(room) == "table" then
                if checkElementInTable(roomList:Get(i).Data.Type, task.detailedTaskPart.targetRoom(i)) and
                    checkClearType(task, roomList:Get(i)) and task.detailedTaskPart.achieveMap[i] == nil then
                    task.detailedTaskPart.achieveMap[i] = true
                end
            else
                if type(room) == "number" then
                    if (roomList:Get(i).Data.Type == task.detailedTaskPart.targetRoom(i)) and
                        checkClearType(task, roomList:Get(i)) and task.detailedTaskPart.achieveMap[i] == nil then
                        task.detailedTaskPart.achieveMap[i] = true
                    end
                end
            end
        end
        if task.detailedTaskPart.isCountByStage and getHashMapLength(task.detailedTaskPart.achieveMap) == task.detailedTaskPart.roomNum and
            task.task.isAchieved == false and task.detailedTaskPart.roomNum ~= 0 and task.detailedTaskPart.signal == 0 then
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
            task.detailedTaskPart.signal = 1
        elseif (not task.detailedTaskPart.isCountByStage) and task.task.isAchieved == false and task.detailedTaskPart.roomNum ~= 0 then
            for key, value in pairs(task.detailedTaskPart.achieveMap) do
                if value == true then
                    task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
                    task.detailedTaskPart.achieveMap[key] = false
                end
            end
        end
        checkTaskIfAchived(task)
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function countTargetRoomsNumInNewStage(task)
    local roomList = Bingo.game:GetLevel():GetRooms()
    local roomNum = 0
    for i = 0, roomList.Size - 1, 1 do
        local targetRoom = task.detailedTaskPart.targetRoom(i)
        if type(targetRoom) == "table" then
            if checkElementInTable(roomList:Get(i).Data.Type, targetRoom) and
                roomList:Get(i).GridIndex ~= -100 then
                roomNum = roomNum + 1
            end
        elseif type(targetRoom) == "number" then
            if roomList:Get(i).Data.Type == targetRoom and roomList:Get(i).GridIndex ~= -100 then
                roomNum = roomNum + 1
            end
        end
    end
    task.detailedTaskPart.roomNum = roomNum
    task.detailedTaskPart.achieveMap = {}
    task.detailedTaskPart.signal = 0
end

-- specialRoomsAtStage 的子类，都为具体的任务

-- 任务49：前两层所有普通房间全探索
local function task49()
    local obj = {
        task = tasks_new(true, 49, taskDescriptionList[49]),
        detailedTaskPart = specialRoomsAtStageOption(function()
            local stage = Bingo.game:GetLevel():GetStage()
            local stageType = Bingo.game:GetLevel():GetStageType()
            if (stage == 1 or (stage == 2 and not (stageType == 4 or stageType == 5))) then
                return true
            end
        end, function()
            return RoomType.ROOM_DEFAULT
        end, 2, 1, true),
        [ModCallbacks.MC_POST_UPDATE] = {
            checkSpecialRoomCleard
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            countTargetRoomsNumInNewStage
        }
    }
    countTargetRoomsNumInNewStage(obj)
    return obj
end

-- 任务57：打2个Boss挑战房
local function task57()
    local obj = {
        task = tasks_new(true, 57, taskDescriptionList[57]),
        detailedTaskPart = specialRoomsAtStageOption(function()
            return Bingo.game:GetLevel():HasBossChallenge()
        end, function()
            return RoomType.ROOM_CHALLENGE
        end, 2, 2, false),
        [ModCallbacks.MC_POST_UPDATE] = {
            checkSpecialRoomCleard
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            countTargetRoomsNumInNewStage
        }
    }
    countTargetRoomsNumInNewStage(obj)
    return obj
end

-- 任务60：进入5个商店房
local function task60()
    local obj = {
        task = tasks_new(true, 60, taskDescriptionList[60]),
        detailedTaskPart = specialRoomsAtStageOption(function()
            return true
        end, function()
            return RoomType.ROOM_SHOP
        end, 5, 1, false),
        [ModCallbacks.MC_POST_UPDATE] = {
            checkSpecialRoomCleard
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            countTargetRoomsNumInNewStage
        }
    }
    countTargetRoomsNumInNewStage(obj)
    return obj
end

-- 任务61：进入5个宝箱房
local function task61()
    local obj = {
        task = tasks_new(true, 61, taskDescriptionList[61]),
        detailedTaskPart = specialRoomsAtStageOption(function()
            return true
        end, function()
            return RoomType.ROOM_TREASURE
        end, 5, 1, false),
        [ModCallbacks.MC_POST_UPDATE] = {
            checkSpecialRoomCleard
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            countTargetRoomsNumInNewStage
        }
    }
    countTargetRoomsNumInNewStage(obj)
    return obj
end

-- 任务62：镜子世界中所有房间全探索
local function task62()
    local obj = {
        task = tasks_new(true, 62, taskDescriptionList[62]),
        detailedTaskPart = specialRoomsAtStageOption(function()
            return Bingo.game:GetRoom():IsMirrorWorld()
        end, function(i)
            local roomList = Bingo.game:GetLevel():GetRooms()
            if roomList:Get(i).Data.Type == RoomType.ROOM_ULTRASECRET then
                return RoomType.ROOM_NULL
            end
            if i >= roomList.Size / 2 then
                return roomList:Get(i).Data.Type
            end
        end, 1, 1, true),
        [ModCallbacks.MC_POST_UPDATE] = {
            checkSpecialRoomCleard
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            countTargetRoomsNumInNewStage
        }
    }
    countTargetRoomsNumInNewStage(obj)
    return obj
end

-- 任务79：进入刺房3次
local function task79()
    local obj = {
        task = tasks_new(true, 79, taskDescriptionList[79]),
        detailedTaskPart = specialRoomsAtStageOption(function()
            return true
        end, function()
            return RoomType.ROOM_CURSE
        end, 3, 1, false),
        [ModCallbacks.MC_POST_UPDATE] = {
            checkSpecialRoomCleard
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            countTargetRoomsNumInNewStage
        }
    }
    countTargetRoomsNumInNewStage(obj)
    return obj
end

-- 任务83辅助函数
local function task83AssistanceFunc1(task)
    if task.detailedTaskPart.achieveCount <= task.detailedTaskPart.preAchieveCount then
        task.detailedTaskPart.achieveCount = 0
        task.detailedTaskPart.preAchieveCount = 0
    else
        task.detailedTaskPart.preAchieveCount = task.detailedTaskPart.achieveCount
    end
end

-- 任务83: 连续3层打开隐藏房和超级隐藏房

local function task83()
    local obj = {
        task = tasks_new(true, 83, taskDescriptionList[83]),
        detailedTaskPart = specialRoomsAtStageOption(function()
            return true
        end, function()
            return { RoomType.ROOM_SECRET, RoomType.ROOM_SUPERSECRET }
        end, 3, 1, true),
        [ModCallbacks.MC_POST_UPDATE] = {
            checkSpecialRoomCleard
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            countTargetRoomsNumInNewStage,
            task83AssistanceFunc1
        }
    }
    obj.detailedTaskPart.preAchieveCount = 0
    countTargetRoomsNumInNewStage(obj)
    task83AssistanceFunc1(obj)
    return obj
end



---------------------------------------------

-- 子类15 beggar

-- 构造函数参数说明：
--   map: 该任务是否在图上
--   index: 该任务的索引（如任务1索引则为1）
--   variant: 目标乞丐种类池
--   beggarState: 目标乞丐的状态（1为被喂饱，2为被摧毁）
--   TARGET_NUM: 目标数量
--   currentRoom: 当前房间
local function beggarOption(variant, beggarState, targetNum)
    local obj = {
        variant = variant,
        targetBeggarState = beggarState,
        TARGET_NUM = targetNum,
        achieveCount = 0,
        achieveMap = {},
        currentRoom = 0
    }
    return obj
end

local function getBeggarState(beggar)
    if beggar ~= nil and beggar:GetSprite():IsPlaying("Teleport") then
        print("sb")
        return 1
    elseif beggar == nil then
        print("ok")
        return 2
    end
    return 0
end

local function isEntityInBeggarPool(task, entity)
    for _, value in ipairs(task.detailedTaskPart.variant) do
        if entity.Variant == value then
            return true
        end
    end
    return false
end

local function hasSatisfyBeggar(task)
    local roomIndex = Bingo.game:GetLevel():GetCurrentRoomDesc().ListIndex
    if task.detailedTaskPart.currentRoom ~= roomIndex then
        task.detailedTaskPart.currentRoom = roomIndex
        task.detailedTaskPart.achieveMap = {}
    end
    local entityList = Isaac.GetRoomEntities()
    for _, value in ipairs(entityList) do
        if value.Type == EntityType.ENTITY_SLOT and isEntityInBeggarPool(task, value) and
            task.detailedTaskPart.achieveMap[GetPtrHash(value)] == nil then
            task.detailedTaskPart.achieveMap[GetPtrHash(value)] = { EntityPtr(value), true }
        end
    end
    for key, value in pairs(task.detailedTaskPart.achieveMap) do
        if value[2] == true and getBeggarState(value[1].Ref) ~= nil and
            getBeggarState(value[1].Ref) == task.detailedTaskPart.targetBeggarState then
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
            checkTaskIfAchived(task);
            (task.detailedTaskPart.achieveMap[key])[2] = false
        elseif value[2] == true and getBeggarState(value[1].Ref) ~= nil and
            getBeggarState(value[1].Ref) ~= task.detailedTaskPart.targetBeggarState and getBeggarState(value[1].Ref) ~= 0 then
            (task.detailedTaskPart.achieveMap[key])[2] = false;
        end
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- beggar 的子类，都是具体的任务

-- 任务54：喂饱1个特殊乞丐（除黑乞丐和白乞丐以外的乞丐）
local function task54()
    local obj = {
        task = tasks_new(true, 54, taskDescriptionList[54]),
        detailedTaskPart = beggarOption({ 6, 7, 9, 13, 15, 18 }, 1, 1),
        [ModCallbacks.MC_POST_RENDER] = {
            hasSatisfyBeggar
        }
    }
    return obj
end

-- 任务65：喂饱2个乞丐
local function task65()
    local obj = {
        task = tasks_new(true, 65, taskDescriptionList[65]),
        detailedTaskPart = beggarOption(slotPoolOfBeggar, 1, 2),
        [ModCallbacks.MC_POST_RENDER] = {
            hasSatisfyBeggar
        }
    }
    return obj
end

-- 任务68：摧毁3个乞丐
local function task68()
    local obj = {
        task = tasks_new(true, 68, taskDescriptionList[68]),
        detailedTaskPart = beggarOption(slotPoolOfBeggar, 2, 3),
        [ModCallbacks.MC_POST_RENDER] = {
            hasSatisfyBeggar
        }
    }
    return obj
end

-- 任务73：喂饱1个抽奖乞丐
local function task73()
    local obj = {
        task = tasks_new(true, 73, taskDescriptionList[73]),
        detailedTaskPart = beggarOption({ 6, 15 }, 1, 1),
        [ModCallbacks.MC_POST_RENDER] = {
            hasSatisfyBeggar
        }
    }
    return obj
end

---------------------------------------------

-- 子类20 consumption
-- 参数说明:
--  targetPickup: 目标掉落物(请返回1个函数)
--  TARGET_NUM: 目标掉落物的需求量
--  achieveCount: 当前该任务完成的量
--  currentNum: 记录上一刻的目标掉落物的数量
local function consumptionOption(targetPickup, targetNum)
    local obj = {
        targetPickup = targetPickup,
        TARGET_NUM = targetNum,
        achieveCount = 0,
        currentNum = 0,
    }
    return obj
end

local function consumeEnoughPickups(task)
    local currentNum = task.detailedTaskPart.currentNum
    local targetPickup = task.detailedTaskPart.targetPickup()
    if currentNum-1== targetPickup then
        task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + (currentNum - targetPickup)
    end
    task.detailedTaskPart.currentNum = targetPickup
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- consumption 的子类，都为具体的任务

-- 任务99: 累计消耗15把钥匙
local function task99()
    local obj = {
        task = tasks_new(true, 99, taskDescriptionList[99]),
        detailedTaskPart = consumptionOption(function()
            return Bingo.player:GetNumKeys()
        end, 15),
        [ModCallbacks.MC_POST_UPDATE] = {
            consumeEnoughPickups
        }
    }
    return obj
end

-- 任务100: 累计消耗20个炸弹
local function task100()
    local obj = {
        task = tasks_new(true, 100, taskDescriptionList[100]),
        detailedTaskPart = consumptionOption(function()
            return Bingo.player:GetNumBombs()
        end, 20),
        [ModCallbacks.MC_POST_UPDATE] = {
            consumeEnoughPickups
        }
    }
    return obj
end

---------------------------------------------

-- 子类21 OpenChest
-- 参数说明:
--  variant: 目标箱子变种的表
--  targetChestState: 目标箱子的状态(1为打开但没给道具,2为打开且给道具)
local function OpenChestOption(variant, chestState, targetNum)
    local obj = {
        variant = variant,
        targetChestState = chestState,
        TARGET_NUM = targetNum,
        achieveCount = 0,
        chestPtr = {},
        currentRoom = 0
    }
    return obj
end

-- 此函数用于处理房间内的箱子，当玩家进入房间时，收集房间内的所有箱子的信息并储存，用于后面检测开箱逻辑
local function chestsInCurrentRoom(task, pickup, player, _)
    local roomIndex = Bingo.game:GetLevel():GetCurrentRoomDesc().ListIndex
    if task.detailedTaskPart.currentRoom ~= roomIndex then
        task.detailedTaskPart.currentRoom = roomIndex
        task.detailedTaskPart.chestPtr = {}
    end
    local entityList = Isaac.GetRoomEntities()
    for _, value in ipairs(entityList) do
        -- 检索房间内有没有目标箱子，有就把他的坐标和EntityPtr放入chestPtr内
        if value.Type == EntityType.ENTITY_PICKUP and checkElementInTable(value.Variant, task.detailedTaskPart.variant) and
            (function()
                for key, _ in pairs(task.detailedTaskPart.chestPtr) do
                    if key == GetPtrHash(value) then
                        return false
                    end
                end
                return true
            end)() then
            task.detailedTaskPart.chestPtr[GetPtrHash(value)] = { EntityPtr(value), value.Position }
        end
    end
    -- 维护chestPtr表内的变量，检查Position和EntityPtr指向的对象的实际坐标是否一致，不一致则更新Position
    for key, value in pairs(task.detailedTaskPart.chestPtr) do
        if value[1].Ref ~= nil and value[1].Ref.Position:Distance(value[2]) ~= 0 then
            task.detailedTaskPart.chestPtr[key][2] = value[1].Ref.Position
        end
    end
    for key, value in pairs(task.detailedTaskPart.chestPtr) do
        -- 处理箱子被打开且没有给道具的情况
        if value[1].Ref ~= nil and value[1].Ref:GetSprite():IsPlaying("Opened") and
            task.detailedTaskPart.targetChestState == 1 then
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
        end
        -- 处理箱子被打开且给道具的情况
        if value[1].Ref == nil then
            local entityList_ = Isaac.GetRoomEntities()
            for _, entity in ipairs(entityList_) do
                if entity.Type == EntityType.ENTITY_PICKUP and entity.Variant == 100 and value[2]:Distance(entity.Position) == 0 then
                    task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
                    task.detailedTaskPart.chestPtr[key] = nil
                end
            end
        end
    end
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

-- OpenChest 的组合子类, 每一个都是具体的任务

-- 任务95: 开红箱子出1个道具
local function task95()
    local obj = {
        task = tasks_new(true, 95, taskDescriptionList[95]),
        detailedTaskPart = OpenChestOption({ 360 }, 2, 1),
        [ModCallbacks.MC_POST_RENDER] = {
            chestsInCurrentRoom
        }
    }
    return obj
end

local function task96()
    local obj = {
        task = tasks_new(true, 96, taskDescriptionList[96]),
        detailedTaskPart = OpenChestOption(pickupPoolOfChest, 2, 2),
        [ModCallbacks.MC_POST_RENDER] = {
            chestsInCurrentRoom
        }
    }
    return obj
end




-- 子类22 other
local function otherOption()
    local obj = {}
    return obj
end

-- other 的子类，都为具体的任务

-- 任务34：献祭踩单个刺踩到第10下
local function task34Method(task)
    for i = 0, 1000, 1 do
        if task.task.isAchieved then
            break
        end
        local gridEntity = Bingo.game:GetLevel():GetCurrentRoom():GetGridEntity(i)
        if gridEntity ~= nil and gridEntity.Desc.Type == GridEntityType.GRID_SPIKES then
            task.detailedTaskPart.achieveCount = gridEntity.VarData
            checkTaskIfAchived(task)
        end
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task34()
    local obj = {
        task = tasks_new(true, 34, taskDescriptionList[34]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task34Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 10
    return obj
end

-- 任务35：在1分钟内击杀第一层的boss
local function task35Method(task)
    local roomList = Bingo.game:GetLevel():GetRooms()
    local stage = Bingo.game:GetLevel():GetStage()
    local stageType = Bingo.game:GetLevel():GetStageType()
    if Bingo.game.TimeCounter <= 1800 and roomList:Get(0).Clear and stage == LevelStage.STAGE1_1 and
        (stageType ~= StageType.STAGETYPE_REPENTANCE and stageType ~= StageType.STAGETYPE_REPENTANCE_B) then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task35()
    local obj = {
        task = tasks_new(true, 35, taskDescriptionList[35]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task35Method
        }
    }
    return obj
end

-- 任务56：第一层不拿任何额外道具（初始携带的不算）
local function task56Method(task)
    local stage = Bingo.game:GetLevel():GetStage()
    local stageType = Bingo.game:GetLevel():GetStageType()
    if stage == LevelStage.STAGE1_1 and stageType ~= StageType.STAGETYPE_REPENTANCE and
        stageType ~= StageType.STAGETYPE_REPENTANCE_B and (Bingo.player.QueuedItem.Item ~= nil and Bingo.player.QueuedItem.Item.Type ~= ItemType.ITEM_TRINKET) then
        task.detailedTaskPart.isPickCollectible = true
    end
    if (stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B or
            stage >= 2) and task.detailedTaskPart.isPickCollectible == false then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task56AssistanceFunc1(task)
    local stage = Bingo.game:GetLevel():GetStage()
    if stage == LevelStage.STAGE1_1 then
        task.detailedTaskPart.isPickCollectible = false
    end
end

local function task56()
    local obj = {
        task = tasks_new(true, 56, taskDescriptionList[56]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task56Method
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            task56AssistanceFunc1
        }
    }
    obj.detailedTaskPart.isPickCollectible = false
    return obj
end

-- 任务64：连续3个房间不清理
local function task64Method(task)
    local lastRoom = Bingo.game:GetLevel():GetLastRoomDesc()
    if lastRoom ~= nil and (not lastRoom.Clear) and
        task.detailedTaskPart.achieveMap[lastRoom.ListIndex] == nil then
        task.detailedTaskPart.achieveMap[lastRoom.ListIndex] = true
    elseif lastRoom ~= nil and lastRoom.Clear then
        task.detailedTaskPart.achieveMap = {}
    end
    if task.task.isAchieved == false then
        task.detailedTaskPart.achieveCount = getHashMapLength(task.detailedTaskPart.achieveMap)
    end
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task64()
    local obj = {
        task = tasks_new(true, 64, taskDescriptionList[64]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task64Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 3
    obj.detailedTaskPart.achieveMap = {}
    return obj
end

-- 任务 66：在某层不打这一层boss并跳层
local function task66Method(task)
    local rooms=Bingo.game:GetLevel():GetRooms()
    for i = 0, rooms.Size-1, 1 do
        if rooms:Get(i).Data.Type==RoomType.ROOM_BOSS and rooms:Get(i).Clear then
            task.detailedTaskPart.isClearBoss = true
        end
    end
end

local function task66AssistanceFunc1(task)
    local currentStage=Bingo.game:GetLevel():GetStage()
    local currentStageType=Bingo.game:GetLevel():GetStageType()
    if ((currentStage>task.detailedTaskPart.previousStage) or (currentStage==task.detailedTaskPart.previousStage and currentStageType>task.detailedTaskPart.previousStageType)) and (not task.detailedTaskPart.isClearBoss) then
        task.task.isAchieved = true
    end
    task.detailedTaskPart.isClearBoss = false
    task.detailedTaskPart.previousStage=currentStage
    task.detailedTaskPart.previousStageType=currentStageType
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task66()
    local obj = {
        task = tasks_new(true, 66, taskDescriptionList[66]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task66Method
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            task66AssistanceFunc1
        }
    }
    obj.detailedTaskPart.isClearBoss = false
    obj.detailedTaskPart.previousStage = Bingo.game:GetLevel():GetStage()
    obj.detailedTaskPart.previousStageType=Bingo.game:GetLevel():GetStageType()
    return obj
end

-- 任务70：完成全支线路线，以离开陵墓2层为完成
local function task70Method(task)
    if Bingo.game:GetLevel():GetStage() >= 7 and Bingo.game:GetLevel():GetStage() <= 12 and task.detailedTaskPart.isOnbranchLine then
        task.task.isAchieved = true
    end
    if Bingo.game:GetLevel():GetStageType() <= 3 and Bingo.game:GetLevel():GetStage() > 1 then
        task.detailedTaskPart.isOnbranchLine = false
    end
    if (Bingo.game:GetLevel():GetStage() == 1 and Bingo.game:GetLevel():GetStageType() <= 3) then
        task.detailedTaskPart.isOnbranchLine = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task70()
    local obj = {
        task = tasks_new(true, 70, taskDescriptionList[70]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task70Method
        }
    }
    obj.detailedTaskPart.isOnbranchLine = true
    return obj
end

-- 任务71：Boss Rush和凹凸连打
local function task71Method(task)
    if Bingo.game:GetStateFlag(GameStateFlag.STATE_BOSSRUSH_DONE) and
        Bingo.game:GetStateFlag(GameStateFlag.STATE_BLUEWOMB_DONE) then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end
local function task71()
    local obj = {
        task = tasks_new(true, 71, taskDescriptionList[71]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task71Method
        },
        conflictTasks = { 31, 52 }
    }
    return obj
end

-- 任务72：打完凹凸后直接打百变怪
local function task72Method(task)
    local stage = Bingo.game:GetLevel():GetStage()
    local room = Bingo.game:GetLevel():GetCurrentRoomDesc()
    if stage == LevelStage.STAGE7 and room.Data.Type == RoomType.ROOM_BOSS and
        Isaac.CountEntities(nil, EntityType.ENTITY_DELIRIUM, 0, 0)>0 then
        task.detailedTaskPart.deliriumRoom = room.ListIndex
    end
    if Bingo.game:GetLevel():GetCurrentRoomDesc().ListIndex == task.detailedTaskPart.deliriumRoom and
        Bingo.game:GetLevel():GetCurrentRoomDesc().Clear then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end
local function task72()
    local obj = {
        task = tasks_new(true, 72, taskDescriptionList[72]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task72Method
        },
        conflictTasks = { 22, 23, 28, 31, 41, 47, 52 }
    }
    obj.detailedTaskPart.deliriumRoom = -1
    return obj
end

-- 任务80: 进入1个夹层房间
local function task80Method(task)
    local room = Bingo.game:GetLevel():GetCurrentRoomDesc()
    if room.Data.Type == RoomType.ROOM_DUNGEON and
        room.Clear == true then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task80()
    local obj = {
        task = tasks_new(true, 80, taskDescriptionList[80]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task80Method
        }
    }
    return obj
end

-- 任务81: 累计受到50滴血伤害(1滴血为半颗心)
local function task81Method(task, entity, amount, _, _, _)
    if entity.Type == EntityType.ENTITY_PLAYER then
        task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + amount
    end
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task81()
    local obj = {
        task = tasks_new(true, 81, taskDescriptionList[81]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_ENTITY_TAKE_DMG] = {
            task81Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 50
    return obj
end

-- 任务82: 82累计使用卡牌、符文和魂石10次
local function task82Method(task)
    task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task82()
    local obj = {
        task = tasks_new(true, 82, taskDescriptionList[82]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_USE_CARD] = {
            task82Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 10
    return obj
end

-- 任务85: 清空商店所有商品2次
local function task85Method(task)
    local currentRoom = Bingo.game:GetLevel():GetCurrentRoom()
    local currentRoomDesc = Bingo.game:GetLevel():GetCurrentRoomDesc()
    local currentRoomIndex = currentRoomDesc.SafeGridIndex
    if currentRoom:IsMirrorWorld() then
        currentRoomIndex = -currentRoomIndex
    end
    if currentRoomDesc.Data.Type ~= RoomType.ROOM_SHOP then
        return
    end
    -- 进入商店，初始化一条商店记录，初始状态1
    if task.detailedTaskPart.shopStatus[currentRoomIndex] == nil then
        task.detailedTaskPart.shopStatus[currentRoomIndex] = 1
    end
    -- 如果商店有商品，更新状态为2
    if task.detailedTaskPart.shopStatus[currentRoomIndex] == 1 then
        local entityList = Isaac.GetRoomEntities()
        for _, value in ipairs(entityList) do
            if value.Type == EntityType.ENTITY_PICKUP and
                value:ToPickup():IsShopItem() then
                task.detailedTaskPart.shopStatus[currentRoomIndex] = 2
                break
            end
        end
    end
    -- 如果商品清空，更新状态为3
    if task.detailedTaskPart.shopStatus[currentRoomIndex] == 2 then
        local entityList = Isaac.GetRoomEntities()
        local hasShopItem = false
        for _, value in ipairs(entityList) do
            if value.Type == EntityType.ENTITY_PICKUP and
                value:ToPickup():IsShopItem() then
                hasShopItem = true
                break
            end
        end
        if not hasShopItem then
            task.detailedTaskPart.shopStatus[currentRoomIndex] = 3
            task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
        end
    end
    -- 备注：这里限制了一个商店只能做一次任务，即使有 roll 机可以清空多次
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function resetMarkInNewStage(task)
    task.detailedTaskPart.shopStatus = {}
end

local function task85()
    local obj = {
        task = tasks_new(true, 85, taskDescriptionList[85]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            task85Method
        },
        [ModCallbacks.MC_POST_NEW_LEVEL] = {
            resetMarkInNewStage
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 2
    obj.detailedTaskPart.shopStatus = {}
    resetMarkInNewStage(obj)
    return obj
end

-- 任务89: 累计使用药丸15次
local function task89Method(task)
    print("jb114")
    task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task89()
    local obj = {
        task = tasks_new(true, 89, taskDescriptionList[89]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_USE_PILL] = {
            task89Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 15
    return obj
end

-- 任务88: 用金币累计买5个道具
local function task88Method(task, pickup, player, _)
    if pickup:IsShopItem() and pickup.Type == EntityType.ENTITY_PICKUP and
        pickup.Variant == 100 and pickup.Price > 0 then
        task.detailedTaskPart.signal = 1
        task.detailedTaskPart.subType = pickup.SubType
    end
end

local function BuyShopItem(task)
    if task.detailedTaskPart.signal == 1 and (not Bingo.player:IsItemQueueEmpty()) and
        Bingo.player.QueuedItem.Item.ID == task.detailedTaskPart.subType then
        task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
    end
    task.detailedTaskPart.signal = 0
    task.detailedTaskPart.subType = 0
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task88()
    local obj = {
        task = tasks_new(true, 88, taskDescriptionList[88]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_UPDATE] = {
            BuyShopItem
        },
        [ModCallbacks.MC_PRE_PICKUP_COLLISION] = {
            task88Method
        }
    }
    obj.detailedTaskPart.signal = 0
    obj.detailedTaskPart.subType = 0
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 5
    return obj
end

-- 任务91: 对怪物累计造成5000点伤害
local function task91Method(task, entity, amount)
    if entity:IsActiveEnemy() then
        task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + amount
    end
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task91()
    local obj = {
        task = tasks_new(true, 91, taskDescriptionList[91]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_ENTITY_TAKE_DMG] = {
            task91Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 5000
    return obj
end

-- 任务92: 累计杀死200只怪物
local function task92Method(task, entity)
    if entity:IsActiveEnemy(true) then
        task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
    end
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task92()
    local obj = {
        task = tasks_new(true, 92, taskDescriptionList[92]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_POST_ENTITY_KILL] = {
            task92Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 200
    return obj
end

-- 任务94: 累计使用主动15次
local function task94Method(task)
    task.detailedTaskPart.achieveCount = task.detailedTaskPart.achieveCount + 1
    checkTaskIfAchived(task)
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task94()
    local obj = {
        task = tasks_new(true, 94, taskDescriptionList[94]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_USE_ITEM] = {
            task94Method
        }
    }
    obj.detailedTaskPart.achieveCount = 0
    obj.detailedTaskPart.TARGET_NUM = 15
    return obj
end

-- 任务98: 只用非胎儿博士的炸弹或笑脸炸弹斩杀1个Boss
local function task98Method(task, entity, amount, _, source, _)
    if entity:IsBoss() and entity.HitPoints <= amount and source.Type == EntityType.ENTITY_BOMB then
        task.task.isAchieved = true
    end
    updateBingoMapConfigAndRemoveCallBack(task)
end

local function task98()
    local obj = {
        task = tasks_new(true, 98, taskDescriptionList[98]),
        detailedTaskPart = otherOption(),
        [ModCallbacks.MC_ENTITY_TAKE_DMG] = {
            task98Method
        }
    }
    return obj
end




function Bingo:isUseVoid()
    isUseVoidOrBlackRune.isUseVoid = true
end

function Bingo:isUseBlackRune()
    isUseVoidOrBlackRune.isUseBlackRune = true
end

return {
    task1 = task1,
    task2 = task2,
    task3 = task3,
    task4 = task4,
    task5 = task5,
    task6 = task6,
    task7 = task7,
    task8 = task8,
    task9 = task9,
    task10 = task10,
    task11 = task11,
    task12 = task12,
    task13 = task13,
    task14 = task14,
    task15 = task15,
    task16 = task16,
    task17 = task17,
    task18 = task18,
    task19 = task19,
    task20 = task20,
    task21 = task21,
    task22 = task22,
    task23 = task23,
    task24 = task24,
    task25 = task25,
    task26 = task26,
    task27 = task27,
    task28 = task28,
    task29 = task29,
    task30 = task30,
    task31 = task31,
    task32 = task32,
    task33 = task33,
    task34 = task34,
    task35 = task35,
    task36 = task36,
    task37 = task37,
    task38 = task38,
    task39 = task39,
    task40 = task40,
    task41 = task41,
    task42 = task42,
    task43 = task43,
    task44 = task44,
    task45 = task45,
    task46 = task46,
    task47 = task47,
    task48 = task48,
    task49 = task49,
    task50 = task50,
    task51 = task51,
    task52 = task52,
    task53 = task53,
    task54 = task54,
    task55 = task55,
    task56 = task56,
    task57 = task57,
    task58 = task58,
    task59 = task59,
    task60 = task60,
    task61 = task61,
    task62 = task62,
    task63 = task63,
    task64 = task64,
    task65 = task65,
    task66 = task66,
    task67 = task67,
    task68 = task68,
    task69 = task69,
    task70 = task70,
    task71 = task71,
    task72 = task72,
    task73 = task73,
    task74 = task74,
    task75 = task75,
    task76 = task76,
    task77 = task77,
    task78 = task78,
    task79 = task79,
    task80 = task80,
    task81 = task81,
    task82 = task82,
    task83 = task83,
    task84 = task84,
    task85 = task85,
    task86 = task86,
    task87 = task87,
    task88 = task88,
    task89 = task89,
    task90 = task90,
    task91 = task91,
    task92 = task92,
    task93 = task93,
    task94 = task94,
    task95 = task95,
    task96 = task96,
    task97 = task97,
    task98 = task98,
    task99 = task99,
    task100 = task100,
    conflictCharacter,
    setTaskForCallback = setTaskForCallback,
    achieveSound = achieveSound
}
