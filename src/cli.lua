#!/usr/bin/env lua

--[[
    A Lua-based CLI application template.

    This template provides a starting point for creating Lua CLI applications.
    It includes basic argument passing, logging and event handling.
]]

require("init")

-- Required modules
local argparse = require("argparse")
local ansicolors = require("ansicolors")
local logging = require("logging")
require("logging.console")

-- set up the default logger to stderr + colorization
local log = logging.defaultLogger(logging.console({
  logLevel = logging.DEBUG,
  destination = "stderr",
  timestampPattern = "%y-%m-%d %H:%M:%S",
  logPatterns = {
    [logging.DEBUG] = ansicolors("%date %{cyan}[%level] %{reset}%message %{reset}\n"),
    [logging.INFO] = ansicolors("%date %{white bright}[%level] %message%{reset}\n"),
    [logging.WARN] = ansicolors("%date %{yellow}[%level] %{reset}%message%{reset}\n"),
    [logging.ERROR] = ansicolors("%date %{red bright}[%level] %message%{reset}\n"),
    [logging.FATAL] = ansicolors("%date %{magenta bright}[%level] %message%{reset}\n"),
  },
}))

-- CLI arguments parser
local function parse_args()
  local parser = argparse()
  parser:name("Lua-based CLI Template")
  parser:description([===[
    This is a sample CLI application that serves as  a template for creating Lua CLI applications.
    It doesn't really do anything useful, but it's a good starting point for your own projects.
    Try the --help to see available options, and don't forget to check the README.md file for more information.
  ]===])
  parser:epilog("For more information, visit: https://github.com/dijeferson/lua-cli-template")

  -- All parameters are optional with defaults
  parser:flag("-v --verbose", "Enable verbose logging"):default(false)
  parser:option("-t --tags", "Additional tags (space-separated)"):args("*")
  parser:add_complete()

  return parser:parse()
end

local function process_tags(tags)
  if tags then
    -- returns a list of tags as a string separated by commas
    log:debug("Processing tags", tags)
    return table.concat(tags, ",")
  end
end

-- Main execution flow
local function main()
  local args = parse_args()

  -- Update log level if verbose flag is set
  if args.verbose then
    log:setLevel(log.DEBUG)
  else
    log:setLevel(log.ERROR)
  end

  log:debug("Starting worklog generation")
  log:debug("Informed arguments:")
  log:debug(args)

  local tags = process_tags(args.tags)
  print("Hello! Tags: ", tags)
end

-- Run the script
main()
