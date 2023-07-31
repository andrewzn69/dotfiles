local status, cellular_automation = pcall(require, "cellular_automation")
if (not status) then return end

cellular_automation.setup {}
