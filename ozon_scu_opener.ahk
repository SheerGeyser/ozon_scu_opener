#Requires AutoHotkey v2.0

^+z:: {
    initialBuffer := A_Clipboard
    Send("^c")
    Sleep(100)
    copiedText := A_Clipboard

    if !copiedText {
        return
    }

    matches := []
    pos := 1

    while pos := RegExMatch(copiedText, "\b\d{4,}\b", &match, pos) {
        matches.Push(match[0])
        pos += StrLen(match[0])
    }


    for id in matches {
        Run(Format("https://www.ozon.ru/product/{}", id))
        Sleep(200)
    }


    A_Clipboard := initialBuffer
    Sleep(100)
}
