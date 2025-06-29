function Update()
    local bootTimestamp = tonumber(SKIN:GetMeasure("PowerOnLogonTime"):GetStringValue())
    -- if value is not yet available
    if not bootTimestamp then return "" end
    -- isdst == true is Legal hour, solar otherwise    
    local offset = os.date("*t").isdst and 3600 or 0
    local reboot_time = os.date("%d/%m/%y %H:%M:%S", bootTimestamp + offset)
    return reboot_time
end

function CopyQuery(text)

    local queries = loadQueriesFromFile("c:\\develop\\rainmeter-queries.txt")

    local query = queries[text];

 --   local oneLine = query:gsub("\n", "\\n")
    
--    local command = 'wsl -e bash -c "echo -e \'' .. oneLine .. '\' | clip.exe;  exit 0"'
    
--    print(""..command) --SKIN:Bang("!Log", ""..command) 

    print(query)

    SKIN:Bang("!SetClip",query);

    os.execute(command)
end

function loadQueriesFromFile(filename)
    local queries = {}
    local f = io.open(filename, "r")
    if not f then
        print("Errore: impossibile aprire il file " .. filename)
        return queries
    end

    local content = f:read("*a")
    f:close()

    -- Itera su tutte le coppie chiave###query_fino_a_;
    for key, value in string.gmatch(content, "(.-)###(.-;)%s*") do
        queries[key] = value
        print("Chiave:", key)
        print("Query:\n" .. value)
        print("---------------------------")
    end

    return queries
end
  