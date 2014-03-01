transform = ( editor, up ) ->
    sCurrentWord = editor.getWordUnderCursor()
    console.log sCurrentWord
    oCurrentWordRange = editor.getCursor().getCurrentWordBufferRange()
    oPreviousCursorPosition = editor.getCursorBufferPosition()
    if not isNaN( iCurrentNumber = +sCurrentWord )
        mNewText = if up then iCurrentNumber + 1 else iCurrentNumber - 1
    if mNewText
        editor.setTextInBufferRange oCurrentWordRange, "#{ mNewText }"
        editor.setCursorBufferPosition oPreviousCursorPosition

module.exports =
    activate: ->
        atom.workspaceView.command "inc-dec-value:increment", ".editor", ->
            currentPane = atom.workspaceView.getActivePaneItem()
            transform currentPane, yes
        atom.workspaceView.command "inc-dec-value:decrement", ".editor", ->
            currentPane = atom.workspaceView.getActivePaneItem()
            transform currentPane, no
