-- Haimiya Script Clean
gg.alert("Haimiya Script Aktif")

function damageBooster()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 60000
    local mode = gg.alert("DAMAGE BOOSTER\n\nNote: Team & Musuh harus Bot/AFK agar tidak Crash.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats = {
        [" Layla"] = {HP = 2320, ATK = 133, DEF = 17, MDEF = 15, SPD = 250},
        [" Miya"] = {HP = 2320, ATK = 115, DEF = 17, MDEF = 15, SPD = 250},
        [" Clint"] = {HP = 2260, ATK = 120, DEF = 16, MDEF = 15, SPD = 245},
        [" Irithel"] = {HP = 2260, ATK = 125, DEF = 16, MDEF = 15, SPD = 260},
        [" Granger"] = {HP = 2260, ATK = 116, DEF = 15, MDEF = 15, SPD = 240},
        [" Moskov"] = {HP = 2380, ATK = 125, DEF = 18, MDEF = 15, SPD = 240},
        [" Karrie"] = {HP = 2320, ATK = 120, DEF = 17, MDEF = 15, SPD = 240},
        [" Hanabi"] = {HP = 2260, ATK = 111, DEF = 17, MDEF = 15, SPD = 245},
        [" Natan"] = {HP = 2260, ATK = 107, DEF = 16, MDEF = 15, SPD = 245},
        [" Melissa"] = {HP = 2320, ATK = 123, DEF = 17, MDEF = 15, SPD = 240},
        [" Claude"] = {HP = 2380, ATK = 100, DEF = 18, MDEF = 15, SPD = 240},
        [" Kimmy"] = {HP = 2380, ATK = 100, DEF = 17, MDEF = 15, SPD = 245},
        [" Ixia"] = {HP = 2260, ATK = 100, DEF = 16, MDEF = 15, SPD = 250},
        [" Edith"] = {HP = 2440, ATK = 110, DEF = 17, MDEF = 15, SPD = 255},
        [" Roger"] = {HP = 2530, ATK = 128, DEF = 22, MDEF = 15, SPD = 240},
        [" Obsidia"] = {HP = 2320, ATK = 120, DEF = 17, MDEF = 15, SPD = 240},
        [" Bruno"] = {HP = 2320, ATK = 145, DEF = 17, MDEF = 15, SPD = 245},
        [" Beatrix"] = {HP = 2380, ATK = 115, DEF = 18, MDEF = 15, SPD = 245},
        [" Wanwan"] = {HP = 2320, ATK = 110, DEF = 17, MDEF = 15, SPD = 240},
        [" Brody"] = {HP = 2260, ATK = 105, DEF = 16, MDEF = 15, SPD = 250},
        [" Popol & Kupa"] = {HP = 2260, ATK = 100, DEF = 16, MDEF = 15, SPD = 250},
        [" Lesley"] = {HP = 2260, ATK = 145, DEF = 15, MDEF = 15, SPD = 240},
        [" Yi Sun-Shin"] = {HP = 2320, ATK = 110, DEF = 22, MDEF = 10, SPD = 250}
    }
    local heroList = {}
    for hero, _ in pairs(heroStats) do table.insert(heroList, hero) end
    table.sort(heroList)

    local choice = gg.choice(heroList, nil, "PILIH HERO :")
    if not choice then return end

    local stats = heroStats[heroList[choice]]
    local n_HP = default_HP
    local n_ATK = default_ATK

    if mode == 2 then
        local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
        if not input then return end
        n_HP = tonumber(input[1]) or stats.HP
        n_ATK = tonumber(input[2]) or stats.ATK
    end

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_HP, gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", n_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_ATK, gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF!")
end

