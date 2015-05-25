
# lib/main

SearchAllKbPage = require './search-all-kb-page'
db = require './db'

module.exports =
  
  activate: -> 
    db.getBindings (@bindings) =>
      @sub = atom.commands.add 'atom-workspace', 'search-all-keybindings:open': =>
        atom.workspace.getActivePane().activateItem new SearchAllKbPage @
    
  deactivate: ->
    @sub.dispose()
