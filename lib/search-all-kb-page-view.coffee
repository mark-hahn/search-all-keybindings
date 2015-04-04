
# lib/search-all-kb-page-view

{$, View} = require 'atom'
moment    = require 'moment'

module.exports =
class SearchAllKbPageView extends View
  
  @content: ->
    @div class:'search-all-keybindings editor-colors', tabIndex:-1, =>
      @h3 outlet:'heading', "Loading key bindings for all published packages ..."
      @input 
        outlet:'srchStr' 
        class: 'native-key-bindings'
        placeholder:'Enter keybinding such as ctrl-shift-A and press enter'
      @table outlet:'resTab'
      @div outlet:'noneFound', class:'none-found', 'No Bindings Found'
      
  initialize: (searchAllKbPage) ->
    do waitForBindings = =>
      main = searchAllKbPage.getMain()
      if not main.bindings
        @waitTimeout = setTimeout waitForBindings, 100
        return
      @waitTimeout = null  
      
      {@bindings} = main
      [version, created] = @bindings.shift()
      createdDate = moment(created).format "dddd, MMMM Do YYYY, h:mm:ss a"
      @heading.text "Loaded #{@bindings.length} bindings from gist created on " + createdDate
      @heading.css fontWeight: 'normal'
      @srchStr.show().focus()
      
      @subscribe @srchStr, 'keydown', (e) =>
        if e.which is 13 then @display(); return false
      
  normalize: (str) ->
    spaceGrps = str.toLowerCase().split /\s+/g
    res = []
    for spaceGrp in spaceGrps when not ''
      dashGrps = spaceGrp.split '-'
      words = []
      for dashGrp in dashGrps
        words.push (if dashGrp is '' then '-' else dashGrp)
      res.push words.sort().join '-'
    res.join ' '
    
  display: ->
    @noneFound.hide()
    @resTab.show().empty()
    inpTxt = @normalize(@srchStr.val())
    # @srchStr.val inpTxt
    rowCount = 0
    for binding in @bindings
      {packageName, downloads, scope, keystroke, command} = binding
      if downloads is 9e9 then continue
      if @normalize(keystroke) is inpTxt
        rowCount++
        @resTab.append $ \
          "<tr>
            <td class='td-cnt'>#{downloads}</td>
            <td class='td-cmd'>#{command}</td>
            <td class='td-key'>#{keystroke}</td>
            <td class='td-scp'>#{scope}</td>
          </tr>"
            # <td class='td-nam'>#{packageName}</td>
    if rowCount is 0
      @noneFound.show()
      
  destroy: ->
    console.log 'destroying SearchAllKbPageView'
    if @waitTimeout then clearTimeout @waitTimeout
    @detach()
    @unsubscribe()
    
    