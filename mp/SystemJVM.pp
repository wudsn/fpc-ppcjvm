unit SystemJVM;

{$mode objfpc}

{$INFO JAC!'s unit SystemJVM;}

interface

{$I systemjvmh.inc}

implementation

function FileExists(const FileName: string;  FollowLink: Boolean = True ):Boolean;
begin
  result:=false;
end;


function ChangeFileExt( const FileName: string; const Extension: string):string;
begin
end;

function IncludeTrailingPathDelimiter( const Path: string):string;
begin
end;

function ExtractFileName( const FileName: string):string;
begin
end;

function ExtractFilePath( const FileName: string):string;
begin
end;


function UpperCase( const s: string):string;
begin
end;

function AnsiUpperCase( const s: string ):string;
begin
end;

end.

