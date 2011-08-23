fs            = require 'fs'
{print}       = require 'sys'
{spawn, exec} = require 'child_process'

option '-n', '--name [DIR]', 'directory for new sandbox'

task 'sandbox', 'Generate new sandbox', (options) ->
  exec "mkdir #{options.name}"
  exec "cp boilerplate/index.html #{options.name}/index.html"
  console.log "Created sandbox #{options.name}"