function damageFighter()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 60000
    local mode = gg.alert("DAMAGE BOOSTER\n\nNote: Team & Musuh harus Bot/AFK.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats = {
        [" Alucard"] = {HP = 2443, ATK = 123, DEF = 21, MDEF = 15, SPD = 260},
        [" Arlot"] = {HP = 2450, ATK = 120, DEF = 21, MDEF = 15, SPD = 260},
        [" Bane"] = {HP = 2381, ATK = 117, DEF = 23, MDEF = 15, SPD = 260},
        [" Chou"] = {HP = 2530, ATK = 121, DEF = 23, MDEF = 15, SPD = 260},
        [" Alpha"] = {HP = 2468, ATK = 121, DEF = 25, MDEF = 15, SPD = 260},
        [" Ruby"] = {HP = 2331, ATK = 129, DEF = 18, MDEF = 10, SPD = 260},
        [" Balmond"] = {HP = 2558, ATK = 119, DEF = 25, MDEF = 15, SPD = 260},
        [" Hilda"] = {HP = 2680, ATK = 123, DEF = 24, MDEF = 15, SPD = 260},
        [" Lapu-Lapu"] = {HP = 2450, ATK = 119, DEF = 21, MDEF = 15, SPD = 260},
        [" Sun"] = {HP = 2500, ATK = 114, DEF = 23, MDEF = 15, SPD = 260},
        [" Roger"] = {HP = 2530, ATK = 128, DEF = 22, MDEF = 15, SPD = 240},
        [" Gatotkaca"] = {HP = 2520, ATK = 128, DEF = 10, MDEF = 15, SPD = 260},
        [" Grock"] = {HP = 2819, ATK = 135, DEF = 21, MDEF = 15, SPD = 260},
        [" Argus"] = {HP = 2450, ATK = 111, DEF = 21, MDEF = 15, SPD = 260},
        [" Jawhead"] = {HP = 2480, ATK = 119, DEF = 24, MDEF = 15, SPD = 255},
        [" Martis"] = {HP = 2560, ATK = 128, DEF = 25, MDEF = 15, SPD = 260},
        [" Kaja"] = {HP = 2431, ATK = 120, DEF = 25, MDEF = 15, SPD = 270},
        [" Aldous"] = {HP = 2490, ATK = 129, DEF = 21, MDEF = 15, SPD = 260},
        [" Leomord"] = {HP = 2560, ATK = 126, DEF = 21, MDEF = 15, SPD = 240},
        [" Minsitthar"] = {HP = 2520, ATK = 121, DEF = 23, MDEF = 15, SPD = 260},
        [" Badang"] = {HP = 2530, ATK = 111, DEF = 23, MDEF = 15, SPD = 255},
        [" Guinevere"] = {HP = 2350, ATK = 126, DEF = 18, MDEF = 15, SPD = 260},
        [" Terizla"] = {HP = 2619, ATK = 129, DEF = 19, MDEF = 15, SPD = 255},
        [" X.Borg"] = {HP = 917, ATK = 117, DEF = 25, MDEF = 15, SPD = 260},
        [" Dyrroth"] = {HP = 2580, ATK = 117, DEF = 22, MDEF = 15, SPD = 265},
        [" Marsha"] = {HP = 2000, ATK = 90, DEF = 15, MDEF = 15, SPD = 250},
        [" Silvanna"] = {HP = 2650, ATK = 126, DEF = 22, MDEF = 15, SPD = 255},
        [" Yu Zhong"] = {HP = 2520, ATK = 129, DEF = 21, MDEF = 15, SPD = 245},
        [" Benedetta"] = {HP = 2410, ATK = 113, DEF = 18, MDEF = 15, SPD = 255},
        [" Khaleed"] = {HP = 2600, ATK = 109, DEF = 23, MDEF = 15, SPD = 250},
        [" Barats"] = {HP = 2450, ATK = 135, DEF = 23, MDEF = 15, SPD = 268},
        [" Paquito"] = {HP = 2620, ATK = 121, DEF = 22, MDEF = 15, SPD = 260},
        [" Fredrinn"] = {HP = 2600, ATK = 125, DEF = 20, MDEF = 15, SPD = 260},
        [" Yin"] = {HP = 2400, ATK = 109, DEF = 21, MDEF = 15, SPD = 252},
        [" Aulus"] = {HP = 2500, ATK = 90, DEF = 20, MDEF = 15, SPD = 250},
        [" Phoveus"] = {HP = 2650, ATK = 132, DEF = 25, MDEF = 15, SPD = 252},
        [" Sora"] = {HP = 2800, ATK = 132, DEF = 25, MDEF = 15, SPD = 252},
        [" Kalea"] = {HP = 2500, ATK = 126, DEF = 18, MDEF = 15, SPD = 260},
        [" Zilong"] = {HP = 2511, ATK = 123, DEF = 25, MDEF = 15, SPD = 265},
        [" Suyou"] = {HP = 2390, ATK = 124, DEF = 16, MDEF = 15, SPD = 225},
        [" Julian"] = {HP = 2700, ATK = 128, DEF = 24, MDEF = 15, SPD = 262},
        [" Cici"] = {HP = 2431, ATK = 129, DEF = 23, MDEF = 15, SPD = 250},
        [" Freya"] = {HP = 2550, ATK = 120, DEF = 22, MDEF = 15, SPD = 260},
        [" Lukas"] = {HP = 2550, ATK = 119, DEF = 21, MDEF = 15, SPD = 260},
        [" Thamuz"] = {HP = 2580, ATK = 107, DEF = 17, MDEF = 15, SPD = 250}
    }
    local heroList = {}
    for hero, _ in pairs(heroStats) do table.insert(heroList, hero) end
    table.sort(heroList)

    local choice = gg.choice(heroList, nil, "PILIH HERO :")
    if not choice then return end

    local stats = heroStats[heroList[choice]]
    local n_HP = default_HP
    local n_ATK = default_ATK

    if mode == 2 then
        local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
        if not input then return end
        n_HP = tonumber(input[1]) or stats.HP
        n_ATK = tonumber(input[2]) or stats.ATK
    end

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_HP, gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", n_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_ATK, gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF!")
end

