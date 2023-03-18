-- Useful for debugging while developing plugins
P = function(v)
    print(vim.inspect(v))
    return v
end

F = function() print(vim.bo.filetype) end

RELOAD = function(...) return require("plenary.reload").reload_module(...) end

R = function(name)
    RELOAD(name)
    return require(name)
end
