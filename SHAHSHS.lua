-- haimiya script --
gg.alert("\n                       Nari¸")

-- damage mm 1 hit --
function damageBooster()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 30000
    local new_value_HP = default_HP
    local new_value_ATK = default_ATK

    local mode = gg.alert("DAMAGE BOOSTER   ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Aktifkan Di Dalam Pertandingan, Tunggu Sampai Script 100% Aktif Agar Tidak Terjadi BUG,", "[OTOMATIS", "MANUAL")
    if not mode then return end

    -- Pilih Hero
    if menu == 1 then 
    local heroStats = {
        [" Layla"] = {HP = 2320, ATK = 133, DEF = 17, MDEF = 15, SPD = 250},
        [" Miya"] = {HP = 2320, ATK = 115, DEF = 17, MDEF = 15, SPD = 250},
        [" Clint"] = {HP = 2260, ATK = 120, DEF = 16, MDEF = 15, SPD = 245},
        [" Irithel"] = {HP = 2260, ATK = 125, DEF = 16, MDEF = 15, SPD = 260},
       [" Granger"] = {HP = 2260, ATK = 116,DEF = 15, MDEF = 15, SPD = 240},
       [" Moskov"] = {HP = 2380, ATK = 125, DEF = 18, MDEF = 15, SPD = 240},
       [" Karrie"] = {HP = 2320, ATK = 120, DEF = 17, MDEF = 15, SPD = 240},
       [" Hanabi"] = {HP = 2260, ATK = 111,
  DEF = 17, MDEF = 15, SPD = 245},
       [" Natan"] = {HP = 2260, ATK = 107,
  DEF = 16, MDEF = 15, SPD = 245},
       [" Melissa"] = {HP = 2320, ATK = 123,
  DEF = 17, MDEF = 15, SPD = 240},
       [" Claude"] = {HP = 2380, ATK = 100,
  DEF = 18, MDEF = 15, SPD = 240},
       [" Kimmy"] = {HP = 2380, ATK = 100,
  DEF = 17, MDEF = 15, SPD = 245},
       [" Ixia"] = {HP = 2260, ATK = 100,
  DEF = 16, MDEF = 15, SPD = 250},
       [" Edith"] = {HP = 2440, ATK = 110,
  DEF = 17, MDEF = 15, SPD = 255},
      [" Roger"] = {HP = 2530, ATK = 128,
  DEF = 22, MDEF = 15, SPD = 240},
       [" Obsidia"] = {HP = 2320, ATK = 120,
  DEF = 17, MDEF = 15, SPD = 240},
       [" Bruno"] = {HP = 2320, ATK = 145,
  DEF = 17, MDEF = 15, SPD = 245},
      [" Beatrix"] = {HP = 2380, ATK = 115,
  DEF = 18, MDEF = 15, SPD = 245},
       [" Wanwan"] = {HP = 2320, ATK = 110,
  DEF = 17, MDEF = 15, SPD = 240},
      [" Brody"] = {HP = 2260, ATK = 105,
  DEF = 16, MDEF = 15, SPD = 250},
     [" Popol & Kupa"] = {HP = 2260, ATK = 100,  DEF = 16, MDEF = 15, SPD = 250},
       [" Lesley"] = {HP = 2260, ATK = 145,
  DEF = 15, MDEF = 15, SPD = 240},
   [" Yi Sun-Shin"] = {HP = 2320, ATK = 110,
  DEF = 22, MDEF = 10, SPD = 250},
    }

    local heroList = {}
    for hero, _ in pairs(heroStats) do
        table.insert(heroList, hero)
    end
    table.sort(heroList)

    local choice = gg.choice(heroList, nil,"PILIH HERO :   (¸ YT : HAIMIYA SCRIPT  ¸)")
    if not choice then return end

    local selectedHero = heroList[choice]
    local stats = heroStats[selectedHero]


    -- Custom
    if mode == 2 then
    local input = gg.prompt(
        {"Masukkan HP", "Masukkan ATK"},
        {stats.HP, stats.ATK},
        {"number", "number"}
    )
    if not input then return end
    new_value_HP = tonumber(input[1]) or stats.HP
    new_value_ATK = tonumber(input[2]) or stats.ATK
    else
        new_value_HP = default_HP
        new_value_ATK = default_ATK
    end

    -- scan HP
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_HP, gg.TYPE_DWORD)
    gg.clearResults()

    -- Scan ulang dengan nilai HP yang telah diubah
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", new_value_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_ATK, gg.TYPE_DWORD)
    gg.clearResults()


    gg.toast("CHEAT DAMAGE AKTIF !")
end
end

