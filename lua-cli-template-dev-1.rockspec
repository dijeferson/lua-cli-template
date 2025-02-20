rockspec_format = "3.0"
package = "lua-cli-template"
version = "dev-1"
source = {
  url = "git+ssh://git@github.com/dijeferson/lua-cli-template.git",
}
description = {
  summary = "A template for creating Lua CLI applications",
  detailed = [[
    A template for creating Lua CLI applications.
   ]],
  homepage = "https://jefersonsantos.com/lua-cli-template", -- Your project homepage
  license = "MIT",
}

dependencies = {
  "lua >= 5.4",
  "luasocket >= 3.0",
  "argparse >= 0.7.1",
  "lualogging >= 1.8.2",
  "luasec >= 1.1 ",
  "ansicolors >= 1.0",
}

test_dependencies = {
  "busted >= 2.0",
  "luassert >= 1.9",
}

build = {
  type = "builtin",
  modules = {
    -- Uncomment to install the CLI as a module
    -- cli = "src/cli.lua",
  },
  install = {
    -- Uncmoment to install the CLI as a binary
    -- bin = {
    --   ["cli"] = "src/cli.lua",
    -- },
  },
}
