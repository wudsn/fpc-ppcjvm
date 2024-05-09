program minimal;

{$ifdef fpc}
  {$mode objfpc}
{$endif}

{$ifdef cpujvm}
uses
  {$ifdef java}jdk15{$else}androidr14{$endif}
  ,Common
  ;

{$macro on}
{$define writeln:=jlsystem.fout.println}
{$define write:=jlsystem.fout.print}
{$else}
uses Crt, SysUtils;
{$endif}


const
AllowWhiteSpaces	: set of char = [' '];
 
  BYTETOK		= 128;	// Size = 1 BYTE
  WORDTOK		= 129;	// Size = 2 WORD
  CARDINALTOK		= 130;	// Size = 4 CARDINAL
 
  UnsignedOrdinalTypes	= [BYTETOK, WORDTOK, CARDINALTOK];




procedure omin_spacje (var i:integer; var a:string);
(*----------------------------------------------------------------------------*)
(*  omijamy tzw. "biale spacje" czyli spacje, tabulatory		      *)
(*----------------------------------------------------------------------------*)
begin

 if a<>'' then
  while (i<=length(a)) and (a[i] in AllowWhiteSpaces) do inc(i);

end;

var i: Integer;
runini      : record
               adr: integer;
               use: Boolean;
              end;
ptr: pointer;

begin
  writeln('Hello FPC');
  for i:=0 to 9 do
  begin
   write(i);
   write(' ');
  end;
  writeln();
  
  runini.adr := 1;
  runini.use := true;
  ptr := addr(runini);
  writeln(format('Address: %p',[ptr]));
(*
  repeat
  until not KeyPressed;
  repeat
  until KeyPressed;
  *)
end.