-- damage 1 hit fighter --
function damageFighter()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 123465
    local new_value_HP = default_HP
    local new_value_ATK = default_ATK

    local mode = gg.alert("DAMAGE BOOSTER   ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Aktifkan Di Dalam Pertandingan, Tunggu Sampai Script 100% Aktif Agar Tidak Terjadi BUG,", "[OTOMATIS]", "[MANUAL")
    if not mode then return end

    -- Pilih Hero
    if menu == 1 then 
    local heroStats2 = {
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
        [" Suyou"] = {HP = 2390, ATK = 124,
  DEF = 16, MDEF = 15, SPD = 225},
       [" Julian"] = {HP = 2700, ATK = 128,
  DEF = 24, MDEF = 15, SPD = 262},
       [" Cici"] = {HP = 2431, ATK = 129,
  DEF = 23, MDEF = 15, SPD = 250},
       [" Freya"] = {HP = 2550, ATK = 120,
  DEF = 22, MDEF = 15, SPD = 260},
       [" Lukas"] = {HP = 2550, ATK = 119,
  DEF = 21, MDEF = 15, SPD = 260},
        [" Thamuz"] = {HP = 2580, ATK = 107,
  DEF = 17, MDEF = 15, SPD = 250},
    }

    local heroList2 = {}
    for hero, _ in pairs(heroStats2) do
        table.insert(heroList2, hero)
    end
    table.sort(heroList2)

    local choice = gg.choice(heroList2, nil,"PILIH HERO :   ( ¸ YT : HAIMIYA SCRIPT  ¸)")
    if not choice then return end

    local selectedHero = heroList2[choice]
    local stats = heroStats2[selectedHero]


    -- Custom
    if mode == 2 then
    local input = gg.prompt(
        {"Masukkan HP", "Masukkan ATK"},
        {stats.HP, stats.ATK},
        {"number", "number"}
    )
    if not input then return end
    new_value_HP = tonumber(input[1]) or stats.HP
    new_value_ATK = tonumber(input[2]) or stats.ATK
    else
        new_value_HP = default_HP
        new_value_ATK = default_ATK
    end

    -- scan HP
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_HP, gg.TYPE_DWORD)
    gg.clearResults()

    -- Scan ulang dengan nilai HP yang telah diubah
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", new_value_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_ATK, gg.TYPE_DWORD)
    gg.clearResults()


    gg.toast("CHEAT DAMAGE AKTIF !")
end
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
        {name = " Yi Sun-shin", scan = "300;198;0;0;802;0;0"},
    }
    
    table.sort(heroes, function(a, b) return a.name < b.name end)
    
    local heroNames = {}
    for i, hero in ipairs(heroes) do
        table.insert(heroNames, hero.name)
    end
    
    local choice = gg.choice(heroNames, nil, "PILIH HERO :   ( ¸ YT : HAIMIYA SCRIPT  ¸)")
    if not choice then
        return
    end
    
    local selectedHero = heroes[choice]
    gg.toast("Scanning " .. selectedHero.name .. "...")

    -- Langkah 1: Scan awal
    gg.searchNumber(selectedHero.scan, gg.TYPE_DWORD)

    -- Langkah 2: Refine scan dengan menghapus angka 0
    local refinedScan = selectedHero.scan:gsub(";0", "") -- Hilangkan ";0"
    gg.refineNumber(refinedScan, gg.TYPE_DWORD)

    -- Langkah 3: Ambil hasil scan dan ubah value menjadi 0
    local results = gg.getResults(gg.getResultsCount())
    for i, v in ipairs(results) do
        v.value = 0
        v.freeze = false
    end
    
    gg.setValues(results)
    gg.toast("Attack Speed Active !")
    gg.clearResults()
end

-- damage assassin 1 hit --
function damageAssassin()
gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 123465
    local new_value_HP = default_HP
    local new_value_ATK = default_ATK

    local mode = gg.alert("DAMAGE BOOSTER   ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Aktifkan Di Dalam Pertandingan, Tunggu Sampai Script 100% Aktif Agar Tidak Terjadi BUG,", "[OTOMATIS â]", "[MANUAL âï¸]")
    if not mode then return end

    -- Pilih Hero
    if menu == 1 then 
    local heroStats3 = {
        [" Alucard"] = {HP = 2443, ATK = 123, DEF = 21, MDEF = 15, SPD = 260},
        [" Arlot"] = {HP = 2450, ATK = 120, DEF = 21, MDEF = 15, SPD = 260},
     [" Benedetta"] = {HP = 2410, ATK = 113, DEF = 18, MDEF = 15, SPD = 255},
        [" Saber"] = {HP = 2440, ATK = 118, DEF = 20, MDEF = 15, SPD = 260},
        [" Karina"] = {HP = 2474, ATK = 121, DEF = 20, MDEF = 15, SPD = 260},
        [" Zilong"] = {HP = 2511, ATK = 123, DEF = 25, MDEF = 15, SPD = 265},
      [" Natalia"] = {HP = 2480, ATK = 121,
  DEF = 18, MDEF = 15, SPD = 260},
       [" Ling"] = {HP = 2369, ATK = 125,
  DEF = 18, MDEF = 15, SPD = 260},
       [" Hayabusa"] = {HP = 2270, ATK = 117,
  DEF = 17, MDEF = 15, SPD = 260},
        [" Fanny"] = {HP = 2267, ATK = 126,
  DEF = 16, MDEF = 15, SPD = 265},
        [" Suyou"] = {HP = 2390, ATK = 124,
  DEF = 16, MDEF = 15, SPD = 225},
       [" Julian"] = {HP = 2700, ATK = 128,
  DEF = 24, MDEF = 15, SPD = 262},
       [" Aamon"] = {HP = 2455, ATK = 115,
  DEF = 19, MDEF = 15, SPD = 250},
       [" Mathilda"] = {HP = 2530, ATK = 120,
  DEF = 22, MDEF = 15, SPD = 252},
       [" Lesley"] = {HP = 2260, ATK = 145,
  DEF = 15, MDEF = 15, SPD = 240},
   [" Yi Sun-Shin"] = {HP = 2320, ATK = 110,
  DEF = 22, MDEF = 10, SPD = 250},
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
      [" Lancelot"] = {HP = 2390, ATK = 124, DEF = 16, MDEF = 15, SPD = 260},
    }

    local heroList3 = {}
    for hero, _ in pairs(heroStats3) do
        table.insert(heroList3, hero)
    end
    table.sort(heroList3)

    local choice = gg.choice(heroList3, nil,"PILIH HERO :   ( ¸ YT : HAIMIYA SCRIPT  ¸)")
    if not choice then return end

    local selectedHero = heroList3[choice]
    local stats = heroStats3[selectedHero]


    -- Custom
    if mode == 2 then
    local input = gg.prompt(
        {"Masukkan HP", "Masukkan ATK"},
        {stats.HP, stats.ATK},
        {"number", "number"}
    )
    if not input then return end
    new_value_HP = tonumber(input[1]) or stats.HP
    new_value_ATK = tonumber(input[2]) or stats.ATK
    else
        new_value_HP = default_HP
        new_value_ATK = default_ATK
    end

    -- scan HP
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_HP, gg.TYPE_DWORD)
    gg.clearResults()

    -- Scan ulang dengan nilai HP yang telah diubah
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", new_value_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_ATK, gg.TYPE_DWORD)
    gg.clearResults()


    gg.toast("CHEAT DAMAGE AKTIF !")