function damageAssassin()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 60000
    local mode = gg.alert("DAMAGE BOOSTER\n\nNote: Team & Musuh harus Bot/AFK.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats = {
        [" Alucard"] = {HP = 2443, ATK = 123, DEF = 21, MDEF = 15, SPD = 260},
        [" Arlot"] = {HP = 2450, ATK = 120, DEF = 21, MDEF = 15, SPD = 260},
        [" Benedetta"] = {HP = 2410, ATK = 113, DEF = 18, MDEF = 15, SPD = 255},
        [" Saber"] = {HP = 2440, ATK = 118, DEF = 20, MDEF = 15, SPD = 260},
        [" Karina"] = {HP = 2474, ATK = 121, DEF = 20, MDEF = 15, SPD = 260},
        [" Zilong"] = {HP = 2511, ATK = 123, DEF = 25, MDEF = 15, SPD = 265},
        [" Natalia"] = {HP = 2480, ATK = 121, DEF = 18, MDEF = 15, SPD = 260},
        [" Ling"] = {HP = 2369, ATK = 125, DEF = 18, MDEF = 15, SPD = 260},
        [" Hayabusa"] = {HP = 2270, ATK = 117, DEF = 17, MDEF = 15, SPD = 260},
        [" Fanny"] = {HP = 2267, ATK = 126, DEF = 16, MDEF = 15, SPD = 265},
        [" Suyou"] = {HP = 2390, ATK = 124, DEF = 16, MDEF = 15, SPD = 225},
        [" Julian"] = {HP = 2700, ATK = 128, DEF = 24, MDEF = 15, SPD = 262},
        [" Aamon"] = {HP = 2455, ATK = 115, DEF = 19, MDEF = 15, SPD = 250},
        [" Mathilda"] = {HP = 2530, ATK = 120, DEF = 22, MDEF = 15, SPD = 252},
        [" Lesley"] = {HP = 2260, ATK = 145, DEF = 15, MDEF = 15, SPD = 240},
        [" Yi Sun-Shin"] = {HP = 2320, ATK = 110, DEF = 22, MDEF = 10, SPD = 250},
        [" Sora"] = {HP = 2800, ATK = 132, DEF = 25, MDEF = 15, SPD = 252},
        [" Joy"] = {HP = 2519, ATK = 119, DEF = 20, MDEF = 15, SPD = 260},
        [" Paquito"] = {HP = 2620, ATK = 121, DEF = 22, MDEF = 15, SPD = 260},
        [" Yin"] = {HP = 2400, ATK = 109, DEF = 21, MDEF = 15, SPD = 252},
        [" Nolan"] = {HP = 2390, ATK = 124, DEF = 16, MDEF = 15, SPD = 260},
        [" Kadita"] = {HP = 2440, ATK = 105, DEF = 18, MDEF = 15, SPD = 250},
        [" Hanzo"] = {HP = 2594, ATK = 108, DEF = 17, MDEF = 15, SPD = 260},
        [" Selena"] = {HP = 2280, ATK = 110, DEF = 15, MDEF = 15, SPD = 240},
        [" Gusion"] = {HP = 2419, ATK = 119, DEF = 18, MDEF = 15, SPD = 260},
        [" Helcurt"] = {HP = 2440, ATK = 121, DEF = 17, MDEF = 15, SPD = 255},
        [" Harley"] = {HP = 2380, ATK = 114, DEF = 19, MDEF = 15, SPD = 240},
        [" Lancelot"] = {HP = 2390, ATK = 124, DEF = 16, MDEF = 15, SPD = 260}
    }
    local heroList = {}
    for hero, _ in pairs(heroStats) do table.insert(heroList, hero) end
    table.sort(heroList)

    local choice = gg.choice(heroList, nil, "PILIH HERO :")
    if not choice then return end

    local stats = heroStats[heroList[choice]]
    local n_HP = default_HP
    local n_ATK = default_ATK

    if mode == 2 then
        local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
        if not input then return end
        n_HP = tonumber(input[1]) or stats.HP
        n_ATK = tonumber(input[2]) or stats.ATK
    end

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_HP, gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", n_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_ATK, gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF!")
end

