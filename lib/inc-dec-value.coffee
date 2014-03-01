rMatchNumber = /(-*[0-9]+(?:\.[0-9]+)?)([^0-9]*)?/

transform = ( editor, up ) ->
    sCurrentWord = editor.getWordUnderCursor()
    oCurrentWordRange = editor.getCursor().getCurrentWordBufferRange()
    oPreviousCursorPosition = editor.getCursorBufferPosition()

    if aMatches = sCurrentWord.match rMatchNumber
        iCurrentNumber = parseFloat aMatches[ 1 ]
        iNewNumber = if up then iCurrentNumber + 1 else iCurrentNumber - 1
        sNewText = "#{ iNewNumber }" + if aMatches[ 2 ]? then aMatches[ 2 ] else ""

    if sNewText
        editor.setTextInBufferRange oCurrentWordRange, "#{ sNewText }"
        editor.setCursorBufferPosition oPreviousCursorPosition

module.exports =
    activate: ->
        atom.workspaceView.command "inc-dec-value:increment", ".editor", ->
            currentPane = atom.workspaceView.getActivePaneItem()
            transform currentPane, yes
        atom.workspaceView.command "inc-dec-value:decrement", ".editor", ->
            currentPane = atom.workspaceView.getActivePaneItem()
            transform currentPane, no