end
end

-- damage 1 hit mage --
function damageMage()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 123456
    local new_value_HP = default_HP
    local new_value_ATK = default_ATK

    local mode = gg.alert("DAMAGE BOOSTER   ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Aktifkan Di Dalam Pertandingan, Tunggu Sampai Script 100% Aktif Agar Tidak Terjadi BUG,", "[OTOMATIS â]", "[MANUAL âï¸]")
    if not mode then return end

    -- Pilih Hero
    if menu == 1 then 
    local heroStats4 = {
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
     [" Zetian"] = {HP = 2380, ATK = 95, DEF = 17, MDEF = 15, SPD = 240},
    }

    local heroList4 = {}
    for hero, _ in pairs(heroStats4) do
        table.insert(heroList4, hero)
    end
    table.sort(heroList4)

    local choice = gg.choice(heroList4, nil,"PILIH HERO :   ( ¸ YT : HAIMIYA SCRIPT  ¸)")
    if not choice then return end

    local selectedHero = heroList4[choice]
    local stats = heroStats4[selectedHero]


    -- Custom
    if mode == 2 then
    local input = gg.prompt(
        {"Masukkan HP", "Masukkan ATK"},
        {stats.HP, stats.ATK},
        {"number", "number"}
    )
    if not input then return end
    new_value_HP = tonumber(input[1]) or stats.HP
    new_value_ATK = tonumber(input[2]) or stats.ATK
    else
        new_value_HP = default_HP
        new_value_ATK = default_ATK
    end

    -- scan HP
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_HP, gg.TYPE_DWORD)
    gg.clearResults()

    -- Scan ulang dengan nilai HP yang telah diubah
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", new_value_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_ATK, gg.TYPE_DWORD)
    gg.clearResults()


    gg.toast("CHEAT DAMAGE AKTIF !")
end
end

-- damage 1 hit support --
function damageSupport()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local default_HP = 700000
    local default_ATK = 123456
    local new_value_HP = default_HP
    local new_value_ATK = default_ATK

    local mode = gg.alert("DAMAGE BOOSTER   ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Aktifkan Di Dalam Pertandingan, Tunggu Sampai Script 100% Aktif Agar Tidak Terjadi BUG,", "[OTOMATIS â]", "[MANUAL âï¸]")
    if not mode then return end

    -- Pilih Hero
    if menu == 1 then 
    local heroStats5 = {
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
      [" Marcel"] = {HP = 2740, ATK = 115, DEF = 25, MDEF = 15, SPD = 260},
    }

    local heroList5 = {}
    for hero, _ in pairs(heroStats5) do
        table.insert(heroList5, hero)
    end
    table.sort(heroList5)

    local choice = gg.choice(heroList5, nil,"PILIH HERO :   ( ¸ YT : HAIMIYA SCRIPT  ¸)")
    if not choice then return end

    local selectedHero = heroList5[choice]
    local stats = heroStats5[selectedHero]


    -- Custom
    if mode == 2 then
    local input = gg.prompt(
        {"Masukkan HP", "Masukkan ATK"},
        {stats.HP, stats.ATK},
        {"number", "number"}
    )
    if not input then return end
    new_value_HP = tonumber(input[1]) or stats.HP
    new_value_ATK = tonumber(input[2]) or stats.ATK
    else
        new_value_HP = default_HP
        new_value_ATK = default_ATK
    end

    -- scan HP
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", stats.HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.HP, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_HP, gg.TYPE_DWORD)
    gg.clearResults()

    -- Scan ulang dengan nilai HP yang telah diubah
    gg.searchNumber(string.format("%d;%d;%d;%d;%d", new_value_HP, stats.ATK, stats.DEF, stats.MDEF, stats.SPD), gg.TYPE_DWORD)
    gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
    gg.getResults(100)
    gg.editAll(new_value_ATK, gg.TYPE_DWORD)
    gg.clearResults()


    gg.toast("CHEAT DAMAGE AKTIF !")
