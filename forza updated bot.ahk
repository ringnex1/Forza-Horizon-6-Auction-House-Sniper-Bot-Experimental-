; Press F6 to start/stop

toggle := false

whiteX := 740
whiteY := 320
whiteColor := 0xFFFFFF

yellowX := 200
yellowY := 331
yellowColor := 0xEADE00

variation := 30

F6::
toggle := !toggle

while (toggle)
{
    ; First Enter
    Send, {Enter}
    Sleep, 200

    ; Second Enter
    Send, {Enter}
    Sleep, 820

    ; ===== CHECK YELLOW FIRST =====
    PixelSearch, foundX, foundY, yellowX, yellowY, yellowX, yellowY, yellowColor, variation, RGB

    if (ErrorLevel = 0)
    {
        ; Yellow found
        Send, {Esc}
        Sleep, 650
        continue
    }

    ; ===== CHECK WHITE =====
    PixelSearch, foundX, foundY, whiteX, whiteY, whiteX, whiteY, whiteColor, variation, RGB

    if (ErrorLevel = 0)
    {
        ; White found

        Send, y
        Sleep, 190

        Send, {Down}
        Sleep, 180

        Send, {Enter}
        Sleep, 180

        Send, {Enter}
        Sleep, 4000

        Send, {Enter}
        Sleep, 250

        Send, {Escape}
        Sleep, 250

        Send, {Escape}
        Sleep, 700
    }
    else
    {
        ; Neither found

        Send, {Esc}
        Sleep, 650
    }
}

return

`::
ExitApp
return