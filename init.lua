do
  local addr, invoke = computer.getBootAddress(), component.invoke
  -- opencomputers loadfile() inplementation
  local function loadfile(file)
    local handle = assert(invoke(addr, "open", file))
    local buffer = ""
    repeat
      local data = invoke(addr, "read", handle, math.huge)
      buffer = buffer .. (data or "")
    until not data
    invoke(addr, "close", handle)
    return load(buffer, "=" .. file, "bt", _G)
  end
  loadfile("/EFI/Minified.lua")(loadfile)
end
