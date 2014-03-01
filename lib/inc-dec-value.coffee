module.exports =
    activate: ->
        atom.workspaceView.command 'inc-dec-value:increment', '.editor', ->
            editor = atom.workspaceView.getActivePaneItem()
            increment editor
        atom.workspaceView.command 'inc-dec-value:decrement', '.editor', ->
            editor = atom.workspaceView.getActivePaneItem()
            decrement editor

increment = ( editor ) ->

decrement = ( editor ) ->
