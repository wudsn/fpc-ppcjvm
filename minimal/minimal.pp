program minimal;

{$ifdef cpujvm}
    uses jdk15;
	{$macro on}
	{$define writeln:=jlsystem.fout.println}
	{$define write:=jlsystem.fout.print}
{$else}
	uses SysUtils;
{$endif}

const
AllowWhiteSpaces	: set of char = [' '];
 
  BYTETOK		= 128;	// Size = 1 BYTE
  WORDTOK		= 129;	// Size = 2 WORD
  CARDINALTOK		= 130;	// Size = 4 CARDINAL
 
  UnsignedOrdinalTypes	= [BYTETOK, WORDTOK, CARDINALTOK];


procedure omin_spacje (var i:integer; var a:string);
begin

 if a<>'' then
  while (i<=length(a)) and (a[i] in AllowWhiteSpaces) do inc(i);

end;


var i: Integer;
runini:
	record
		adr: integer;
		use: Boolean;
	end;
ptr: pointer;


procedure testFileAccess;
const
  filename = 'testfile.txt';

type
   TCharFile = file of char;

var testFile: TCharFile;

begin
   (* https://wiki.freepascal.org/File_Handling_In_Pascal *)
   (* https://forum.lazarus.freepascal.org/index.php/topic,67231.0.html - PPCJVM - How to include FILEIO*)
	// Use exceptions to catch errors (this is the default so not absolutely required)
	{$I+}

{	AssignFile(testFile, filename); }

end;

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
(*  writeln(format('Address: %p',[ptr])); *) (* Does not yet work in JVM*)

    testFileAccess;
    
 end.

