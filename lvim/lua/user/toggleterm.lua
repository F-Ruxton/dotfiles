local Terminal = require('toggleterm.terminal').Terminal

local _python_cmd = os.getenv("CONDA_PREFIX") and "ipython" or "python"
local Python = Terminal:new(
    {
        cmd = _python_cmd,
        direction = "vertical",
        count = 1,
    }
)

function _python_toggle()
    Python:toggle()
end
