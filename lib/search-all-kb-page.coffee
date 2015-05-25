
# lib/search-all-kb-page

SearchAllKbPageView = require './search-all-kb-page-view'

module.exports =
class SearchAllKbPage
  constructor: (@main) ->
    
  getMain:      -> @main
  getTitle:     -> 'Search Keybindings'
  getViewClass: -> SearchAllKbPageView
  