function damageMage()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 60000
    local mode = gg.alert("DAMAGE BOOSTER\n\nNote: Team & Musuh harus Bot/AFK.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats = {
        [" Aurora"] = {HP = 2380, ATK = 110, DEF = 17, MDEF = 15, SPD = 250},
        [" Vexana"] = {HP = 2380, ATK = 112, DEF = 17, MDEF = 15, SPD = 250},
        [" Odette"] = {HP = 2440, ATK = 105, DEF = 18, MDEF = 15, SPD = 250},
        [" Nana"] = {HP = 2380, ATK = 115, DEF = 17, MDEF = 15, SPD = 250},
        [" Vale"] = {HP = 2380, ATK = 115, DEF = 17, MDEF = 15, SPD = 250},
        [" Gord"] = {HP = 2380, ATK = 110, DEF = 17, MDEF = 15, SPD = 250},
        [" Alice"] = {HP = 2452, ATK = 114, DEF = 25, MDEF = 15, SPD = 240},
        [" Bane"] = {HP = 2381, ATK = 117, DEF = 23, MDEF = 15, SPD = 260},
        [" Eudora"] = {HP = 2440, ATK = 112, DEF = 18, MDEF = 15, SPD = 250},
        [" Kagura"] = {HP = 2380, ATK = 118, DEF = 17, MDEF = 15, SPD = 240},
        [" Cyclops"] = {HP = 2440, ATK = 112, DEF = 18, MDEF = 15, SPD = 240},
        [" Harley"] = {HP = 2380, ATK = 114, DEF = 19, MDEF = 15, SPD = 240},
        [" Zhask"] = {HP = 2380, ATK = 107, DEF = 17, MDEF = 15, SPD = 250},
        [" Pharsa"] = {HP = 2320, ATK = 109, DEF = 16, MDEF = 15, SPD = 240},
        [" Valir"] = {HP = 2380, ATK = 105, DEF = 17, MDEF = 15, SPD = 250},
        [" Chang'e"] = {HP = 2320, ATK = 115, DEF = 17, MDEF = 15, SPD = 240},
        [" Selena"] = {HP = 2380, ATK = 110, DEF = 15, MDEF = 15, SPD = 240},
        [" Lunox"] = {HP = 2440, ATK = 115, DEF = 18, MDEF = 15, SPD = 240},
        [" Kimmy"] = {HP = 2380, ATK = 100, DEF = 17, MDEF = 15, SPD = 245},
        [" Harith"] = {HP = 2260, ATK = 115, DEF = 17, MDEF = 15, SPD = 240},
        [" Faramis"] = {HP = 2500, ATK = 118, DEF = 20, MDEF = 15, SPD = 240},
        [" Esmeralda"] = {HP = 2464, ATK = 114, DEF = 21, MDEF = 15, SPD = 240},
        [" Kadita"] = {HP = 2440, ATK = 105, DEF = 18, MDEF = 15, SPD = 250},
        [" Lylia"] = {HP = 2380, ATK = 113, DEF = 17, MDEF = 15, SPD = 245},
        [" Cecilion"] = {HP = 2380, ATK = 105, DEF = 17, MDEF = 15, SPD = 250},
        [" Luo Yi"] = {HP = 2440, ATK = 107, DEF = 18, MDEF = 15, SPD = 250},
        [" Yve"] = {HP = 2320, ATK = 115, DEF = 16, MDEF = 15, SPD = 245},
        [" Valentina"] = {HP = 2500, ATK = 115, DEF = 20, MDEF = 15, SPD = 240},
        [" Xavier"] = {HP = 2380, ATK = 111, DEF = 17, MDEF = 15, SPD = 250},
        [" Novaria"] = {HP = 2260, ATK = 115, DEF = 15, MDEF = 15, SPD = 240},
        [" Zhuxin"] = {HP = 2440, ATK = 115, DEF = 18, MDEF = 15, SPD = 245},
        [" Zetian"] = {HP = 2380, ATK = 95, DEF = 17, MDEF = 15, SPD = 240}
    }
    local heroList = {}
    for hero, _ in pairs(heroStats) do table.insert(heroList, hero) end
    table.sort(heroList)

    local choice = gg.choice(heroList, nil, "PILIH HERO :")
    if not choice then return end

    local stats = heroStats[heroList[choice]]
    local n_HP = default_HP
    local n_ATK = default_ATK

    if mode == 2 then
        local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
        if not input then return end
        n_HP = tonumber(input[1]) or stats.HP
        n_ATK = tonumber(input[2]) or stats.ATK
    end

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_HP, gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", n_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_ATK, gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF!")
end

