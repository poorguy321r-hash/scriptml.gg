-- Nari script --
gg.alert("\n Nari*")

-- VARIABEL COUNTER (Menghitung berapa kali script jalan)
local RunCount = 0

-- =========================================================
-- FUNGSI SKIP WAKTU 6 MENIT (Dipanggil otomatis)
-- =========================================================
function skipEnamMenit()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    gg.searchNumber("30000;45000;1", gg.TYPE_DWORD)
    gg.refineNumber("30000", gg.TYPE_DWORD)
    local hasil = gg.getResults(10)
    
    if #hasil == 0 then
        gg.toast("Gagal Skip Waktu: Memori waktu belum terbaca.")
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
    
    -- Mencari memori waktu yang berdetik
    for i = 1, #BA1 do
        if BA1[i].value ~= BA2[i].value then
            target = save[i]
            break
        end
    end
    
    -- FALLBACK ANTI-ERROR: Jika game ter-pause oleh GG, waktu tidak berdetik.
    -- Kita paksa ambil memori valid pertama.
    if target == nil and #save > 0 then
        target = save[1]
    end
    
    if target ~= nil then
        target.value = 360000 -- Nilai 6 menit (dalam milisecond)
        gg.setValues({target})
        gg.toast("Waktu berhasil di-Skip ke --->> 06:00")
    else
        gg.toast("Error Skip Waktu: Alamat memori tidak valid.")
    end
    
    gg.clearResults()
end

-- =========================================================
-- FITUR HERO SPESIAL (SISTEM ONE-SHOT INJECT)
-- =========================================================
function instantHero()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    
    local heroChoice = gg.choice({"LAYLA", "BRUNO", "BANE", "RAFAELA"}, nil, "PILIH HERO SPESIAL (HP 700K, ATK 60K, SPD 1300 + AUTO SKIP 6 MENIT)")
    if not heroChoice then return end
    
    local stats
    if heroChoice == 1 then stats = {HP = 2320, ATK = 133, SPD = 290} -- Layla
    elseif heroChoice == 2 then stats = {HP = 2320, ATK = 145, SPD = 245} -- Bruno
    elseif heroChoice == 3 then stats = {HP = 2381, ATK = 117, SPD = 260} -- Bane
    elseif heroChoice == 4 then stats = {HP = 2320, ATK = 117, SPD = 285} -- Rafaela
    end

    local new_HP = 700000
    local new_ATK = 60000
    local new_SPD = 1300

    -- ONE-SHOT SCAN: Cari semua stat sekaligus
    gg.searchNumber(string.format("%d;%d;%d", stats.HP, stats.ATK, stats.SPD), gg.TYPE_DWORD)
    local results = gg.getResults(300)
    
    if #results == 0 then
        gg.toast("GAGAL: Pastikan Hero masih LEVEL 1 dan Cheat belum aktif!")
        return
    end

    -- ONE-SHOT INJECT: Ubah semua stat secara serentak tanpa perlu scan ulang
    local mod_values = {}
    for i, v in ipairs(results) do
        if v.value == stats.HP then
            v.value = new_HP
            table.insert(mod_values, v)
        elseif v.value == stats.ATK then
            v.value = new_ATK
            table.insert(mod_values, v)
        elseif v.value == stats.SPD then
            v.value = new_SPD
            table.insert(mod_values, v)
        end
    end
    
    gg.setValues(mod_values)
    gg.clearResults()

    gg.toast("CHEAT HERO SPESIAL AKTIF ! Mengeksekusi Skip Waktu...")
    gg.sleep(500) 
    skipEnamMenit()
end

-- =========================================================
-- DAMAGE BOOSTER MARKSMAN (SISTEM ONE-SHOT INJECT)
-- =========================================================
function damageBooster()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local new_value_HP = 700000
    local new_value_ATK = 60000

    local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk. Jika Musuh Dan Team Tidak Bot/Afk, Akan Mengalami Crash/Force Close.\n\n Aktifkan Di Dalam Pertandingan (Hero Level 1).", "[OTOMATIS]", "[MANUAL]")
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

    gg.searchNumber(string.format("%d;%d", stats.HP, stats.ATK), gg.TYPE_DWORD)
    local results = gg.getResults(300)
    
    if #results == 0 then
        gg.toast("GAGAL: Pastikan Hero masih LEVEL 1!")
        return
    end

    local mod_values = {}
    for i, v in ipairs(results) do
        if v.value == stats.HP then v.value = new_value_HP table.insert(mod_values, v)
        elseif v.value == stats.ATK then v.value = new_value_ATK table.insert(mod_values, v)
        end
    end
    
    gg.setValues(mod_values)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE FIGHTER (SISTEM ONE-SHOT INJECT)