end
end

function percepatwaktu()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local ikiwktue = {"---âª¼ ð 01:00", "---âª¼ ð 02:00", "---âª¼ ð 03:00", "---âª¼ ð 04:00", "---âª¼ ð 05:00", "---âª¼ ð 06:00", "---âª¼ ð 07:00", "---âª¼ ð 08:00", "---âª¼ ð 09:00", "---âª¼ ð 10:00", "---âª¼ ð 11:00", "---âª¼ ð 12:00", "---âª¼ ð 13:00", "---âª¼ ð 14:00", "---âª¼ ð 15:00", "---âª¼ ð 16:00", "---âª¼ ð 17:00", "---âª¼ ð 18:00", "---âª¼ ð 19:00", "---âª¼ ð 20:00", "---âª¼ ð 21:00", "---âª¼ ð 22:00", "---âª¼ ð 23:00", "---âª¼ ð 24:00", "---âª¼ ð 25:00", "---âª¼ ð 26:00", "---âª¼ ð 27:00", "---âª¼ ð 28:00", "---âª¼ ð 29:00", "---âª¼ ð 30:00", "---âª¼ ð 31:00", "---âª¼ ð 32:00", "---âª¼ ð 33:00", "---âª¼ ð 34:00", "---âª¼ ð 35:00", "---âª¼ ð 36:00", "---âª¼ ð 37:00", "---âª¼ ð 38:00", "---âª¼ ð 39:00", "---âª¼ ð 40:00", "---âª¼ ð 41:00", "---âª¼ ð 42:00", "---âª¼ ð 43:00", "---âª¼ ð 44:00", "---âª¼ ð 45:00", "---âª¼ ð 46:00", "---âª¼ ð 47:00", "---âª¼ ð 48:00", "---âª¼ ð 49:00", "---âª¼ ð 50:00", "---âª¼ ð 51:00", "---âª¼ ð 52:00", "---âª¼ ð 53:00", "---âª¼ ð 54:00", "---âª¼ ð 55:00", "---âª¼ ð 56:00", "---âª¼ ð 57:00", "---âª¼ ð 58:00", "---âª¼ ð 59:00", "---âª¼ ð 60:00"
    }
    local dutaTime = {
["---âª¼ ð 01:00"] = 60000,
["---âª¼ ð 02:00"] = 120000,
["---âª¼ ð 03:00"] = 180000,
["---âª¼ ð 04:00"] = 240000,
["---âª¼ ð 05:00"] = 300000,
["---âª¼ ð 06:00"] = 360000,
["---âª¼ ð 07:00"] = 420000,
["---âª¼ ð 08:00"] = 480000,
["---âª¼ ð 09:00"] = 540000,
["---âª¼ ð 10:00"] = 600000,
["---âª¼ ð 11:00"] = 660000,
["---âª¼ ð 12:00"] = 720000,
["---âª¼ ð 13:00"] = 780000,
["---âª¼ ð 14:00"] = 840000,
["---âª¼ ð 15:00"] = 900000,
["---âª¼ ð 16:00"] = 960000,
["---âª¼ ð 17:00"] = 1020000,
["---âª¼ ð 18:00"] = 1080000,
["---âª¼ ð 19:00"] = 1140000,
["---âª¼ ð 20:00"] = 1200000,
["---âª¼ ð 21:00"] = 1260000,
["---âª¼ ð 22:00"] = 1320000,
["---âª¼ ð 23:00"] = 1380000,
["---âª¼ ð 24:00"] = 1440000,
["---âª¼ ð 25:00"] = 1500000,
["---âª¼ ð 26:00"] = 1560000,
["---âª¼ ð 27:00"] = 1620000,
["---âª¼ ð 28:00"] = 1680000,
["---âª¼ ð 29:00"] = 1740000,
["---âª¼ ð 30:00"] = 1800000,
["---âª¼ ð 31:00"] = 1860000,
["---âª¼ ð 32:00"] = 1920000,
["---âª¼ ð 33:00"] = 1980000,
["---âª¼ ð 34:00"] = 2040000,
["---âª¼ ð 35:00"] = 2100000,
["---âª¼ ð 36:00"] = 2160000,
["---âª¼ ð 37:00"] = 2220000,
["---âª¼ ð 38:00"] = 2280000,
["---âª¼ ð 39:00"] = 2340000,
["---âª¼ ð 40:00"] = 2400000,
["---âª¼ ð 41:00"] = 2460000,
["---âª¼ ð 42:00"] = 2520000,
["---âª¼ ð 43:00"] = 2580000,
["---âª¼ ð 44:00"] = 2640000,
["---âª¼ ð 45:00"] = 2700000,
["---âª¼ ð 46:00"] = 2760000,
["---âª¼ ð 47:00"] = 2820000,
["---âª¼ ð 48:00"] = 2880000,
["---âª¼ ð 49:00"] = 2940000,
["---âª¼ ð 50:00"] = 3000000,
["---âª¼ ð 51:00"] = 3060000,
["---âª¼ ð 52:00"] = 3120000,
["---âª¼ ð 53:00"] = 3180000,
["---âª¼ ð 54:00"] = 3240000,
["---âª¼ ð 55:00"] = 3300000,
["---âª¼ ð 56:00"] = 3360000,
["---âª¼ ð 57:00"] = 3420000,
["---âª¼ ð 58:00"] = 3480000,
["---âª¼ ð 59:00"] = 3540000,
["---âª¼ ð 60:00"] = 3600000
    }

    local owalahjembot = gg.choice(ikiwktue, nil, "\nUBAH WAKTU DALAM PERMAINAN")
    if owalahjembot == nil then
        return
    end
    gg.searchNumber("30000;45000;1", gg.TYPE_DWORD)
    gg.refineNumber("30000", gg.TYPE_DWORD)
    local hasil = gg.getResults(10)
    if #hasil == 0 then
        gg.toast("Gagal, Coba Lagi")
        return
    end
    local save = {}
    for i, v in ipairs(hasil) do
        table.insert(save, {
            address = v.address - 0x8,
            flags = gg.TYPE_DWORD
        })
    end
    local BA1 = gg.getValues(save)
    gg.sleep(800) 
    local BA2 = gg.getValues(save)
    local target = nil
    for i = 1, #BA1 do
        if BA1[i].value ~= BA2[i].value then
            target = save[i]
            break
        end
    end
    if target == nil then
        gg.toast("Error")
        return
    end
    target.value = dutaTime[ikiwktue[owalahjembot]]
    target.name = "skipwaktu"
    gg.setValues({target})
    gg.addListItems({target})
    gg.sleep(200)
    gg.toast("Waktu diatur ke " .. ikiwktue[owalahjembot])
    gg.clearList()
    gg.clearResults()
