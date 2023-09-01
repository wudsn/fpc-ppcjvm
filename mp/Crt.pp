unit Crt;

{$INFO JAC!'s unit Crt;}

interface

{$i crth.inc}


implementation

Procedure TextColor(Color: Byte);
{ Switch foregroundcolor }
Begin
(*  TextAttr:=(Color and $8f) or (TextAttr and $70); *)
End;

Procedure NormVideo;
{ Set normal back and foregroundcolors. }
Begin
  TextColor(7);
(*  TextBackGround(0); *)
End;


end.

