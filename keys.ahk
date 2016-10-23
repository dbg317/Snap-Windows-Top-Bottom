; Move window up (Windows + Shift + UP ... NOTE must maximize window first)
+#Up::
  WinGetPos,X,Y,W,H,A,,,
  WinMaximize
  WinGetPos,TX,TY,TW,TH,ahk_class Shell_TrayWnd,,,

  ; if this is greater than 1, we're on the secondary (right) monitor. This
  ;   means the center of the active window is a positive X coordinate
  if ( X + W/2 > 0 ) {
  SysGet, MonitorWorkArea, MonitorWorkArea, 1
  WinMove,A,,X,0 , , (MonitorWorkAreaBottom/2)
  }
  else {
  SysGet, MonitorWorkArea, MonitorWorkArea, 2
  WinMove,A,,X,0 , , (MonitorWorkAreaBottom/2)
  }
return

; Move window down (Windows + Shift + DOWN ... NOTE must maximize window first)
+#Down::
  WinGetPos,X,Y,W,H,A,,,
  WinMaximize
  WinGetPos,TX,TY,TW,TH,ahk_class Shell_TrayWnd,,,

  ; if this is greater than 1, we're on the secondary (right) monitor. This
  ;   means the center of the active window is a positive X coordinate
  if ( X + W/2 > 0 ) {
  SysGet, MonitorWorkArea, MonitorWorkArea, 1
  WinMove,A,,X,MonitorWorkAreaBottom/2 , , (MonitorWorkAreaBottom/2)
  }
  else {
  SysGet, MonitorWorkArea, MonitorWorkArea, 2
  WinMove,A,,X,MonitorWorkAreaBottom/2 , , (MonitorWorkAreaBottom/2)
  }
return