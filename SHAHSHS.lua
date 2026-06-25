-- Nari script --
gg.alert("\n Nari*")

-- VARIABEL COUNTER (Menghitung berapa kali script jalan)
local RunCount = 0

-- =========================================================
-- FITUR SKIP WAKTU 6 MENIT (INSTANT)
-- =========================================================
function skipEnamMenit()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
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
    target.value = 360000 -- Nilai 6 menit
    target.name = "skipwaktu"
    gg.setValues({target})
    gg.addListItems({target})
    gg.sleep(200)
    gg.toast("Waktu diatur ke --->> 06:00")
    gg.clearList()
    gg.clearResults()
end

-- =========================================================
-- FITUR HERO SPESIAL (LAYLA, BRUNO, BANE) DI MENU UTAMA
-- =========================================================
function instantHero()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 
 local heroChoice = gg.choice({"LAYLA", "BRUNO", "BANE"}, nil, "PILIH HERO SPESIAL (HP 700K, ATK 60K)")
 if not heroChoice then return end
 
 local stats
 if heroChoice == 1 then stats = {HP = 2320, ATK = 133} -- Layla
 elseif heroChoice == 2 then stats = {HP = 2320, ATK = 145} -- Bruno
 elseif heroChoice == 3 then stats = {HP = 2381, ATK = 117} -- Bane
 end

 local new_HP = 700000
 local new_ATK = 60000

 -- EKSEKUSI 1: Scan dan Ubah HP
 gg.searchNumber(string.format("%d;%d", stats.HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.HP, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_HP, gg.TYPE_DWORD)
 gg.clearResults()

 -- EKSEKUSI 2: Scan dan Ubah ATK
 gg.searchNumber(string.format("%d;%d", new_HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_ATK, gg.TYPE_DWORD)
 gg.clearResults()

 gg.toast("CHEAT HERO SPESIAL AKTIF !")
end

-- =========================================================
-- DAMAGE BOOSTER STANDAR (HANYA HP & ATK)
-- =========================================================
function damageBooster()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 local default_HP = 700000
 local default_ATK = 60000
 local new_value_HP = default_HP
 local new_value_ATK = default_ATK

 local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Aktifkan Di Dalam Pertandingan, Tunggu Sampai Script 100% Aktif Agar Tidak Terjadi BUG,", "[OTOMATIS]", "[MANUAL]")
 if not mode then return end

 local heroStats = {
 [" Layla"] = {HP = 2320, ATK = 133},
 [" Miya"] = {HP = 2320, ATK = 115},
 [" Clint"] = {HP = 2260, ATK = 120},
 [" Irithel"] = {HP = 2260, ATK = 125},
 [" Granger"] = {HP = 2260, ATK = 116},
 [" Moskov"] = {HP = 2380, ATK = 125},
 [" Karrie"] = {HP = 2320, ATK = 120},
 [" Hanabi"] = {HP = 2260, ATK = 111},
 [" Natan"] = {HP = 2260, ATK = 107},
 [" Melissa"] = {HP = 2320, ATK = 123},
 [" Claude"] = {HP = 2380, ATK = 100},
 [" Kimmy"] = {HP = 2380, ATK = 100},
 [" Ixia"] = {HP = 2260, ATK = 100},
 [" Edith"] = {HP = 2440, ATK = 110},
 [" Roger"] = {HP = 2530, ATK = 128},
 [" Obsidia"] = {HP = 2320, ATK = 120},
 [" Bruno"] = {HP = 2320, ATK = 145},
 [" Beatrix"] = {HP = 2380, ATK = 115},
 [" Wanwan"] = {HP = 2320, ATK = 110},
 [" Brody"] = {HP = 2260, ATK = 105},
 [" Popol & Kupa"] = {HP = 2260, ATK = 100},
 [" Lesley"] = {HP = 2260, ATK = 145},
 [" Yi Sun-Shin"] = {HP = 2320, ATK = 110}
 }

 local heroList = {}
 for hero, _ in pairs(heroStats) do table.insert(heroList, hero) end
 table.sort(heroList)

 local choice = gg.choice(heroList, nil,"PILIH HERO : (* NARI SCRIPT *)")
 if not choice then return end

 local stats = heroStats[heroList[choice]]

 if mode == 2 then
 local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
 if not input then return end
 new_value_HP = tonumber(input[1]) or stats.HP
 new_value_ATK = tonumber(input[2]) or stats.ATK
 end

 -- HP
 gg.searchNumber(string.format("%d;%d", stats.HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.HP, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_HP, gg.TYPE_DWORD)
 gg.clearResults()

 -- ATK
 gg.searchNumber(string.format("%d;%d", new_value_HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_ATK, gg.TYPE_DWORD)
 gg.clearResults()

 gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE 1 HIT FIGHTER
-- =========================================================
function damageFighter()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 local default_HP = 700000
 local default_ATK = 60000
 local new_value_HP = default_HP
 local new_value_ATK = default_ATK

 local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
 if not mode then return end

 local heroStats2 = {
 [" Alucard"] = {HP = 2443, ATK = 123},
 [" Arlot"] = {HP = 2450, ATK = 120},
 [" Bane"] = {HP = 2381, ATK = 117},
 [" Chou"] = {HP = 2530, ATK = 121},
 [" Alpha"] = {HP = 2468, ATK = 121},
 [" Ruby"] = {HP = 2331, ATK = 129},
 [" Balmond"] = {HP = 2558, ATK = 119},
 [" Hilda"] = {HP = 2680, ATK = 123},
 [" Lapu-Lapu"] = {HP = 2450, ATK = 119},
 [" Sun"] = {HP = 2500, ATK = 114},
 [" Roger"] = {HP = 2530, ATK = 128},
 [" Gatotkaca"] = {HP = 2520, ATK = 128},
 [" Grock"] = {HP = 2819, ATK = 135},
 [" Argus"] = {HP = 2450, ATK = 111},
 [" Jawhead"] = {HP = 2480, ATK = 119},
 [" Martis"] = {HP = 2560, ATK = 128},
 [" Kaja"] = {HP = 2431, ATK = 120},
 [" Aldous"] = {HP = 2490, ATK = 129},
 [" Leomord"] = {HP = 2560, ATK = 126},
 [" Minsitthar"] = {HP = 2520, ATK = 121},
 [" Badang"] = {HP = 2530, ATK = 111},
 [" Guinevere"] = {HP = 2350, ATK = 126},
 [" Terizla"] = {HP = 2619, ATK = 129},
 [" X.Borg"] = {HP = 917, ATK = 117},
 [" Dyrroth"] = {HP = 2580, ATK = 117},
 [" Marsha"] = {HP = 2000, ATK = 90},
 [" Silvanna"] = {HP = 2650, ATK = 126},
 [" Yu Zhong"] = {HP = 2520, ATK = 129},
 [" Benedetta"] = {HP = 2410, ATK = 113},
 [" Khaleed"] = {HP = 2600, ATK = 109},
 [" Barats"] = {HP = 2450, ATK = 135},
 [" Paquito"] = {HP = 2620, ATK = 121},
 [" Fredrinn"] = {HP = 2600, ATK = 125},
 [" Yin"] = {HP = 2400, ATK = 109},
 [" Aulus"] = {HP = 2500, ATK = 90},
 [" Phoveus"] = {HP = 2650, ATK = 132},
 [" Sora"] = {HP = 2800, ATK = 132},
 [" Kalea"] = {HP = 2500, ATK = 126},
 [" Zilong"] = {HP = 2511, ATK = 123},
 [" Suyou"] = {HP = 2390, ATK = 124},
 [" Julian"] = {HP = 2700, ATK = 128},
 [" Cici"] = {HP = 2431, ATK = 129},
 [" Freya"] = {HP = 2550, ATK = 120},
 [" Lukas"] = {HP = 2550, ATK = 119},
 [" Thamuz"] = {HP = 2580, ATK = 107}
 }

 local heroList2 = {}
 for hero, _ in pairs(heroStats2) do table.insert(heroList2, hero) end
 table.sort(heroList2)

 local choice = gg.choice(heroList2, nil,"PILIH HERO : ( * NARI SCRIPT *)")
 if not choice then return end
 local stats = heroStats2[heroList2[choice]]

 if mode == 2 then
 local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
 if not input then return end
 new_value_HP = tonumber(input[1]) or stats.HP
 new_value_ATK = tonumber(input[2]) or stats.ATK
 end

 gg.searchNumber(string.format("%d;%d", stats.HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.HP, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_HP, gg.TYPE_DWORD)
 gg.clearResults()

 gg.searchNumber(string.format("%d;%d", new_value_HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_ATK, gg.TYPE_DWORD)
 gg.clearResults()

 gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE ASSASSIN 1 HIT
-- =========================================================
function damageAssassin()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 local default_HP = 700000
 local default_ATK = 60000
 local new_value_HP = default_HP
 local new_value_ATK = default_ATK

 local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
 if not mode then return end

 local heroStats3 = {
 [" Alucard"] = {HP = 2443, ATK = 123},
 [" Arlot"] = {HP = 2450, ATK = 120},
 [" Benedetta"] = {HP = 2410, ATK = 113},
 [" Saber"] = {HP = 2440, ATK = 118},
 [" Karina"] = {HP = 2474, ATK = 121},
 [" Zilong"] = {HP = 2511, ATK = 123},
 [" Natalia"] = {HP = 2480, ATK = 121},
 [" Ling"] = {HP = 2369, ATK = 125},
 [" Hayabusa"] = {HP = 2270, ATK = 117},
 [" Fanny"] = {HP = 2267, ATK = 126},
 [" Suyou"] = {HP = 2390, ATK = 124},
 [" Julian"] = {HP = 2700, ATK = 128},
 [" Aamon"] = {HP = 2455, ATK = 115},
 [" Mathilda"] = {HP = 2530, ATK = 120},
 [" Lesley"] = {HP = 2260, ATK = 145},
 [" Yi Sun-Shin"] = {HP = 2320, ATK = 110},
 [" Sora"] = {HP = 2800, ATK = 132},
 [" Joy"] = {HP = 2519, ATK = 119},
 [" Paquito"] = {HP = 2620, ATK = 121},
 [" Yin"] = {HP = 2400, ATK = 109},
 [" Nolan"] = {HP = 2390, ATK = 124},
 [" Kadita"] = {HP = 2440, ATK = 105},
 [" Hanzo"] = {HP = 2594, ATK = 108},
 [" Selena"] = {HP = 2280, ATK = 110},
 [" Gusion"] = {HP = 2419, ATK = 119},
 [" Helcurt"] = {HP = 2440, ATK = 121},
 [" Harley"] = {HP = 2380, ATK = 114},
 [" Lancelot"] = {HP = 2390, ATK = 124}
 }

 local heroList3 = {}
 for hero, _ in pairs(heroStats3) do table.insert(heroList3, hero) end
 table.sort(heroList3)

 local choice = gg.choice(heroList3, nil,"PILIH HERO : ( * NARI SCRIPT *)")
 if not choice then return end
 local stats = heroStats3[heroList3[choice]]

 if mode == 2 then
 local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
 if not input then return end
 new_value_HP = tonumber(input[1]) or stats.HP
 new_value_ATK = tonumber(input[2]) or stats.ATK
 end

 gg.searchNumber(string.format("%d;%d", stats.HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.HP, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_HP, gg.TYPE_DWORD)
 gg.clearResults()

 gg.searchNumber(string.format("%d;%d", new_value_HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_ATK, gg.TYPE_DWORD)
 gg.clearResults()

 gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE 1 HIT MAGE
-- =========================================================
function damageMage()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 local default_HP = 700000
 local default_ATK = 60000
 local new_value_HP = default_HP
 local new_value_ATK = default_ATK

 local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
 if not mode then return end

 local heroStats4 = {
 [" Aurora"] = {HP = 2380, ATK = 110},
 [" Vexana"] = {HP = 2380, ATK = 112},
 [" Odette"] = {HP = 2440, ATK = 105},
 [" Nana"] = {HP = 2380, ATK = 115},
 [" Vale"] = {HP = 2380, ATK = 115},
 [" Gord"] = {HP = 2380, ATK = 110},
 [" Alice"] = {HP = 2452, ATK = 114},
 [" Bane"] = {HP = 2381, ATK = 117},
 [" Eudora"] = {HP = 2440, ATK = 112},
 [" Kagura"] = {HP = 2380, ATK = 118},
 [" Cyclops"] = {HP = 2440, ATK = 112},
 [" Harley"] = {HP = 2380, ATK = 114},
 [" Zhask"] = {HP = 2380, ATK = 107},
 [" Pharsa"] = {HP = 2320, ATK = 109},
 [" Valir"] = {HP = 2380, ATK = 105},
 [" Chang'e"] = {HP = 2320, ATK = 115},
 [" Selena"] = {HP = 2380, ATK = 110},
 [" Lunox"] = {HP = 2440, ATK = 115},
 [" Kimmy"] = {HP = 2380, ATK = 100},
 [" Harith"] = {HP = 2260, ATK = 115},
 [" Faramis"] = {HP = 2500, ATK = 118},
 [" Esmeralda"] = {HP = 2464, ATK = 114},
 [" Kadita"] = {HP = 2440, ATK = 105},
 [" Lylia"] = {HP = 2380, ATK = 113},
 [" Cecilion"] = {HP = 2380, ATK = 105},
 [" Luo Yi"] = {HP = 2440, ATK = 107},
 [" Yve"] = {HP = 2320, ATK = 115},
 [" Valentina"] = {HP = 2500, ATK = 115},
 [" Xavier"] = {HP = 2380, ATK = 111},
 [" Novaria"] = {HP = 2260, ATK = 115},
 [" Zhuxin"] = {HP = 2440, ATK = 115},
 [" Zetian"] = {HP = 2380, ATK = 95}
 }

 local heroList4 = {}
 for hero, _ in pairs(heroStats4) do table.insert(heroList4, hero) end
 table.sort(heroList4)

 local choice = gg.choice(heroList4, nil,"PILIH HERO : ( * NARI SCRIPT *)")
 if not choice then return end
 local stats = heroStats4[heroList4[choice]]

 if mode == 2 then
 local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
 if not input then return end
 new_value_HP = tonumber(input[1]) or stats.HP
 new_value_ATK = tonumber(input[2]) or stats.ATK
 end

 gg.searchNumber(string.format("%d;%d", stats.HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.HP, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_HP, gg.TYPE_DWORD)
 gg.clearResults()

 gg.searchNumber(string.format("%d;%d", new_value_HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_ATK, gg.TYPE_DWORD)
 gg.clearResults()

 gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE 1 HIT SUPPORT
-- =========================================================
function damageSupport()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 local default_HP = 700000
 local default_ATK = 60000
 local new_value_HP = default_HP
 local new_value_ATK = default_ATK

 local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
 if not mode then return end

 local heroStats5 = {
 [" Rafaela"] = {HP = 2320, ATK = 117},
 [" Minotaur"] = {HP = 2750, ATK = 123},
 [" Lolita"] = {HP = 2342, ATK = 115},
 [" Johnson"] = {HP = 2700, ATK = 120},
 [" Estes"] = {HP = 2221, ATK = 120},
 [" Diggie"] = {HP = 2347, ATK = 115},
 [" Angela"] = {HP = 2300, ATK = 115},
 [" Kaja"] = {HP = 2431, ATK = 120},
 [" Faramis"] = {HP = 2500, ATK = 118},
 [" Carmilla"] = {HP = 2419, ATK = 126},
 [" Mathilda"] = {HP = 2530, ATK = 120},
 [" Floryn"] = {HP = 2280, ATK = 119},
 [" Chip"] = {HP = 2481, ATK = 112},
 [" Kalea"] = {HP = 2500, ATK = 126},
 [" Marcel"] = {HP = 2740, ATK = 115}
 }

 local heroList5 = {}
 for hero, _ in pairs(heroStats5) do table.insert(heroList5, hero) end
 table.sort(heroList5)

 local choice = gg.choice(heroList5, nil,"PILIH HERO : ( * NARI SCRIPT *)")
 if not choice then return end
 local stats = heroStats5[heroList5[choice]]

 if mode == 2 then
 local input = gg.prompt({"Masukkan HP", "Masukkan ATK"}, {stats.HP, stats.ATK}, {"number", "number"})
 if not input then return end
 new_value_HP = tonumber(input[1]) or stats.HP
 new_value_ATK = tonumber(input[2]) or stats.ATK
 end

 gg.searchNumber(string.format("%d;%d", stats.HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.HP, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_HP, gg.TYPE_DWORD)
 gg.clearResults()

 gg.searchNumber(string.format("%d;%d", new_value_HP, stats.ATK), gg.TYPE_DWORD)
 gg.refineNumber(stats.ATK, gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll(new_value_ATK, gg.TYPE_DWORD)
 gg.clearResults()

 gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- FITUR LAINNYA
-- =========================================================
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
 for i, hero in ipairs(heroes) do table.insert(heroNames, hero.name) end
 
 local choice = gg.choice(heroNames, nil, "PILIH HERO : ( * NARI SCRIPT *)")
 if not choice then return end
 
 local selectedHero = heroes[choice]
 gg.toast("Scanning " .. selectedHero.name .. "...")

 gg.searchNumber(selectedHero.scan, gg.TYPE_DWORD)
 local refinedScan = selectedHero.scan:gsub(";0", "")
 gg.refineNumber(refinedScan, gg.TYPE_DWORD)

 local results = gg.getResults(gg.getResultsCount())
 for i, v in ipairs(results) do v.value = 0; v.freeze = false end
 
 gg.setValues(results)
 gg.toast("Attack Speed Active !")
 gg.clearResults()
end

function percepatwaktu()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 local ikiwktue = {"--->> 01:00", "--->> 02:00", "--->> 03:00", "--->> 04:00", "--->> 05:00", "--->> 06:00", "--->> 07:00", "--->> 08:00", "--->> 09:00", "--->> 10:00", "--->> 11:00", "--->> 12:00", "--->> 13:00", "--->> 14:00", "--->> 15:00", "--->> 16:00", "--->> 17:00", "--->> 18:00", "--->> 19:00", "--->> 20:00", "--->> 21:00", "--->> 22:00", "--->> 23:00", "--->> 24:00", "--->> 25:00", "--->> 26:00", "--->> 27:00", "--->> 28:00", "--->> 29:00", "--->> 30:00", "--->> 31:00", "--->> 32:00", "--->> 33:00", "--->> 34:00", "--->> 35:00", "--->> 36:00", "--->> 37:00", "--->> 38:00", "--->> 39:00", "--->> 40:00", "--->> 41:00", "--->> 42:00", "--->> 43:00", "--->> 44:00", "--->> 45:00", "--->> 46:00", "--->> 47:00", "--->> 48:00", "--->> 49:00", "--->> 50:00", "--->> 51:00", "--->> 52:00", "--->> 53:00", "--->> 54:00", "--->> 55:00", "--->> 56:00", "--->> 57:00", "--->> 58:00", "--->> 59:00", "--->> 60:00"}
 local dutaTime = {
 ["--->> 01:00"] = 60000, ["--->> 02:00"] = 120000, ["--->> 03:00"] = 180000, ["--->> 04:00"] = 240000, ["--->> 05:00"] = 300000,
 ["--->> 06:00"] = 360000, ["--->> 07:00"] = 420000, ["--->> 08:00"] = 480000, ["--->> 09:00"] = 540000, ["--->> 10:00"] = 600000,
 ["--->> 11:00"] = 660000, ["--->> 12:00"] = 720000, ["--->> 13:00"] = 780000, ["--->> 14:00"] = 840000, ["--->> 15:00"] = 900000,
 ["--->> 16:00"] = 960000, ["--->> 17:00"] = 1020000, ["--->> 18:00"] = 1080000, ["--->> 19:00"] = 1140000, ["--->> 20:00"] = 1200000,
 ["--->> 21:00"] = 1260000, ["--->> 22:00"] = 1320000, ["--->> 23:00"] = 1380000, ["--->> 24:00"] = 1440000, ["--->> 25:00"] = 1500000,
 ["--->> 26:00"] = 1560000, ["--->> 27:00"] = 1620000, ["--->> 28:00"] = 1680000, ["--->> 29:00"] = 1740000, ["--->> 30:00"] = 1800000,
 ["--->> 31:00"] = 1860000, ["--->> 32:00"] = 1920000, ["--->> 33:00"] = 1980000, ["--->> 34:00"] = 2040000, ["--->> 35:00"] = 2100000,
 ["--->> 36:00"] = 2160000, ["--->> 37:00"] = 2220000, ["--->> 38:00"] = 2280000, ["--->> 39:00"] = 2340000, ["--->> 40:00"] = 2400000,
 ["--->> 41:00"] = 2460000, ["--->> 42:00"] = 2520000, ["--->> 43:00"] = 2580000, ["--->> 44:00"] = 2640000, ["--->> 45:00"] = 2700000,
 ["--->> 46:00"] = 2760000, ["--->> 47:00"] = 2820000, ["--->> 48:00"] = 2880000, ["--->> 49:00"] = 2940000, ["--->> 50:00"] = 3000000,
 ["--->> 51:00"] = 3060000, ["--->> 52:00"] = 3120000, ["--->> 53:00"] = 3180000, ["--->> 54:00"] = 3240000, ["--->> 55:00"] = 3300000,
 ["--->> 56:00"] = 3360000, ["--->> 57:00"] = 3420000, ["--->> 58:00"] = 3480000, ["--->> 59:00"] = 3540000, ["--->> 60:00"] = 3600000
 }

 local owalahjembot = gg.choice(ikiwktue, nil, "\nUBAH WAKTU DALAM PERMAINAN")
 if not owalahjembot then return end

 gg.searchNumber("30000;45000;1", gg.TYPE_DWORD)
 gg.refineNumber("30000", gg.TYPE_DWORD)
 local hasil = gg.getResults(10)
 if #hasil == 0 then
 gg.toast("Gagal, Coba Lagi")
 return
 end
 local save = {}
 for i, v in ipairs(hasil) do table.insert(save, {address = v.address - 0x8, flags = gg.TYPE_DWORD}) end
 local BA1 = gg.getValues(save)
 gg.sleep(800) 
 local BA2 = gg.getValues(save)
 local target = nil
 for i = 1, #BA1 do
 if BA1[i].value ~= BA2[i].value then target = save[i]; break end
 end
 if target == nil then gg.toast("Error"); return end
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
 local menu = gg.alert(" NO COOLDOWN SKILL & SPELL ", "[HIDUP]", "[MATI]")
 if menu == 1 then
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("0D;2098082D;2100252:9", gg.TYPE_DWORD)
 gg.refineNumber("0", gg.TYPE_DWORD)
 gg.getResults(100)
 gg.editAll("20,000,009", gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast('NO COOLDOWN ENABLE ') 
 elseif menu == 2 then
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("20,000,009D;2098082D;2100252:9", gg.TYPE_DWORD)
 gg.getResults(9)
 gg.refineNumber("20,000,009", gg.TYPE_DWORD)
 gg.getResults(9)
 gg.editAll("0", gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast('NO COOLDOWN DISABLE ') 
 end
end
 
function kdainject()
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 local i, kill, death, assist
 local mode = gg.choice({' Classic', ' Ranked'}, nil, 'KDA INJECT')
 if not mode then return end
 local isRanked = (mode == 2)
 local team = gg.choice({' Team', ' Enemy'}, nil, 'KDA INJECT')
 if not team then return end
 local player_name = {' Player 1', ' Player 2', ' Player 3', ' Player 4', ' Player 5'}
 local player_index = gg.choice(player_name, nil, 'KDA INJECT - Pilih Player')
 if not player_index then return end

 local team_i_values, enemy_i_values
 if isRanked then team_i_values = {9, 7, 5, 3, 1}; enemy_i_values = {10, 8, 6, 4, 2}
 else team_i_values = {10, 8, 6, 4, 2}; enemy_i_values = {9, 7, 5, 3, 1} end

 if team == 1 then i = team_i_values[player_index]
 elseif team == 2 then i = enemy_i_values[player_index] end

 local inputs = gg.prompt({"Kill (angka)", "Death (angka)", "Assist (angka)"}, {0, 0, 0}, {"number", "number", "number"})
 if not inputs then return end

 kill = tonumber(inputs[1])
 death = tonumber(inputs[2])
 assist = tonumber(inputs[3])

 gg.clearResults()
 gg.searchNumber('601295421455;601295421580', gg.TYPE_QWORD, false, gg.SIGN_EQUAL, 0, -1)
 gg.refineNumber('601295421455', gg.TYPE_QWORD)

 local results = gg.getResults(100)
 if #results < 10 then gg.alert("Data tidak ditemukan."); return end

 local list_player = {}
 for j = #results - 9, #results do table.insert(list_player, results[j]) end

 local base = list_player[i]
 if not base then gg.alert("Index i salah."); return end

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

function suntikturet()
 local a = gg.prompt({
 "--->> Turret Ke-1 ","--->> Turret Ke-2 ","--->> Turret Ke-3 ","--->> Inti Turret "
 }, {"4500", "5700", "7300", "7900"}, {"number", "number", "number", "number"}) 
 if a == nil then return end
 
 local b = a[1] +0
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("4500;5700;7300;7900", gg.TYPE_DWORD)
 gg.searchNumber("4500", gg.TYPE_DWORD) 
 gg.getResults(200)
 gg.editAll(b, gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast(" TURRET KE-1 SUCCESSFUL ")
 
 local bb = a[2] +0
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("15;5700;7300;7900", gg.TYPE_DWORD)
 gg.searchNumber("5700", gg.TYPE_DWORD) 
 gg.getResults(200)
 gg.editAll(bb, gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast(" TURRET KE-2 SUCCESSFUL ")
 
 local cc = a[3] +0
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("15;15;7300:7900", gg.TYPE_DWORD)
 gg.searchNumber("7300", gg.TYPE_DWORD) 
 gg.getResults(200)
 gg.editAll(cc, gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast(" TURRET KE-3 SUCCESSFUL ")
 
 local dd = a[4] +0
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("15;15;15;7900", gg.TYPE_DWORD)
 gg.searchNumber("7900", gg.TYPE_DWORD) 
 gg.getResults(200)
 gg.editAll(dd, gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast(" INTI TURRET SUCCESSFUL ")
end

function inispam()
 local menu = gg.alert("CHAT / RADIO INGAME NO COOLDOWN", "[HIDUP ]", "[MATI ]")
 if menu == 1 then
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("-4,389,320,786,825,969,664Q; 3,272,998,912Q; 5,000D :512", gg.TYPE_DWORD)
 gg.refineNumber("5000", gg.TYPE_DWORD)
 gg.getResults(3)
 gg.editAll("68", gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast('SPAM CHAT HIDUP') 
 elseif menu == 2 then
 gg.clearResults()
 gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("-4,389,320,786,825,969,664Q; 3,272,998,912Q; 68D :512", gg.TYPE_DWORD)
 gg.getResults(3)
 gg.refineNumber("68", gg.TYPE_DWORD)
 gg.getResults(3)
 gg.editAll("5000", gg.TYPE_DWORD)
 gg.clearResults()
 gg.toast(' SPAM CHAT MATI ') 
 end
end

-- =========================================================
-- DRONE VIEW
-- =========================================================
function drone_4()
 local menu = gg.alert("DRONE VIEW 1", "[HIDUP ]", "[MATI ]")
 if menu == 1 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "1089806008" then _NXS_4_.value = "1092616192"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1053839852" then _NXS_4_.value = "-1050620723"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "1089722122 " then _NXS_4_.value = "1092584735"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "-1057677640" then _NXS_4_.value = "-1092616192"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1057761526" then _NXS_4_.value = "-1050620723"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults(); gg.setVisible(false); gg.toast("Drone View 1 Active !")
 elseif menu == 2 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS )
 gg.searchNumber('1092616192;-1050620723;1092584735', gg.TYPE_DWORD); gg.searchNumber('1092616192', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089806008', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1050620723;1092584735', gg.TYPE_DWORD); gg.searchNumber('-1050620723', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1053839852', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1053839852;1092584735', gg.TYPE_DWORD); gg.searchNumber('1092584735', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089722122', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1092616192;-1050620723;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1092616192', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057677640', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1053577640;-1050620723;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1050620723', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057761526', gg.TYPE_DWORD); gg.toast('Drone View 1 Disable !'); gg.clearResults()
 end 
end

function drone_8()
 local menu = gg.alert("DRONE VIEW 2", "[HIDUP ]", "[MATI ]")
 if menu == 1 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "1089806008" then _NXS_4_.value = "1094506008"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1053839852" then _NXS_4_.value = "-1048839852"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "1089722122" then _NXS_4_.value = "1094522122"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults()
 gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "-1057677640" then _NXS_4_.value = "-1053577640"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1057761526" then _NXS_4_.value = "-1054071526"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults(); gg.setVisible(false); gg.toast("Drone View 2 Active !")
 elseif menu == 2 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS )
 gg.searchNumber('1094506008;-1048839852;1094522122', gg.TYPE_DWORD); gg.searchNumber('1094506008', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089806008', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1048839852;1094522122', gg.TYPE_DWORD); gg.searchNumber('-1048839852', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1053839852', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1053839852;1094522122', gg.TYPE_DWORD); gg.searchNumber('1094522122', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089722122', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1053577640;-1054071526;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1053577640', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057677640', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1053577640;-1054071526;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1054071526', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057761526', gg.TYPE_DWORD); gg.toast('Drone View 2 Disable !'); gg.clearResults()
 end 
end
 
function drone_10()
 local menu = gg.alert("DRONE VIEW 3", "[HIDUP ]", "[MATI ]")
 if menu == 1 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "1089806008" then _NXS_4_.value = "1097649357"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1053839852" then _NXS_4_.value = "-1045902131"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "1089722122" then _NXS_4_.value = "1097607414"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults()
 gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "-1057677640" then _NXS_4_.value = "-1049834291"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1057761526" then _NXS_4_.value = "-1049876234"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults(); gg.setVisible(false); gg.toast("Drone View 3 Active !")
 elseif menu == 2 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS )
 gg.searchNumber('1097649357;-1045902131;1097607414', gg.TYPE_DWORD); gg.searchNumber('1097649357', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089806008', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1045902131;1097607414', gg.TYPE_DWORD); gg.searchNumber('-1045902131', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1053839852', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1053839852;1097607414', gg.TYPE_DWORD); gg.searchNumber('1097607414', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089722122', gg.TYPE_DWORD); gg.clearResults() 
 gg.searchNumber('-1049834291;-1049876234;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1049834291', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057677640', gg.TYPE_DWORD); gg.clearResults() 
 gg.searchNumber('-1049834291;-1049876234;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1049876234', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057761526', gg.TYPE_DWORD); gg.toast('Drone View 3 Disable !'); gg.clearResults()
 end
end
 
function drone_12()
 local menu = gg.alert("DRONE VIEW 4", "[HIDUP ]", "[MATI ]")
 if menu == 1 then 
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "1089806008" then _NXS_4_.value = "1099206008"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1053839852" then _NXS_4_.value = "-1043839852"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "1089722122" then _NXS_4_.value = "1099322122"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults()
 gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "-1057677640" then _NXS_4_.value = "-1047962617"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1057761526" then _NXS_4_.value = "-1043583296"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults(); gg.setVisible(false); gg.toast("Drone View 4 Active !")
 elseif menu == 2 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS )
 gg.searchNumber('1099206008;-1043839852;1099322122', gg.TYPE_DWORD); gg.searchNumber('1099206008', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089806008', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1043839852;1099322122', gg.TYPE_DWORD); gg.searchNumber('-1043839852', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1053839852', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1053839852;1099322122', gg.TYPE_DWORD); gg.searchNumber('1099322122', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089722122', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1047962617;-1043583296;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1047962617', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057677640', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1053577640;-1043583296;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1043583296', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057761526', gg.TYPE_DWORD); gg.toast('Drone View 4 Disable !'); gg.clearResults()
 end 
end
 
function drone_14()
 local menu = gg.alert("DRONE VIEW 5", "[HIDUP ]", "[MATI ]")
 if menu == 1 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS)
 gg.searchNumber("1089806008;-1053839852;1089722122:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "1089806008" then _NXS_4_.value = "1101556008"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1053839852" then _NXS_4_.value = "-1041339852"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "1089722122" then _NXS_4_.value = "1101722122"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults()
 gg.searchNumber("-1057677640;-1057761526;1110143140:512", gg.TYPE_DWORD)
 _UPVALUE2_ = gg.getResults(20)
 for _NXS_3_, _NXS_4_ in ipairs(_UPVALUE2_) do
 if _NXS_4_.value == "-1057677640" then _NXS_4_.value = "-1044219268"; _NXS_4_.freeze = true end
 if _NXS_4_.value == "-1057761526" then _NXS_4_.value = "-1043583296"; _NXS_4_.freeze = true end
 end
 gg.setValues(_UPVALUE2_); gg.clearResults(); gg.setVisible(false); gg.toast("Drone View 5 Active !")
 elseif menu == 2 then
 gg.clearResults(); gg.setRanges(gg.REGION_ANONYMOUS )
 gg.searchNumber('1101556008;-1041339852;1101722122', gg.TYPE_DWORD); gg.searchNumber('1101556008', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089806008', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1041339852;1101722122', gg.TYPE_DWORD); gg.searchNumber('-1041339852', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1053839852', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('1089806008;-1053839852;1101722122', gg.TYPE_DWORD); gg.searchNumber('1101722122', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('1089722122', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1044219268;-1043583296;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1044219268', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057677640', gg.TYPE_DWORD); gg.clearResults()
 gg.searchNumber('-1053577640;-1043583296;1110143140', gg.TYPE_DWORD); gg.searchNumber('-1043583296', gg.TYPE_DWORD); gg.getResults(100); gg.editAll('-1057761526', gg.TYPE_DWORD); gg.toast('Drone View 5 Disable !'); gg.clearResults()
 end 
end

-- =========================================================
-- MENU NAVIGASI
-- =========================================================
function citdamage()
 local menu = gg.choice({ 
 "MARKSMAN", "FIGHTER", "ASSASSIN", "MAGE", "SUPPORT", "EXIT",
 }, {}, os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n * NARI SCRIPT MENU *\n-----------------------------')) 
 if menu == 1 then damageBooster()
 elseif menu == 2 then damageFighter()
 elseif menu == 3 then damageAssassin()
 elseif menu == 4 then damageMage()
 elseif menu == 5 then damageSupport()
 elseif menu == 6 then START() end
 BG = -1
end
 
function droneview()
 local menu = gg.choice({ 
 "DRONE VIEW 1", "DRONE VIEW 2", "DRONE VIEW 3", "DRONE VIEW 4", "DRONE VIEW 5", "EXIT",
 }, {}, os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n * NARI DRONE VIEW *\n-----------------------------')) 
 if menu == 1 then drone_4()
 elseif menu == 2 then drone_8()
 elseif menu == 3 then drone_10()
 elseif menu == 4 then drone_12()
 elseif menu == 5 then drone_14()
 elseif menu == 6 then START() end
 BG = -2
end

function Narisai()
 local menu = gg.alert("SUDAH SUBSCRIBE NARI SCRIPT ?\n", "[SUDAH]", "[BELUM]")
 if menu == 1 then
 gg.toast("Terimakasih")
 print("Script dinonaktifkan, Silahkan aktifkan kembali untuk menggunakannya!")
 os.exit()
 elseif menu == 2 then
 gg.toast("SUBSCRIBE DULU DONG :'(")
 end
end

function START()
 RunCount = RunCount + 1 
 local header = os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n * NARI SCRIPT MENU *\n Eksekusi Skrip: ' .. RunCount .. ' kali\n-----------------------------')
 
 local menu = gg.choice({ 
 "SKIP WAKTU 6 MENIT (INSTANT)",
 "HERO SPESIAL (LAYLA, BRUNO, BANE)",
 "DAMAGE BOOSTER ROLE LAIN",
 "DRONE VIEW",
 "ATTACK SPEED", 
 "SKILL NO COOLDOWN",
 "CHAT NO COOLDOWN",
 "PERCEPAT WAKTU (PILIH MANUAL)",
 "SUNTIK TURRET",
 "SUNTIK KDA",
 "INFO SCRIPT",
 "EXIT",
 }, {}, header) 
 
 if menu == 1 then skipEnamMenit()
 elseif menu == 2 then instantHero()
 elseif menu == 3 then citdamage()
 elseif menu == 4 then droneview()
 elseif menu == 5 then attackspeed()
 elseif menu == 6 then inicd()
 elseif menu == 7 then inispam()
 elseif menu == 8 then percepatwaktu()
 elseif menu == 9 then suntikturet()
 elseif menu == 10 then kdainject()
 elseif menu == 11 then Narisai()
 elseif menu == 12 then os.exit() end
 BG = -1
end

while true do
 if gg.isVisible(true) then
 BG = 1
 gg.setVisible(false)
 end

 if BG == 1 then
 START()
 end
 gg.sleep(100)
end
