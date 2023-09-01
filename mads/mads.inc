{$ifdef fpc}
(* {$mode objfpc}*)
  {$mode Delphi} 
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



type THandle = LongInt;
{$I filerec.inc}
{$I textrec.inc}
type TextFile = file of char;
type ByteFile = file of byte;

(*{$I systemh.inc}*)
(*{$I jsystemh.inc}*)
Function  FileSize(var f):Int64; forward;  
procedure Move( const source;  var dest;  count: SizeInt); forward;

(* Unit crt *)
(*{$I C:\jac\system\Windows\Programming\Repositories\fpc\packages\rtl-console\src\inc\crth.inc}*)
{$I crth.inc}
