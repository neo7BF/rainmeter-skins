function Update()
    local bootTimestamp = tonumber(SKIN:GetMeasure("PowerOnLogonTime"):GetStringValue())
    -- if value is not yet available
    if not bootTimestamp then return "" end
    -- isdst == true is Legal hour, solar otherwise    
    local offset = os.date("*t").isdst and 3600 or 0
    local reboot_time = os.date("%d/%m/%y %H:%M:%S", bootTimestamp + offset)
    return reboot_time
end