function damageSupport()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 60000
    local mode = gg.alert("DAMAGE BOOSTER\n\nNote: Team & Musuh harus Bot/AFK.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats = {
        [" Rafaela"] = {HP = 2320, ATK = 117, DEF = 15, MDEF = 15, SPD = 245},
        [" Minotaur"] = {HP = 2750, ATK = 123, DEF = 23, MDEF = 15, SPD = 260},
        [" Lolita"] = {HP = 2342, ATK = 115, DEF = 20, MDEF = 15, SPD = 260},
        [" Johnson"] = {HP = 2700, ATK = 120, DEF = 27, MDEF = 15, SPD = 255},
        [" Estes"] = {HP = 2221, ATK = 120, DEF = 13, MDEF = 15, SPD = 240},
        [" Diggie"] = {HP = 2347, ATK = 115, DEF = 20, MDEF = 15, SPD = 250},
        [" Angela"] = {HP = 2300, ATK = 115, DEF = 15, MDEF = 15, SPD = 240},
        [" Kaja"] = {HP = 2431, ATK = 120, DEF = 25, MDEF = 15, SPD = 270},
        [" Faramis"] = {HP = 2500, ATK = 118, DEF = 20, MDEF = 15, SPD = 240},
        [" Carmilla"] = {HP = 2419, ATK = 126, DEF = 25, MDEF = 15, SPD = 255},
        [" Mathilda"] = {HP = 2530, ATK = 120, DEF = 22, MDEF = 15, SPD = 252},
        [" Floryn"] = {HP = 2280, ATK = 119, DEF = 12, MDEF = 15, SPD = 240},
        [" Chip"] = {HP = 2481, ATK = 112, DEF = 20, MDEF = 15, SPD = 260},
        [" Kalea"] = {HP = 2500, ATK = 126, DEF = 18, MDEF = 15, SPD = 260},
        [" Marcel"] = {HP = 2740, ATK = 115, DEF = 25, MDEF = 15, SPD = 260}
    }
    local heroList = {}
    for hero, _ in pairs(heroStats) do table.insert(heroList, hero) end
    table.sort(heroList)

    local choice = gg.choice(heroList, nil, "PILIH HERO :")
    if not choice then return end

    local stats = heroStats[heroList[choice]]
    local n_HP = default_HP
    local n_ATK = default_ATK

    if mode == 2 then
        local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
        if not input then return end
        n_HP = tonumber(input[1]) or stats.HP
        n_ATK = tonumber(input[2]) or stats.ATK
    end

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_HP, gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", n_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(n_ATK, gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF!")
end

