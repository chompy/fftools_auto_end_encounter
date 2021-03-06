local function on_log(l)
    local match = fft_regex_match("21:.*:(40000001|40000005|40000003):00:00:00:00", l.log_line)
    if match ~= nil and match[1] ~= nil then
        fft_encounter_end()
    end
end

function init()
    fft_event_attach("act:log_line", on_log)
end

function info()
    return {
        name = "Auto End Encounter",
        desc = "Tells ACT to end the encounter upon party wipe.",
    }
end