-- =========================================================
function damageFighter()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local new_value_HP = 700000
    local new_value_ATK = 60000

    local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats2 = {
        [" Alucard"] = {HP = 2443, ATK = 123}, [" Arlot"] = {HP = 2450, ATK = 120},
        [" Bane"] = {HP = 2381, ATK = 117}, [" Chou"] = {HP = 2530, ATK = 121},
        [" Alpha"] = {HP = 2468, ATK = 121}, [" Ruby"] = {HP = 2331, ATK = 129},
        [" Balmond"] = {HP = 2558, ATK = 119}, [" Hilda"] = {HP = 2680, ATK = 123},
        [" Lapu-Lapu"] = {HP = 2450, ATK = 119}, [" Sun"] = {HP = 2500, ATK = 114},
        [" Roger"] = {HP = 2530, ATK = 128}, [" Gatotkaca"] = {HP = 2520, ATK = 128},
        [" Grock"] = {HP = 2819, ATK = 135}, [" Argus"] = {HP = 2450, ATK = 111},
        [" Jawhead"] = {HP = 2480, ATK = 119}, [" Martis"] = {HP = 2560, ATK = 128},
        [" Kaja"] = {HP = 2431, ATK = 120}, [" Aldous"] = {HP = 2490, ATK = 129},
        [" Leomord"] = {HP = 2560, ATK = 126}, [" Minsitthar"] = {HP = 2520, ATK = 121},
        [" Badang"] = {HP = 2530, ATK = 111}, [" Guinevere"] = {HP = 2350, ATK = 126},
        [" Terizla"] = {HP = 2619, ATK = 129}, [" X.Borg"] = {HP = 917, ATK = 117},
        [" Dyrroth"] = {HP = 2580, ATK = 117}, [" Marsha"] = {HP = 2000, ATK = 90},
        [" Silvanna"] = {HP = 2650, ATK = 126}, [" Yu Zhong"] = {HP = 2520, ATK = 129},
        [" Benedetta"] = {HP = 2410, ATK = 113}, [" Khaleed"] = {HP = 2600, ATK = 109},
        [" Barats"] = {HP = 2450, ATK = 135}, [" Paquito"] = {HP = 2620, ATK = 121},
        [" Fredrinn"] = {HP = 2600, ATK = 125}, [" Yin"] = {HP = 2400, ATK = 109},
        [" Aulus"] = {HP = 2500, ATK = 90}, [" Phoveus"] = {HP = 2650, ATK = 132},
        [" Sora"] = {HP = 2800, ATK = 132}, [" Kalea"] = {HP = 2500, ATK = 126},
        [" Zilong"] = {HP = 2511, ATK = 123}, [" Suyou"] = {HP = 2390, ATK = 124},
        [" Julian"] = {HP = 2700, ATK = 128}, [" Cici"] = {HP = 2431, ATK = 129},
        [" Freya"] = {HP = 2550, ATK = 120}, [" Lukas"] = {HP = 2550, ATK = 119},
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
    local results = gg.getResults(300)
    
    if #results == 0 then
        gg.toast("GAGAL: Pastikan Hero masih LEVEL 1!")
        return
    end

    local mod_values = {}
    for i, v in ipairs(results) do
        if v.value == stats.HP then v.value = new_value_HP table.insert(mod_values, v)
        elseif v.value == stats.ATK then v.value = new_value_ATK table.insert(mod_values, v)
        end
    end
    
    gg.setValues(mod_values)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE ASSASSIN (SISTEM ONE-SHOT INJECT)
-- =========================================================
function damageAssassin()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local new_value_HP = 700000
    local new_value_ATK = 60000

    local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats3 = {
        [" Alucard"] = {HP = 2443, ATK = 123}, [" Arlot"] = {HP = 2450, ATK = 120},
        [" Benedetta"] = {HP = 2410, ATK = 113}, [" Saber"] = {HP = 2440, ATK = 118},
        [" Karina"] = {HP = 2474, ATK = 121}, [" Zilong"] = {HP = 2511, ATK = 123},
        [" Natalia"] = {HP = 2480, ATK = 121}, [" Ling"] = {HP = 2369, ATK = 125},
        [" Hayabusa"] = {HP = 2270, ATK = 117}, [" Fanny"] = {HP = 2267, ATK = 126},
        [" Suyou"] = {HP = 2390, ATK = 124}, [" Julian"] = {HP = 2700, ATK = 128},
        [" Aamon"] = {HP = 2455, ATK = 115}, [" Mathilda"] = {HP = 2530, ATK = 120},
        [" Lesley"] = {HP = 2260, ATK = 145}, [" Yi Sun-Shin"] = {HP = 2320, ATK = 110},
        [" Sora"] = {HP = 2800, ATK = 132}, [" Joy"] = {HP = 2519, ATK = 119},
        [" Paquito"] = {HP = 2620, ATK = 121}, [" Yin"] = {HP = 2400, ATK = 109},
        [" Nolan"] = {HP = 2390, ATK = 124}, [" Kadita"] = {HP = 2440, ATK = 105},
        [" Hanzo"] = {HP = 2594, ATK = 108}, [" Selena"] = {HP = 2280, ATK = 110},
        [" Gusion"] = {HP = 2419, ATK = 119}, [" Helcurt"] = {HP = 2440, ATK = 121},
        [" Harley"] = {HP = 2380, ATK = 114}, [" Lancelot"] = {HP = 2390, ATK = 124}
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
    local results = gg.getResults(300)
    
    if #results == 0 then
        gg.toast("GAGAL: Pastikan Hero masih LEVEL 1!")
        return
    end

    local mod_values = {}
    for i, v in ipairs(results) do
        if v.value == stats.HP then v.value = new_value_HP table.insert(mod_values, v)
        elseif v.value == stats.ATK then v.value = new_value_ATK table.insert(mod_values, v)
        end
    end
    
    gg.setValues(mod_values)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE MAGE (SISTEM ONE-SHOT INJECT)
-- =========================================================
function damageMage()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local new_value_HP = 700000
    local new_value_ATK = 60000

    local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats4 = {
        [" Aurora"] = {HP = 2380, ATK = 110}, [" Vexana"] = {HP = 2380, ATK = 112},
        [" Odette"] = {HP = 2440, ATK = 105}, [" Nana"] = {HP = 2380, ATK = 115},
        [" Vale"] = {HP = 2380, ATK = 115}, [" Gord"] = {HP = 2380, ATK = 110},
        [" Alice"] = {HP = 2452, ATK = 114}, [" Bane"] = {HP = 2381, ATK = 117},
        [" Eudora"] = {HP = 2440, ATK = 112}, [" Kagura"] = {HP = 2380, ATK = 118},
        [" Cyclops"] = {HP = 2440, ATK = 112}, [" Harley"] = {HP = 2380, ATK = 114},
        [" Zhask"] = {HP = 2380, ATK = 107}, [" Pharsa"] = {HP = 2320, ATK = 109},
        [" Valir"] = {HP = 2380, ATK = 105}, [" Chang'e"] = {HP = 2320, ATK = 115},
        [" Selena"] = {HP = 2380, ATK = 110}, [" Lunox"] = {HP = 2440, ATK = 115},
        [" Kimmy"] = {HP = 2380, ATK = 100}, [" Harith"] = {HP = 2260, ATK = 115},
        [" Faramis"] = {HP = 2500, ATK = 118}, [" Esmeralda"] = {HP = 2464, ATK = 114},
        [" Kadita"] = {HP = 2440, ATK = 105}, [" Lylia"] = {HP = 2380, ATK = 113},
        [" Cecilion"] = {HP = 2380, ATK = 105}, [" Luo Yi"] = {HP = 2440, ATK = 107},
        [" Yve"] = {HP = 2320, ATK = 115}, [" Valentina"] = {HP = 2500, ATK = 115},
        [" Xavier"] = {HP = 2380, ATK = 111}, [" Novaria"] = {HP = 2260, ATK = 115},
        [" Zhuxin"] = {HP = 2440, ATK = 115}, [" Zetian"] = {HP = 2380, ATK = 95}
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
    local results = gg.getResults(300)
    
    if #results == 0 then
        gg.toast("GAGAL: Pastikan Hero masih LEVEL 1!")
        return
    end

    local mod_values = {}
    for i, v in ipairs(results) do
        if v.value == stats.HP then v.value = new_value_HP table.insert(mod_values, v)
        elseif v.value == stats.ATK then v.value = new_value_ATK table.insert(mod_values, v)
        end
    end
    
    gg.setValues(mod_values)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- DAMAGE SUPPORT (SISTEM ONE-SHOT INJECT)
-- =========================================================
function damageSupport()
    gg.clearResults()
    gg.setRanges(gg.REGION_ANONYMOUS)
    local new_value_HP = 700000
    local new_value_ATK = 60000

    local mode = gg.alert("DAMAGE BOOSTER ( TOLONG DIBACA ) \n\nNote: Jika Menggunakan Fitur Ini, Team Dan Musuh Harus Bot/Afk.", "[OTOMATIS]", "[MANUAL]")
    if not mode then return end

    local heroStats5 = {
        [" Rafaela"] = {HP = 2320, ATK = 117}, [" Minotaur"] = {HP = 2750, ATK = 123},
        [" Lolita"] = {HP = 2342, ATK = 115}, [" Johnson"] = {HP = 2700, ATK = 120},
        [" Estes"] = {HP = 2221, ATK = 120}, [" Diggie"] = {HP = 2347, ATK = 115},
        [" Angela"] = {HP = 2300, ATK = 115}, [" Kaja"] = {HP = 2431, ATK = 120},
        [" Faramis"] = {HP = 2500, ATK = 118}, [" Carmilla"] = {HP = 2419, ATK = 126},
        [" Mathilda"] = {HP = 2530, ATK = 120}, [" Floryn"] = {HP = 2280, ATK = 119},
        [" Chip"] = {HP = 2481, ATK = 112}, [" Kalea"] = {HP = 2500, ATK = 126},
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
    local results = gg.getResults(300)
    
    if #results == 0 then
        gg.toast("GAGAL: Pastikan Hero masih LEVEL 1!")
        return
    end

    local mod_values = {}
    for i, v in ipairs(results) do
        if v.value == stats.HP then v.value = new_value_HP table.insert(mod_values, v)
        elseif v.value == stats.ATK then v.value = new_value_ATK table.insert(mod_values, v)
        end
    end
    
    gg.setValues(mod_values)
    gg.clearResults()
    gg.toast("CHEAT DAMAGE AKTIF !")
end

-- =========================================================
-- MENU NAVIGASI KEDUA (PILIH ROLE)
-- =========================================================
function citdamage()
    local menu = gg.choice({ 
        "MARKSMAN", "FIGHTER", "ASSASSIN", "MAGE", "SUPPORT", "KEMBALI"
    }, {}, os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n * NARI SCRIPT MENU *\n-----------------------------')) 
    
    if menu == 1 then damageBooster()
    elseif menu == 2 then damageFighter()
    elseif menu == 3 then damageAssassin()
    elseif menu == 4 then damageMage()
    elseif menu == 5 then damageSupport()
    elseif menu == 6 then START() end
    BG = -1
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

-- =========================================================
-- MENU UTAMA
-- =========================================================
function START()
    RunCount = RunCount + 1 
    local header = os.date('Day: %d - %m - %Y\nHour: %X\n-----------------------------\n * NARI SCRIPT MENU *\n Eksekusi Skrip: ' .. RunCount .. ' kali\n-----------------------------')
 
    local menu = gg.choice({ 
        "HERO SPESIAL (+ AUTO SKIP 6 MENIT)",
        "DAMAGE BOOSTER ROLE LAIN",
        "INFO SCRIPT",
        "EXIT",
    }, {}, header) 
 
    if menu == 1 then instantHero()
    elseif menu == 2 then citdamage()
    elseif menu == 3 then Narisai()
    elseif menu == 4 then os.exit() end
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