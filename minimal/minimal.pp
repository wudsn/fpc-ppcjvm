program minimal;

{$ifdef fpc}
  {$mode objfpc}
{$endif}

{$ifdef cpujvm}
uses
  {$ifdef java}jdk15{$else}androidr14{$endif};

{$macro on}
{$define writeln:=jlsystem.fout.println}
{$define write:=jlsystem.fout.print}

{$endif}

const
AllowWhiteSpaces	: set of char = [' '];
 
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
begin
  writeln('Hello FPC');
  for i:=0 to 9 do
  begin
   write(i);
   write(' ');
  end;
  
  runini.adr := 1;
  runini.use := true;
end.