end

function inicd()
  menu = gg.alert(" NO COOLDOWN SKILL & SPELL \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Matikan Fitur Anti Cooldown Sebelum End Game Agar Tidak Crash/Force Close Saat Selesai Pertandingan!!!", "[HIDUP â]", "[MATI â]")
    if menu == 1 then
    gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("0D;2098082D;2100252:9", gg.TYPE_DWORD)
gg.refineNumber("0", gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll("20,000,009", gg.TYPE_DWORD)
gg.clearResults()
gg.toast('NO COOLDOWN ENABLE â') 
gg.clearResults()
  end
  if menu == 2 then
gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("20,000,009D;2098082D;2100252:9", gg.TYPE_DWORD)
gg.getResults(9)
gg.refineNumber("20,000,009", gg.TYPE_DWORD)
gg.getResults(9)
gg.editAll("0", gg.TYPE_DWORD)
gg.clearResults()
gg.toast('NO COOLDOWN DISABLE â') 
gg.clearResults()
end
end
  
function kdainject()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)

    -- Variabel
    local i, kill, death, assist

    -- Pilihan Mode: Classic atau Ranked
    local mode = gg.choice({' Classic', ' Ranked'}, nil, 'KDA INJECT')
    if not mode then return end

    local isRanked = (mode == 2)

    -- Pilihan Tim
    local team = gg.choice({' Team', ' Enemy'}, nil, 'KDA INJECT')
    if not team then return end

    -- Pilihan Player
    local player_name = {'â Player 1', 'â Player 2', 'â Player 3', 'â Player 4', 'â Player 5'}
    local player_index = gg.choice(player_name, nil, 'KDA INJECT - Pilih Player')
    if not player_index then return end

    -- Menentukan nilai i berdasarkan mode dan tim
    local team_i_values, enemy_i_values
    if isRanked then
        team_i_values = {9, 7, 5, 3, 1}
        enemy_i_values = {10, 8, 6, 4, 2}
    else
        team_i_values = {10, 8, 6, 4, 2}
        enemy_i_values = {9, 7, 5, 3, 1}
    end

    if team == 1 then -- Tim
        i = team_i_values[player_index]
    elseif team == 2 then -- Musuh
        i = enemy_i_values[player_index]
    end

    -- Input Kill, Death, Assist
    local inputs = gg.prompt(
        {"Kill (angka)", "Death (angka)", "Assist (angka)"},
        {0, 0, 0},
        {"number", "number", "number"}
    )
    if not inputs then return end

    kill = tonumber(inputs[1])
    death = tonumber(inputs[2])
    assist = tonumber(inputs[3])

    -- Scan base address
    gg.clearResults()
    gg.searchNumber('601295421455;601295421580', gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
    gg.refineNumber('601295421455', gg.TYPE_QWORD)

    local results = gg.getResults(100)
    if #results < 10 then
        gg.alert("Data tidak ditemukan atau kurang dari 10 hasil.")
        return
    end

    local list_player = {}
    for j = #results - 9, #results do
        table.insert(list_player, results[j])
    end

    local base = list_player[i]
    if not base then
        gg.alert("Index i salah, tidak ada data.")
        return
    end

    local edits = {
        {address = base.address + 0x20, flags = gg.TYPE_DWORD, value = kill},
        {address = base.address + 0x24, flags = gg.TYPE_DWORD, value = death},
        {address = base.address + 0x34, flags = gg.TYPE_DWORD, value = assist}
    }

    gg.setValues(edits)
    gg.toast("KDA berhasil di-inject!")
    gg.clearList()
    gg.clearResults()
end

function minimize_script()
    gg.toast("Minimizing script")
    while true do
        if gg.isVisible(true) then
            gg.setVisible(false)
            break
        end
        gg.sleep(100)
    end
end

function suntikturet()
local a = gg.prompt({
    "---âª¼ Turret Ke-1 ð","---âª¼ Turret Ke-2 ð","---âª¼ Turret Ke-3 ð","---âª¼ Inti Turret ð"
  }, {
    "4500", "5700", "7300", "7900"
  }, {
     "number", "number", "number", "number"
  }) 
    if a == nil  then return
  end
 
  local b= a[1] +0 --[Set Psyhical Attack Hero]--
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("4500;5700;7300;7900", gg.TYPE_DWORD)
    gg.searchNumber("4500", gg.TYPE_DWORD) gg.getResults(200)
  gg.editAll(b, gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ð TURRET KE-1 SUCCESSFUL â")
  local bb= a[2] +0 --[Set Health Hero]--
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("15;5700;7300;7900", gg.TYPE_DWORD)
    gg.searchNumber("5700", gg.TYPE_DWORD) gg.getResults(200)
  gg.editAll(bb, gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ð TURRET KE-2 SUCCESSFUL â")
  local cc= a[3] +0 --[Set MovSpeed Hero]--
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("15;15;7300:7900", gg.TYPE_DWORD)
    gg.searchNumber("7300", gg.TYPE_DWORD) gg.getResults(200)
  gg.editAll(cc, gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ð TURRET KE-3 SUCCESSFUL â")
  local dd= a[3] +0 --[Set MovSpeed Hero]--
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("15;15;15;7900", gg.TYPE_DWORD)
    gg.searchNumber("7900", gg.TYPE_DWORD) gg.getResults(200)
  gg.editAll(dd, gg.TYPE_DWORD)
  gg.clearResults()
  gg.toast("ð INTI TURRET SUCCESSFUL â")
  end

function inispam()
  local menu = gg.alert("CHAT / RADIO INGAME NO COOLDOWN", "[HIDUP â]", "[MATI â]")
  if menu == 1 then
  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-4,389,320,786,825,969,664Q; 3,272,998,912Q; 5,000D :512", gg.TYPE_DWORD)
gg.refineNumber("5000", gg.TYPE_DWORD)
gg.getResults(3)
gg.editAll("68", gg.TYPE_DWORD)
gg.clearResults()
gg.toast('âSPAM CHAT HIDUPâ') 
gg.clearResults()
  end---Free Access By Nand
  if menu == 2 then
  gg.clearResults()
gg.setRanges(gg.REGION_ANONYMOUS)
gg.searchNumber("-4,389,320,786,825,969,664Q; 3,272,998,912Q; 68D :512", gg.TYPE_DWORD)
gg.getResults(3)
gg.refineNumber("68", gg.TYPE_DWORD)
gg.getResults(3)
gg.editAll("5000", gg.TYPE_DWORD)
gg.clearResults()
gg.toast('â SPAM CHAT MATI â') 
gg.clearResults()
  end
end

function drone_4()
  local menu = gg.alert("DRONE VIEW 1 \n\nMatikan Fitur Drone View Sebelum End Game Agar Tidak Crash/Force Close Saat Selesai Pertandingan!!!", "[HIDUP â]", "[MATI â]")
    if menu == 1 then
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "1089806008" then
      _NXS_4_.value = "1092616192"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1053839852" then
      _NXS_4_.value = "-1050620723"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "1089722122 " then
      _NXS_4_.value = "1092584735"
      _NXS_4_.freeze = true
    end
  end
  gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "-1057677640" then
      _NXS_4_.value = "-1092616192"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1057761526" then
      _NXS_4_.value = "-1050620723"
      _NXS_4_.freeze = true
    end
  end
    gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.setVisible(false)
  gg.toast("Drone View 1 Active !")
  Qjctx = -1
end

    if menu == 2 then
   gg.clearResults()
   gg.setRanges(gg.REGION_ANONYMOUS )
   gg.searchNumber('1092616192;-1050620723;1092584735', gg.TYPE_DWORD)
   gg.searchNumber('1092616192', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089806008', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1050620723;1092584735', gg.TYPE_DWORD)
   gg.searchNumber('-1050620723', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('-1053839852', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1053839852;1092584735', gg.TYPE_DWORD)
   gg.searchNumber('1092584735', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089722122', gg.TYPE_DWORD) gg.clearResults()
gg.searchNumber('-1092616192;-1050620723;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1092616192', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057677640', gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber('-1053577640;-1050620723;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1050620723', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057761526', gg.TYPE_DWORD)
gg.toast('Drone View 1 Disable !')
gg.clearResults()
end 
end

  -- drone view by haimiya script --
    function drone_8()
     local menu = gg.alert("DRONE VIEW 2 \n\nMatikan Fitur Drone View Sebelum End Game Agar Tidak Crash/Force Close Saat Selesai Pertandingan!!!", "[HIDUP â]", "[MATI â]")
    if menu == 1 then
    gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "1089806008" then
      _NXS_4_.value = "1094506008"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1053839852" then
      _NXS_4_.value = "-1048839852"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "1089722122" then
      _NXS_4_.value = "1094522122"
      _NXS_4_.freeze = true
    end
  end
  gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "-1057677640" then
      _NXS_4_.value = "-1053577640"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1057761526" then
      _NXS_4_.value = "-1054071526"
      _NXS_4_.freeze = true
    end
  end
    gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.setVisible(false)
  gg.toast("Drone View 2 Active !")
  Qjctx = -1
end
  
  if menu == 2 then
   gg.clearResults()
   gg.setRanges(gg.REGION_ANONYMOUS )
   gg.searchNumber('1094506008;-1048839852;1094522122', gg.TYPE_DWORD)
   gg.searchNumber('1094506008', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089806008', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1048839852;1094522122', gg.TYPE_DWORD)
   gg.searchNumber('-1048839852', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('-1053839852', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1053839852;1094522122', gg.TYPE_DWORD)
   gg.searchNumber('1094522122', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089722122', gg.TYPE_DWORD) gg.clearResults()
gg.searchNumber('-1053577640;-1054071526;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1053577640', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057677640', gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber('-1053577640;-1054071526;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1054071526', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057761526', gg.TYPE_DWORD)
gg.toast('Drone View 2 Disable !')
gg.clearResults()
end 
end
   
   function drone_10()
   local menu = gg.alert("DRONE VIEW 3 \n\nMatikan Fitur Drone View Sebelum End Game Agar Tidak Crash/Force Close Saat Selesai Pertandingan!!!", "[HIDUP â]", "[MATI â]")
    if menu == 1 then
    gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "1089806008" then
      _NXS_4_.value = "1097649357"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1053839852" then
      _NXS_4_.value = "-1045902131"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "1089722122" then
      _NXS_4_.value = "1097607414"
      _NXS_4_.freeze = true
    end
  end
  gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "-1057677640" then
      _NXS_4_.value = "-1049834291"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1057761526" then
      _NXS_4_.value = "-1049876234"
      _NXS_4_.freeze = true
    end
  end
    gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.setVisible(false)
  gg.toast("Drone View 3 Active !")
  Qjctx = -1
end

  if menu == 2 then
  gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS )
 gg.searchNumber('1097649357;-1045902131;1097607414', gg.TYPE_DWORD)
 gg.searchNumber('1097649357', gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll('1089806008', gg.TYPE_DWORD)
 gg.clearResults()
 gg.searchNumber('1089806008;-1045902131;1097607414', gg.TYPE_DWORD)
 gg.searchNumber('-1045902131', gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll('-1053839852', gg.TYPE_DWORD)
 gg.clearResults()
 gg.searchNumber('1089806008;-1053839852;1097607414', gg.TYPE_DWORD)
 gg.searchNumber('1097607414', gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll('1089722122', gg.TYPE_DWORD)
 gg.clearResults() gg.searchNumber('-1049834291;-1049876234;1110143140', gg.TYPE_DWORD)
 gg.searchNumber('-1049834291', gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll('-1057677640', gg.TYPE_DWORD)
 gg.clearResults() 
 gg.searchNumber('-1049834291;-1049876234;1110143140', gg.TYPE_DWORD)
 gg.searchNumber('-1049876234', gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll('-1057761526', gg.TYPE_DWORD)
 gg.toast('Drone View 3 Disable !')
 gg.clearResults()
 end
 end
 
    function drone_12()
    local menu = gg.alert("DRONE VIEW 4 \n\nMatikan Fitur Drone View Sebelum End Game Agar Tidak Crash/Force Close Saat Selesai Pertandingan!!!", "[HIDUP â]", "[MATI â]")
    if menu == 1 then 
    gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "1089806008" then
      _NXS_4_.value = "1099206008"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1053839852" then
      _NXS_4_.value = "-1043839852"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "1089722122" then
      _NXS_4_.value = "1099322122"
      _NXS_4_.freeze = true
    end
  end
  gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "-1057677640" then
      _NXS_4_.value = "-1047962617"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1057761526" then
      _NXS_4_.value = "-1043583296"
      _NXS_4_.freeze = true
    end
  end
    gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.setVisible(false)
  gg.toast("Drone View 4 Active !")
  Qjctx = -1
end

    if menu == 2 then
   gg.clearResults()
   gg.setRanges(gg.REGION_ANONYMOUS )
   gg.searchNumber('1099206008;-1043839852;1099322122', gg.TYPE_DWORD)
   gg.searchNumber('1099206008', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089806008', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1043839852;1099322122', gg.TYPE_DWORD)
   gg.searchNumber('-1043839852', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('-1053839852', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1053839852;1099322122', gg.TYPE_DWORD)
   gg.searchNumber('1099322122', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089722122', gg.TYPE_DWORD) gg.clearResults()
gg.searchNumber('-1047962617;-1043583296;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1047962617', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057677640', gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber('-1053577640;-1043583296;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1043583296', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057761526', gg.TYPE_DWORD)
gg.toast('Drone View 4 Disable !')
gg.clearResults()
end 
end
     
    function drone_14()
    local menu = gg.alert("DRONE VIEW 5 \n\nMatikan Fitur Drone View Sebelum End Game Agar Tidak Crash/Force Close Saat Selesai Pertandingan!!!", "[HIDUP â]", "[MATI â]")
    if menu == 1 then
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "1089806008" then
      _NXS_4_.value = "1101556008"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1053839852" then
      _NXS_4_.value = "-1041339852"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "1089722122" then
      _NXS_4_.value = "1101722122"
      _NXS_4_.freeze = true
    end
  end
  gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
  _UPVALUE2_ = gg.getResults(20)
  for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
    if _NXS_4_.value == "-1057677640" then
      _NXS_4_.value = "-1044219268"
      _NXS_4_.freeze = true
    end
    if _NXS_4_.value == "-1057761526" then
      _NXS_4_.value = "-1043583296"
      _NXS_4_.freeze = true
    end
  end
    gg.setValues(_UPVALUE2_)
  _UPVALUE2_ = nil
  gg.clearResults()
  gg.setVisible(false)
  gg.toast("Drone View 5 Active !")
  Qjctx = -1
end

    if menu == 2 then
   gg.clearResults()
   gg.setRanges(gg.REGION_ANONYMOUS )
   gg.searchNumber('1101556008;-1041339852;1101722122', gg.TYPE_DWORD)
   gg.searchNumber('1101556008', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089806008', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1041339852;1101722122', gg.TYPE_DWORD)
   gg.searchNumber('-1041339852', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('-1053839852', gg.TYPE_DWORD) gg.clearResults()
   gg.searchNumber('1089806008;-1053839852;1101722122', gg.TYPE_DWORD)
   gg.searchNumber('1101722122', gg.TYPE_DWORD)
   gg.getResults(100)
   gg.editAll('1089722122', gg.TYPE_DWORD) gg.clearResults()
gg.searchNumber('-1044219268;-1043583296;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1044219268', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057677640', gg.TYPE_DWORD)
gg.clearResults()
gg.searchNumber('-1053577640;-1043583296;1110143140', gg.TYPE_DWORD)
gg.searchNumber('-1043583296', gg.TYPE_DWORD)
gg.getResults(100)
gg.editAll('-1057761526', gg.TYPE_DWORD)
gg.toast('Drone View 5 Disable !')
gg.clearResults()
end 
end

-- damage fitur --
function citdamage()
  local menu = gg.choice({ 
    "MARKSMAN",
    "FIGHTER",    
    "ASSASSIN",
    "MAGE",
    "SUPPORT",
    "EXIT",
    
    }, {}, os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n         ¸ HAIMIYA SCRIPT MENU  ¸\n-----------------------------'))  
    if menu == 1 then
        damageBooster()
         --gg.toast("ð LOCKED")
        end
    if menu == 2 then
        damageFighter()
         --gg.toast("ð LOCKED")
        end
    if menu == 3 then
        damageAssassin()
        --gg.toast("ð LOCKED")
        end
    if menu == 4 then
        damageMage()
        --gg.toast("ð LOCKED")
        end
    if menu == 5 then
    damageSupport()
       --gg.toast("ð LOCKED")
        end
    if menu == 6 then
        START()
        end
    if menu == nill  then
    
  end
  BG = -1
  end
  
-- drone view fitur --
function droneview()
 local menu = gg.choice({ 
    "DRONE VIEW 1",
    "DRONE VIEW 2",    
    "DRONE VIEW 3", 
    "DRONE VIEW 4",
    "DRONE VIEW 5",
    "EXIT",
    
  }, {}, os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n          ¸ HAIMIYA DRONE VIEW  ¸\n-----------------------------'))  
    if menu == 1 then
        drone_4()
        end
    if menu == 2 then
        drone_8()
        end
    if menu == 3 then
        drone_10()
        end
    if menu == 4 then
        drone_12()
        end
    if menu == 5 then
        drone_14()
        end
    if menu == 6 then
        START()
        end
    if menu == nill  then
    
  end
  BG = -2
  end
  
-- FITUR --
function START()
  menu = gg.choice({ 
    "DAMAGE BOOSTER",
    "DRONE VIEW",
    "ATTACK SPEED", 
    "SKILL NO COOLDOWN",
    "CHAT NO COOLDOWN",
    "PERCEPAT WAKTU",
    "SUNTIK TURRET",
    "SUNTIK KDA",
    "EXIT",
    
  }, {}, os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n         ¸ HAIMIYA SCRIPT MENU  ¸\n-----------------------------'))  
    if menu == 1 then
        citdamage()
        end
        --gg.toast("ð LOCKED")
    if menu == 2 then
        droneview()
        end
        --gg.toast("ð LOCKED")
    if menu == 8 then
        kdainject()
        end
    if menu == 3 then
        attackspeed()
        end
    if menu == 4 then
        inicd()
        end
    if menu == 6 then
        percepatwaktu()
        end
    if menu == 7 then
       suntikturet()
       end
     if menu == 5 then
        inispam()
        end
    if menu == 9 then
        Haimiyasai()
        end
    if menu == nill  then
    
  end
  BG = -1
  end
  
  function Haimiyasai()
  menu = gg.alert("SUDAH SUBSCRIBE HAIMIYA SCRIPT ?\n", "[SUDAH]", "[BELUM]")
  if menu == 1 then
    gg.toast("Terimakasih")
        print("Script dinonaktifkan, Silahkan aktifkan kembali untuk menggunakannya!")
    os.exit()
  end
  if menu == 2 then
  gg.toast("SUBSCRIBE DULU DONG :'(")
  end
end

while true do
  if gg.isVisible(true) then
    BG = 1
    gg.setVisible(false)
  end

  if BG == 1 then
    START()
  end
end