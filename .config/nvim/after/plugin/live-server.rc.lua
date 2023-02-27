local status_ok, live_server = pcall(require, "live_server")
if not status_ok then
  return
end

live_server.setup({
  port = 6969,
  browser_command = "firefox", -- Command or executable path
  quiet = false,
  no_css_inject = false,
})
