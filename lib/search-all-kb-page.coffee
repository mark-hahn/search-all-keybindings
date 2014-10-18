
# lib/search-all-kb-page

{Emitter}           = require 'emissary'
SearchAllKbPageView = require './search-all-kb-page-view'

module.exports =
class SearchAllKbPage
  # This may appear to not be used but the tab opener code requires it
  Emitter.includeInto @
  
  constructor: (@main) ->
    
  getMain:      -> @main
  getTitle:     -> 'Search Keybindings'
  getViewClass: -> SearchAllKbPageView
  