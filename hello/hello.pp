program hello(output);

var i: Integer;
begin
(*	writeLn('Hello, World!'); *)
    for i:=1 to 100 do
    begin
		ExitCode:=i;
	end;
(*
C:\jac\system\Windows\Programming\Repositories\fpc\compiler\jvm\njvmutil.pas
An unhandled exception occurred at $005B1432:
EAccessViolation: Access violation
  $005B1432  TJVMNODEUTILS__INSERT_INIT_FINAL_TABLE,  line 410 of ./jvm/njvmutil.pas
  $0053417A  TNODEUTILS__INSERTINITFINALTABLE,  line 1106 of ngenutil.pas
  $00586444  PROC_PROGRAM_DECLARATIONS,  line 2638 of pmodules.pas
  $00586B68  PROC_PROGRAM,  line 2887 of pmodules.pas
  $00438954  COMPILE_MODULE,  line 488 of parser.pas
  $00446F87  TTASK_HANDLER__CONTINUE,  line 269 of ctask.pas
  $0041710B  COMPILE,  line 311 of compiler.pas
*)
(*	Halt(99); *)
	
end.