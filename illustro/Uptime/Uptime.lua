function Update()
    local uptimeSec = SKIN:GetMeasure("MeasureUptime"):GetValue()
    SKIN:Bang("!Log", "Uptime in secondi: " .. uptimeSec)
    return uptimeSec
end

function Update()
    local timeStr = SKIN:GetMeasure("MeasureTime"):GetStringValue()
    local uptimeSec = SKIN:GetMeasure("MeasureUptime"):GetValue()

    --SKIN:Bang("!Log", "Uptime in secondi: " .. timeStr)
    --SKIN:Bang("!Log", "Uptime in secondi: " .. uptimeSec)

    local d, m, y, H, M, S = timeStr:match("(%d+)/(%d+)/(%d+) (%d+):(%d+):(%d+)")
    y = tonumber(y) + 2000  -- Corregge l'anno a 4 cifre

    local current_time = os.time({year=y, month=m, day=d, hour=H, min=M, sec=S})
    local reboot_time = os.date("%d/%m/%y %H:%M:%S", current_time - uptimeSec)

    --SKIN:Bang("!Log", "reboot time: " .. reboot_time)

    return reboot_time
end