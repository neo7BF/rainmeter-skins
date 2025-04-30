function Update()
    local bootTimestamp = tonumber(SKIN:GetMeasure("PowerOnLogonTime"):GetStringValue())
    -- if value is not yet available
    if not bootTimestamp then return "" end
    
    local reboot_time = os.date("%d/%m/%y %H:%M:%S", bootTimestamp)
    return reboot_time
end