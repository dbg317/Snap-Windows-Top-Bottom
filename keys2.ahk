;-------------------------------------------------------------------;
; Returns the maximum or minimum value for any number of inputs
; i.e. Max(5,4,7,10) will return 10
;-------------------------------------------------------------------;
Min(params*)
{
  r := params[1]
  for index, param in params
    if (param < r)
      r := param
  return r
}
Max(params*)
{
  r := params[1]
  for index, param in params
    if (param > r)
      r := param
  return r
}

;-------------------------------------------------------------------;
; WindowsKey+Ctrl+Up / WindowsKey+Ctrl+Down
; Resizes window to half the screen height and moves it to the top
; or bottom of whichever screen has the largest overlap.
; By default, the window retains its horizontal (x) position and
; width.  To change this, uncomment the WinMaximize line.
;-------------------------------------------------------------------;
UpDownSnap(Direction)
{
  ; WinMaximize, A
  WinGetPos, x, y, w, h, a, , ,
  SysGet , Count, MonitorCount
  refArea := 0
  Loop, %count%
  {
    SysGet, m, MonitorWorkArea, %A_Index%
    xo := Max(0, Min(x + w, mRight) - Max(x, mLeft))
    yo := Max(0, Min(y + h, mBottom) - Max(y, mTop))
    area := xo * yo
    if (area > refArea)
    {
      monTop := mTop
      monBottom := mBottom
      refArea := area
    }
  }

  ; If the refArea is still equal to 0, the window does
  ; not overlap with any monitors. Wat?
  if (refArea > 0)
  {
    if (direction = 1)
      newY := monTop
    Else
      newY := (monBottom - monTop) / 2 + monTop
    WinMove , a, , x, newY, w, (monBottom - monTop) / 2
  }
}
^#Up::UpDownSnap(1)
^#Down::UpDownSnap(0)