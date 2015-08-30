search-all-keybindings
======================

# THIS PACKAGE IS DEPRECATED.

Sorry, but the server for this is going over the github api usage limit.

---

search-all-keybindings
Atom editor package developer tool to search all published keybindings

![Animated GIF](https://github.com/mark-hahn/search-all-keybindings/blob/master/screenshots/keyb.gif?raw=true)

search-all-keybindings is an Atom editor package that allows a package developer to search through all published atom.io packages.  This allows you to find out if a planned binding in your package has significant conflicts with other packages.  At the time of this writing there are over 1900 keybindings although most are bound to narrow contexts.

## Usage

There is no keybinding for this package (irony?). Use the command palette to execute the command `search-all-keybindings:open`.  When the binding data is finished loading then input a key combination in the search box and press enter.

Examples: `ctrl-shift-x`, `shift-ctrl-X`, `ctrl-k right`, `J`, `g >`

A list of matching key bindings will be shown.  The rows are ordered with the most downloaded packages first.  Each row has:

- Number of downloads of the package
- The command, e.g. `find-and-replace:open`
- The keypress, e.g `ctrl-F`
- The scope for the binding, e.g `.workspace .editor`
  
## License

search-all-keybindings is copyright Mark Hahn by the MIT license.
