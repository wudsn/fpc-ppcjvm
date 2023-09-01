function IntToHex(Value: Longint; Digits: integer): string; overload;
function IntToHex_Int64_Digits(Value: Int64; Digits: integer): string; overload;
function IntToHex_QWord_Digits(Value: QWord; Digits: integer): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_Int8(Value: Int8): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_UInt8(Value: UInt8): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_Int16(Value: Int16): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_UInt16(Value: UInt16): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_Int32(Value: Int32): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_UInt32(Value: UInt32): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_Int64(Value: Int64): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;
function IntToHex_UInt64(Value: UInt64): string; {$ifdef SYSUTILSINLINE}inline;{$ENDIF} overload;


function StrToFloat( const S: string):Extended;

function Now: TDateTime;
function DateToStr( Date: TDateTime):string;
function TimeToStr( Time: TDateTime):string;

(* TFormatSettings/DefaultFormatSettings *)
{$I C:\jac\system\Windows\Programming\Repositories\fpc\rtl\objpas\sysutils\sysinth.inc}

function Format(const Fmt: string; const Args: array of Const):string;