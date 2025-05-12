local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
    return
end

neogit.setup {
  kind = "floating",
  graph_style = "unicode",
  integrations = {
    telescope = true
  }
}
