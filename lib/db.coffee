
# lib/db.coffee

request  = require 'request'

exports.getBindings = (cb) ->
  options =
    url: "https://api.github.com/gists/a690a7d5ef746368385f"
    method: 'GET'
    json:    yes
    headers: 'User-Agent': 'mark-hahn'
  
  request options, (err, res, body) ->
    if err or not (status = res?.statusCode) or status isnt 200
      # console.log 'search-all-keybindings, error getting db from gist', status, err?.statusMessage, body
      cb []
      return
    bindings = JSON.parse body.files['allkeybindings.json'].content
    # console.log 'search-all-keybindings db result', {options, err, status: res.headers.status, bindings: bindings.length}
    cb bindings
