unit SysUtils;

{$INFO JAC!'s unit SysUtils;}

{$mode objfpc}

interface

procedure Jac;


implementation

const HexDigits: array[0..15] of char = '0123456789ABCDEF';

procedure Jac;
begin
end;

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

function IntToHex(Value: int64; Digits: integer): string; overload;
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

function IntToHex(Value: QWord; Digits: integer): string; overload;
begin
  result:=IntToHex(Int64(Value),Digits);
end;

function IntToHex(Value: Int8): string; overload;
begin
  Result:=IntToHex(LongInt(Value) and $ff, 2*SizeOf(Int8));
end;

function IntToHex(Value: UInt8): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(UInt8));
end;

function IntToHex(Value: Int16): string; overload;
begin
  Result:=IntToHex(LongInt(Value) and $ffff, 2*SizeOf(Int16));
end;

function IntToHex(Value: UInt16): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(UInt16));
end;

function IntToHex(Value: Int32): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(Int32));
end;

function IntToHex(Value: UInt32): string; overload;
begin
  Result:=IntToHex(LongInt(Value), 2*SizeOf(UInt32));
end;

function IntToHex(Value: Int64): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(Int64));
end;

function IntToHex(Value: UInt64): string; overload;
begin
  Result:=IntToHex(Value, 2*SizeOf(UInt64));
end;

end.

