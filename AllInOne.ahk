#NoEnv
#SingleInstance Force
#Persistent
#InstallKeybdHook
#InstallMouseHook
SendMode Input
SetBatchLines, -1
SetKeyDelay, -1

; =============================================
;  ALL-IN-ONE AUTOMATION SCRIPT
;  Made by combining all your AHK scripts
; =============================================
;
;  HOTKEY REFERENCE (press to toggle ON/OFF):
;
;  F1  = Spam F + Space + Left Click (Genshin skip)
;  F2  = Fast Left Click Spam
;  F3  = Left Click every 30 seconds
;  F4  = Hold W (Fortnite AFK)
;  F5  = W + Q/E every 10 seconds
;  F6  = Subtle W movement every 1 min (Fortnite anti-AFK)
;  F7  = Spam E key
;  F8  = Mouse movement (Spotify anti-idle)
;  F9  = Slow Left Click every 1 second
;  F10 = Spam Spacebar
;
;  F12 = STOP ALL active modes
;  Alt+X = Exit script entirely
;
;  Each mode shows a ToolTip when toggled.
; =============================================

; --- Toggle states ---
t_genshin   := false
t_fastclick := false
t_slow30    := false
t_holdw     := false
t_qe        := false
t_subtle    := false
t_spame     := false
t_spotify   := false
t_slowclick := false
t_spacespam := false

; =============================================
;  F1 - Genshin Skip (F + Space + Click)
; =============================================
F1::
    t_genshin := !t_genshin
    if (t_genshin) {
        ToolTip, [F1] Genshin Skip: ON
        SetTimer, GenshinKeys, 0
    } else {
        ToolTip, [F1] Genshin Skip: OFF
        SetTimer, GenshinKeys, Off
        Sleep, 800
        ToolTip
    }
return

GenshinKeys:
    SendEvent, f{Space}
    Click
return

; =============================================
;  F2 - Fast Left Click Spam
; =============================================
F2::
    t_fastclick := !t_fastclick
    if (t_fastclick) {
        ToolTip, [F2] Fast Click Spam: ON
        SetTimer, FastClick, 0
    } else {
        ToolTip, [F2] Fast Click Spam: OFF
        SetTimer, FastClick, Off
        Sleep, 800
        ToolTip
    }
return

FastClick:
    Click
return

; =============================================
;  F3 - Left Click every 30 seconds
; =============================================
F3::
    t_slow30 := !t_slow30
    if (t_slow30) {
        ToolTip, [F3] Click every 30s: ON
        SetTimer, Click30s, 30000
    } else {
        ToolTip, [F3] Click every 30s: OFF
        SetTimer, Click30s, Off
        Sleep, 800
        ToolTip
    }
return

Click30s:
    Click
return

; =============================================
;  F4 - Hold W (Fortnite AFK)
; =============================================
F4::
    t_holdw := !t_holdw
    if (t_holdw) {
        ToolTip, [F4] Hold W: ON
        SetTimer, HoldW, 0
    } else {
        ToolTip, [F4] Hold W: OFF
        SetTimer, HoldW, Off
        Send, {W up}
        Sleep, 800
        ToolTip
    }
return

HoldW:
    Send, {W down}
return

; =============================================
;  F5 - Hold W + Q/E every 10 seconds
; =============================================
F5::
    t_qe := !t_qe
    if (t_qe) {
        ToolTip, [F5] W + Q/E: ON
        Send, {w down}
        SetTimer, PressQE, 10000
    } else {
        ToolTip, [F5] W + Q/E: OFF
        SetTimer, PressQE, Off
        Send, {w up}
        Sleep, 800
        ToolTip
    }
return

PressQE:
    Send, qe
return

; =============================================
;  F6 - Subtle W every 1 min (anti-AFK)
; =============================================
F6::
    t_subtle := !t_subtle
    if (t_subtle) {
        ToolTip, [F6] Subtle W every 1min: ON
        SetTimer, SubtleW, 60000
    } else {
        ToolTip, [F6] Subtle W every 1min: OFF
        SetTimer, SubtleW, Off
        Sleep, 800
        ToolTip
    }
return

SubtleW:
    Send, {W down}
    Sleep, 500
    Send, {W up}
return

; =============================================
;  F7 - Spam E key
; =============================================
F7::
    t_spame := !t_spame
    if (t_spame) {
        ToolTip, [F7] Spam E: ON
        SetTimer, SpamE, 50
    } else {
        ToolTip, [F7] Spam E: OFF
        SetTimer, SpamE, Off
        Sleep, 800
        ToolTip
    }
return

SpamE:
    Send, {e}
return

; =============================================
;  F8 - Mouse Movement (Spotify anti-idle)
; =============================================
F8::
    t_spotify := !t_spotify
    if (t_spotify) {
        ToolTip, [F8] Mouse Move: ON
        SetTimer, MouseMoveLoop, 15
    } else {
        ToolTip, [F8] Mouse Move: OFF
        SetTimer, MouseMoveLoop, Off
        Sleep, 800
        ToolTip
    }
return

MouseMoveLoop:
    MouseMove, 1, 1, 0, R
return

; =============================================
;  F9 - Slow Click every 1 second
; =============================================
F9::
    t_slowclick := !t_slowclick
    if (t_slowclick) {
        ToolTip, [F9] Slow Click 1s: ON
        SetTimer, SlowClick, 1000
    } else {
        ToolTip, [F9] Slow Click 1s: OFF
        SetTimer, SlowClick, Off
        Sleep, 800
        ToolTip
    }
return

SlowClick:
    Click
return

; =============================================
;  F10 - Spam Spacebar
; =============================================
F10::
    t_spacespam := !t_spacespam
    if (t_spacespam) {
        ToolTip, [F10] Spam Spacebar: ON
        SetTimer, SpamSpace, 50
    } else {
        ToolTip, [F10] Spam Spacebar: OFF
        SetTimer, SpamSpace, Off
        Sleep, 800
        ToolTip
    }
return

SpamSpace:
    Send, {Space}
return

; =============================================
;  F12 - STOP ALL
; =============================================
F12::
    ; Turn off all timers
    SetTimer, GenshinKeys, Off
    SetTimer, FastClick, Off
    SetTimer, Click30s, Off
    SetTimer, HoldW, Off
    SetTimer, PressQE, Off
    SetTimer, SubtleW, Off
    SetTimer, SpamE, Off
    SetTimer, MouseMoveLoop, Off
    SetTimer, SlowClick, Off
    SetTimer, SpamSpace, Off

    ; Release any held keys
    Send, {W up}
    Send, {w up}

    ; Reset all toggles
    t_genshin   := false
    t_fastclick := false
    t_slow30    := false
    t_holdw     := false
    t_qe        := false
    t_subtle    := false
    t_spame     := false
    t_spotify   := false
    t_slowclick := false
    t_spacespam := false

    ToolTip, ALL MODES STOPPED
    Sleep, 1000
    ToolTip
return

; =============================================
;  Alt+X - Exit script entirely
; =============================================
!x::
    Send, {W up}
    Send, {w up}
    ToolTip, Script exited.
    Sleep, 500
    ExitApp
return
