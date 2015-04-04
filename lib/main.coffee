
# lib/main

SearchAllKbPage = require './search-all-kb-page'
db = require './db'

module.exports =
  activate: -> 
    db.getBindings (@bindings) =>
    atom.workspaceView.command "search-all-keybindings:open", =>
      atom.workspace.activePane.activateItem new SearchAllKbPage @

