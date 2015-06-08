;
;       Z50-Z100                   Z50-Z0	
;
;          5                          6
;
;      9                                 4
;                  7       8           3   2
;                                        1
;             POV0
;       POV2700  POV9000         10
;           POV1800
#Persistent
#SingleInstance

bikemode = false

Loop
{
	GetKeyState, jpov, JoyPOV
	if (jpov = 0) ; Up on Dpad
	{
		SendInput {Insert Down}
		SendInput {g Down}
		SendInput {Numpad8 Down}
		SendInput {x Down}
		Sleep, 30
		SendInput {Insert Up}
		SendInput {g Up}

		While (jpov = 0)
		{
			GetKeyState, jpov, JoyPOV
			SendInput {Numpad8 Down}
			SendInput {x Down}
			Sleep, 30
		}
		SendInput {Numpad8 Up}
		SendInput {x Up}
	}

	if (jpov = 9000) ; Right on Dpad
	{
		SendInput {y Down}
		SendInput {Tab Down}
		Sleep, 30
		SendInput {y Up}

		While (jpov = 9000)
		{
			GetKeyState, jpov, JoyPOV
			SendInput {Tab Down}
			Sleep, 30
		}
		SendInput {Tab Up}
	}

	if (jpov = 18000) ; Down on Dpad
	{
		SendInput {Delete Down}
		SendInput {h Down}
		SendInput {Numpad2 Down}
		SendInput {z Down}
		Sleep, 30
		SendInput {Delete Up}
		SendInput {h Up}

		While (jpov = 18000)
		{
			GetKeyState, jpov, JoyPOV
			SendInput {Numpad2 Down}
			SendInput {z Down}
			Sleep, 30
		}
		SendInput {Numpad2 Up}
		SendInput {z Up}
	}

	if (jpov = 27000) ; Left on Dpad
	{
		SendInput {n Down}
		Sleep, 30
		SendInput {n Up}
	}

	;ToolTip, jpov
	Sleep, 100
}

Joy1:: ; A button
	SendInput {j Down}

	if (bikemode) {
		SendInput {w Down}
	}
	else {
		SendInput {Space Down}
	}
	While GetKeyState("Joy1", "p")
	{
		Sleep, 30
		SendInput {j Down}
		if (bikemode) {
			SendInput {w Down}
		}
		else {
			SendInput {Space Down}
		}
	}
	SendInput {j Up}
	if (bikemode) {
		SendInput {w Up}
	}
	else {
		SendInput {Space Up}
	}
Return

Joy2:: ; B button
	SendInput  {LControl Down}
	While GetKeyState("Joy2", "p")
	{
		Sleep, 30
		SendInput {LControl Down}
	}
	SendInput {LControl Up}
Return

Joy3:: ; X button
	SendInput {RControl Down}
	SendInput {LShift Down}
	While GetKeyState("Joy3", "p")
	{
		Sleep, 30
		SendInput {RControl Down}
		SendInput {LShift Down}
	}
	SendInput {RControl Up}
	SendInput {LShift Up}
Return

Joy4:: ; Y button
	SendInput {f Down}
	While GetKeyState("Joy4", "p")
	{
		Sleep, 30
		SendInput {f Down}
	}
	SendInput {f Up}
Return

Joy5:: ; Left bumper
	SendInput {q Down}
	While GetKeyState("Joy5", "p")
	{
		Sleep, 30
		SendInput {q Down}
	}
	SendInput {q Up}
Return

Joy6:: ; Right bumper
	SendInput {e Down}
	While GetKeyState("Joy6", "p")
	{
		Sleep, 30
		SendInput {e Down}
		if GetKeyState("Joy1", "p") {
			bikemode := !bikemode
			Sleep, 1000
		}
	}
	SendInput {e Up}
Return

Joy7:: ; Select button
	SendInput {v Down}
	Sleep, 30
	SendInput {v Up}
Return

Joy9:: ; Left Stick click
	SendInput {c Down}
	SendInput {CapsLock Down}
	While GetKeyState("Joy9", "p")
	{
		Sleep, 30
		SendInput {c Down}
		SendInput {CapsLock Down}
	}
	SendInput {c Up}
	SendInput {CapsLock Up}
Return

Joy10:: ; Right Stick click
	x = 0
	SendInput {MButton Down}
	While GetKeyState("Joy10", "p")
	{
		Sleep, 30
		SendInput {MButton Down}
		x++
	}
	SendInput {MButton Up}
	if (x < 8)
	{
		SendInput {2 Down}
		Sleep, 30
		SendInput {2 Up}
	}
Return
