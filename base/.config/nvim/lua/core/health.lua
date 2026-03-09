--------------------------------------------------------------------------------
-- OS 감지 및 크로스 플랫폼 유틸리티
--------------------------------------------------------------------------------
local M = {}

-- OS 감지
M.is_windows = vim.loop.os_uname().version:find("Windows") ~= nil
M.is_mac = vim.loop.os_uname().sysname == "Darwin"
M.is_linux = vim.loop.os_uname().sysname == "Linux"

-- 경로 구분자
M.path_sep = M.is_windows and "\\" or "/"

-- OS 정보 로깅 (디버깅용)
function M.log_platform_info()
    local uname = vim.loop.os_uname()
    print("Platform Info:")
    print("  sysname: " .. uname.sysname)
    print("  version: " .. uname.version)
    print("  is_windows: " .. tostring(M.is_windows))
    print("  is_mac: " .. tostring(M.is_mac))
    print("  is_linux: " .. tostring(M.is_linux))
end

return M