function attackspeed()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local heroes = {
        {name = " Kalea", scan = "1000;264;0;0;726;0;0"},
        {name = " Ling", scan = "1000;264;0;0;726;0;0"},
        {name = " Hayabusa", scan = "240;264;0;0;760;0;0"},
        {name = " Julian", scan = "100;264;0;0;736;0;0"},
        {name = " Balmond", scan = "1000;198;0;0;802;0;0"},
        {name = " Tigreal", scan = "600;330;0;0;736;0;0"},
        {name = " Argus", scan = "600;330;0;0;670;0;0"},
        {name = " Dyrroth", scan = "3000;330;0;0;736;0;0"},
        {name = " Natan", scan = "300;198;0;0;802;0;0"},
        {name = " Miya", scan = "100;264;0;0;736;0;0"},
        {name = " Clint", scan = "300;198;0;0;802;0;0"},
        {name = " Layla", scan = "100;264;0;0;2234;0;0"},
        {name = " Yi Sun-shin", scan = "300;198;0;0;802;0;0"}
    }
    table.sort(heroes, function(a, b) return a.name < b.name end)
    local heroNames = {}
    for i, hero in ipairs(heroes) do table.insert(heroNames, hero.name) end
    
    local choice = gg.choice(heroNames, nil, "PILIH HERO :")
    if not choice then return end
    
    local selectedHero = heroes[choice]
    gg.toast("Scanning " .. selectedHero.name .. "...")

    gg.searchNumber(selectedHero.scan, gg.TYPE_DWORD)
    local refinedScan = selectedHero.scan:gsub(";0", "")
    gg.refineNumber(refinedScan, gg.TYPE_DWORD)

    local results = gg.getResults(gg.getResultsCount())
    for i, v in ipairs(results) do
        v.value = 0
        v.freeze = false
    end
    
    gg.setValues(results)
    gg.toast("Attack Speed Active !")
    gg.clearResults()
end

function inicd()
    local menu = gg.alert("NO COOLDOWN SKILL & SPELL\n\nNote: Team & Musuh harus Bot/AFK.", "[HIDUP]", "[MATI]")
    if menu == 1 then
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("0D;2098082D;2100252:9", gg.TYPE_DWORD)
        gg.refineNumber("0", gg.TYPE_DWORD)
        gg.getResults(100)
        gg.editAll("20000009", gg.TYPE_DWORD)
        gg.clearResults()
        gg.toast('NO COOLDOWN ENABLE') 
    elseif menu == 2 then
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("20000009D;2098082D;2100252:9", gg.TYPE_DWORD)
        gg.getResults(9)
        gg.refineNumber("20000009", gg.TYPE_DWORD)
        gg.getResults(9)
        gg.editAll("0", gg.TYPE_DWORD)
        gg.clearResults()
        gg.toast('NO COOLDOWN DISABLE') 
    end
end

