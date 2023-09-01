unit SysUtils;

{$INFO JAC!'s unit SysUtils;}

{$mode objfpc}

interface

{$I sysutilsh.inc}


implementation

const HexDigits: array[0..15] of char = '0123456789ABCDEF';

{   IntToHex returns a string representing the hexadecimal value of Value   }

function IntToHex(Value: Longint; Digits: integer): string; overload;
var i: integer;
begin
 If Digits=0 then
   Digits:=1;
 SetLength(result, digits);
 for i := 0 to digits - 1 do
  begin
   result[digits - i] := HexDigits[value and 15];
   value := value shr 4;
  end ;
 while value <> 0 do begin
   result := HexDigits[value and 15] + result;
   value := value shr 4;
 end;
end ;

function IntToHex_int64_digits(Value: int64; Digits: integer): string; overload;
var i: integer;
begin
 If Digits=0 then
   Digits:=1;
 SetLength(result, digits);
 for i := 0 to digits - 1 do
  begin
   result[digits - i] := HexDigits[value and 15];
   value := value shr 4;
  end ;
 while value <> 0 do begin
   result := HexDigits[value and 15] + result;
   value := value shr 4;
 end;
end ;

function IntToHex_QWord_Digits(Value: QWord; Digits: integer): string; overload;
begin
  result:=IntToHex(Int64(Value),Digits);
end;

function IntToHex_Int8(Value: Int8): string; overload;
begin
  Result:=IntToHex(LongInt(Value) and $ff, 2*SizeOf(Int8));
end;

function IntToHex_UInt8(Value: UInt8): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(UInt8));
end;

function IntToHex_Int16(Value: Int16): string; overload;
begin
  Result:=IntToHex(LongInt(Value) and $ffff, 2*SizeOf(Int16));
end;

function IntToHex_UInt16(Value: UInt16): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(UInt16));
end;

function IntToHex_Int32(Value: Int32): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(Int32));
end;

function IntToHex_UInt32(Value: UInt32): string; overload;
begin
  Result:=IntToHex(LongInt(Value), 2*SizeOf(UInt32));
end;

function IntToHex_Int64(Value: Int64): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(Int64));
end;

function IntToHex_UInt64(Value: UInt64): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(UInt64));
end;


function StrToFloat( const S: string):Extended;
begin
end;

function Now: TDateTime;
begin
end;


function DateToStr( Date: TDateTime):string;
begin
end;

function TimeToStr( Time: TDateTime):string;
begin
end;

function Format(const Fmt: string; const Args: array of Const):string;
begin
end;

end.

