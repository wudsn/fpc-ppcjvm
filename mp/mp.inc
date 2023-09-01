{$ifdef fpc}
  {$mode objfpc}
{$endif}

{$ifdef cpujvm}
uses
  {$ifdef java}jdk15{$else}androidr14{$endif}
(* ,Sysutils *)
  ;
 
{$macro on}
{$define writeln:=jlsystem.fout.println}
{$define write:=jlsystem.fout.println}

{$endif}


(* https://www.freepascal.org/docs-html/prog/progsu38.html#x45-440001.2.38 *)
(* {$IOCHECKS OFF}  *
/ *{$I-} *) 


(*
type THandle = LongInt;
{$I filerec.inc}
{$I textrec.inc}
type TextFile = file of char;
type ByteFile = file of byte;

Function  FileSize(var f):Int64; forward;  
procedure Move( const source;  var dest;  count: SizeInt); forward;

function IntToHex(  Value: LongInt;  Digits: Integer):string; forward;

*)