function kdainject()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)

    local mode = gg.choice({'Classic', 'Ranked'}, nil, 'KDA INJECT')
    if not mode then return end

    local team = gg.choice({'Team', 'Enemy'}, nil, 'KDA INJECT')
    if not team then return end

    local player_name = {'Player 1', 'Player 2', 'Player 3', 'Player 4', 'Player 5'}
    local player_index = gg.choice(player_name, nil, 'Pilih Player')
    if not player_index then return end

    -- INI YANG TADI ERROR, SUDAH DIPERBAIKI
    local team_vals, enemy_vals
    if mode == 2 then
        team_vals = {9, 7, 5, 3, 1}
        enemy_vals = {10, 8, 6, 4, 2}
    else
        team_vals = {10, 8, 6, 4, 2}
        enemy_vals = {9, 7, 5, 3, 1}
    end

    local i
    if team == 1 then
        i = team_vals[player_index]
    else
        i = enemy_vals[player_index]
    end

    local inputs = gg.prompt({"Kill", "Death", "Assist"}, {0, 0, 0}, {"number", "number", "number"})
    if not inputs then return end

    local kill = tonumber(inputs[1])
    local death = tonumber(inputs[2])
    local assist = tonumber(inputs[3])

    gg.searchNumber('601295421455;601295421580', gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('601295421455', gg.TYPE_QWORD)

    local results = gg.getResults(100)
    if #results < 10 then gg.alert("Data tidak ditemukan."); return end

    local base = results[#results - 10 + i]
    if not base then gg.alert("Index salah."); return end

    gg.setValues({
        {address = base.address + 0x20, flags = gg.TYPE_DWORD, value = kill},
        {address = base.address + 0x24, flags = gg.TYPE_DWORD, value = death},
        {address = base.address + 0x34, flags = gg.TYPE_DWORD, value = assist}
    })
    gg.toast("KDA Inject Sukses!")
    gg.clearResults()
end

function suntikturet()
    local a = gg.prompt({"Turret Ke-1", "Turret Ke-2", "Turret Ke-3", "Inti Turret"}, {"4500", "5700", "7300", "7900"}, {"number", "number", "number", "number"}) 
    if not a then return end

    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("4500;5700;7300;7900", gg.TYPE_DWORD)
    gg.searchNumber("4500", gg.TYPE_DWORD)
    gg.getResults(200)
    gg.editAll(a[1], gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("TURRET KE-1 SUCCESS")

    gg.searchNumber("15;5700;7300;7900", gg.TYPE_DWORD)
    gg.searchNumber("5700", gg.TYPE_DWORD)
    gg.getResults(200)
    gg.editAll(a[2], gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("TURRET KE-2 SUCCESS")

    gg.searchNumber("15;15;7300:7900", gg.TYPE_DWORD)
    gg.searchNumber("7300", gg.TYPE_DWORD)
    gg.getResults(200)
    gg.editAll(a[3], gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("TURRET KE-3 SUCCESS")

    gg.searchNumber("15;15;15;7900", gg.TYPE_DWORD)
    gg.searchNumber("7900", gg.TYPE_DWORD)
    gg.getResults(200)
    gg.editAll(a[4], gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("INTI TURRET SUCCESS")
end

function inispam()
    local menu = gg.alert("CHAT INGAME NO COOLDOWN", "[HIDUP]", "[MATI]")
    if menu == 1 then
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("-4389320786825969664Q;3272998912Q;5000D:512", gg.TYPE_DWORD)
        gg.refineNumber("5000", gg.TYPE_DWORD)
        gg.getResults(3)
        gg.editAll("68", gg.TYPE_DWORD)
        gg.clearResults()
        gg.toast('SPAM CHAT HIDUP') 
    elseif menu == 2 then
        gg.clearResults()
        gg.setRanges(gg.REGION_ANONYMOUS)
        gg.searchNumber("-4389320786825969664Q;3272998912Q;68D:512", gg.TYPE_DWORD)
        gg.getResults(3)
        gg.refineNumber("68", gg.TYPE_DWORD)
        gg.getResults(3)
        gg.editAll("5000", gg.TYPE_DWORD)
        gg.clearResults()
        gg.toast('SPAM CHAT MATI') 
    end
end

function applyDrone(v1, v2, v3, v4, v5)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
    local res = gg.getResults(20)
    for _, v in ipairs(res) do
        if v.value == 1089806008 then v.value = v1; v.freeze = true end
        if v.value == -1053839852 then v.value = v2; v.freeze = true end
        if v.value == 1089722122 then v.value = v3; v.freeze = true end
    end
    gg.setValues(res)
    gg.clearResults()

    gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
    res = gg.getResults(20)
    for _, v in ipairs(res) do
        if v.value == -1057677640 then v.value = v4; v.freeze = true end
        if v.value == -1057761526 then v.value = v5; v.freeze = true end
    end
    gg.setValues(res)
    gg.clearResults()
    gg.setVisible(false)
    gg.toast("Drone View Active!")
end

function resetDrone(v1, v2, v3, v4, v5)
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber(v1..';'..v2..';'..v3, gg.TYPE_DWORD)
    gg.searchNumber(v1, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll('1089806008', gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber('1089806008;'..v2..';'..v3, gg.TYPE_DWORD)
    gg.searchNumber(v2, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll('-1053839852', gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber('1089806008;-1053839852;'..v3, gg.TYPE_DWORD)
    gg.searchNumber(v3, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll('1089722122', gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber(v4..';'..v5..';1110143140', gg.TYPE_DWORD)
    gg.searchNumber(v4, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll('-1057677640', gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber('-1057677640;'..v5..';1110143140', gg.TYPE_DWORD)
    gg.searchNumber(v5, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll('-1057761526', gg.TYPE_DWORD)
    gg.clearResults()
    gg.toast("Drone View Disabled!")
end

function drone_4()
    local menu = gg.alert("DRONE VIEW 1", "[HIDUP]", "[MATI]")
    if menu == 1 then applyDrone(1092616192, -1050620723, 1092584735, -1092616192, -1050620723)
    elseif menu == 2 then resetDrone('1092616192', '-1050620723', '1092584735', '-1092616192', '-1050620723') end
end
function drone_8()
    local menu = gg.alert("DRONE VIEW 2", "[HIDUP]", "[MATI]")
    if menu == 1 then applyDrone(1094506008, -1048839852, 1094522122, -1053577640, -1054071526)
    elseif menu == 2 then resetDrone('1094506008', '-1048839852', '1094522122', '-1053577640', '-1054071526') end
end
function drone_10()
    local menu = gg.alert("DRONE VIEW 3", "[HIDUP]", "[MATI]")
    if menu == 1 then applyDrone(1097649357, -1045902131, 1097607414, -1049834291, -1049876234)
    elseif menu == 2 then resetDrone('1097649357', '-1045902131', '1097607414', '-1049834291', '-1049876234') end
end
function drone_12()
    local menu = gg.alert("DRONE VIEW 4", "[HIDUP]", "[MATI]")
    if menu == 1 then applyDrone(1099206008, -1043839852, 1099322122, -1047962617, -1043583296)
    elseif menu == 2 then resetDrone('1099206008', '-1043839852', '1099322122', '-1047962617', '-1043583296') end
end
function drone_14()
    local menu = gg.alert("DRONE VIEW 5", "[HIDUP]", "[MATI]")
    if menu == 1 then applyDrone(1101556008, -1041339852, 1101722122, -1044219268, -1043583296)
    elseif menu == 2 then resetDrone('1101556008', '-1041339852', '1101722122', '-1044219268', '-1043583296') end
end

function instantHero()
    gg.clearResults()
    local heroChoice = gg.choice({"Layla", "Bruno", "Bane"}, nil, "PILIH HERO INSTANT (700k HP, 60k ATK):")
    if not heroChoice then return end

    gg.setRanges(gg.REGION_ANONYMOUS)
    local new_HP = 700000
    local new_ATK = 60000

    local stats, heroName
    if heroChoice == 1 then stats = {HP = 2320, ATK = 133, DEF = 17, MDEF = 15, SPD = 250}; heroName = "LAYLA"
    elseif heroChoice == 2 then stats = {HP = 2320, ATK = 145, DEF = 17, MDEF = 15, SPD = 245}; heroName = "BRUNO"
    elseif heroChoice == 3 then stats = {HP = 2381, ATK = 117, DEF = 23, MDEF = 15, SPD = 260}; heroName = "BANE"
    end

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    if #gg.getResults(100) == 0 then gg.alert("Gagal menemukan hero!"); return end
    
    gg.editAll(new_HP, gg.TYPE_DWORD)
    gg.clearResults()

    gg.searchNumber(string.format("%d;%d;%d;%d;%d", new_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_ATK, gg.TYPE_DWORD)
    gg.clearResults()

    gg.toast("CHEAT DAMAGE 60K " .. heroName .. " AKTIF!")
end

function citdamage()
    local menu = gg.choice({"INSTANT LAYLA, BRUNO & BANE", "MARKSMAN", "FIGHTER", "ASSASSIN", "MAGE", "SUPPORT", "KEMBALI"}, nil, "MENU DAMAGE")  
    if menu == 1 then instantHero()
    elseif menu == 2 then damageBooster()
    elseif menu == 3 then damageFighter()
    elseif menu == 4 then damageAssassin()
    elseif menu == 5 then damageMage()
    elseif menu == 6 then damageSupport()
    elseif menu == 7 then START() end
    BG = -1
end
  
function droneview()
    local menu = gg.choice({"DRONE VIEW 1", "DRONE VIEW 2", "DRONE VIEW 3", "DRONE VIEW 4", "DRONE VIEW 5", "KEMBALI"}, nil, "MENU DRONE")  
    if menu == 1 then drone_4()
    elseif menu == 2 then drone_8()
    elseif menu == 3 then drone_10()
    elseif menu == 4 then drone_12()
    elseif menu == 5 then drone_14()
    elseif menu == 6 then START() end
    BG = -2
end
  
function START()
    local menu = gg.choice({"DAMAGE BOOSTER", "DRONE VIEW", "ATTACK SPEED", "SKILL NO COOLDOWN", "CHAT NO COOLDOWN", "SUNTIK TURRET", "SUNTIK KDA", "KELUAR"}, nil, "HAIMIYA SCRIPT MENU")  
    if menu == 1 then citdamage()
    elseif menu == 2 then droneview()
    elseif menu == 3 then attackspeed()
    elseif menu == 4 then inicd()
    elseif menu == 5 then inispam()
    elseif menu == 6 then suntikturet()
    elseif menu == 7 then kdainject()
    elseif menu == 8 then os.exit() end
    BG = -1
end

while true do
    if gg.isVisible(true) then
        BG = 1
        gg.setVisible(false)
    end
    if BG == 1 then START() end
    gg.sleep(100)
end
