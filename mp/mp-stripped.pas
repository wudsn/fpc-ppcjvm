(*

Sub-Pascal 32-bit real mode compiler for 80386+ processors v. 2.0 by Vasiliy Tereshkov, 2009

https://atariage.com/forums/topic/240919-mad-pascal/
http://atarionline.pl/forum/comments.php?DiscussionID=4825&page=1

https://habr.com/en/post/440372/?fbclid=IwAR3SdW_HAqt6psraDj41UtNxFEXIgynOUKvS2d2cwPsJiF0kO_kDTNfYZg4

IDE WUDSN
https://atariage.com/forums/topic/145386-wudsn-ide-the-free-integrated-atari-8-bit-development-plugin-for-eclipse/page/25/?tab=comments#comment-4340150


Mad-Pascal cross compiler for 6502 (Atari XE/XL) by Tomasz Biela, 2015-2023

Contributors:

+ Artyom Beilis, Marek Mauder (https://github.com/artyom-beilis/float16) :
	- Float16 (half-single)

+ Bartosz Zbytniewski :
	- Bug Hunter
	- Commodore C4+/C64 minimal unit SYSTEM setup

+ Bostjan Gorisek :
	- unit PMG, ZXLIB

+ Chriss Hutt :
	- unit SMP

+ David Schmenk :
	- IEEE-754 (32bit) Single[Float]

+ Daniel Serpell (https://github.com/dmsc) :
	- conditional directives {$IFDEF}, {$ELSE}, {$DEFINE} ...
	- unit SYSTEM: fsincos, fast SIN/COS (IEEE754-32 precision)
	- unit GRAPHICS: TextOut
	- unit GRAPHICS: TextOut
	- unit EFAST
	- unit ZX2

+ Daniel Koźmiński :
	- unit STRINGUTILS
	- unit CIO

+ Guillermo Fuenzalida :
	- unit MISC: DetectANTIC

+ Janusz Chabowski :
	- unit SHANTI

+ Jeff Johnson :
	- opt_BYTE_DIV.inc (Unsigned Integer Division Routines)

+ Jerzy Kut :
	- {$DEFINE ROMOFF}

+ Joseph Zatarski (https://forums.atariage.com/topic/225063-full-color-ansi-vbxe-terminal-in-the-works/) :
	- base\atari\vbxeansi.asm

+ Konrad Kokoszkiewicz :
	- base\atari\cmdline.asm
	- base\atari\vbxedetect.asm
	- unit MISC: DetectCPU, DetectCPUSpeed, DetectMem, DetectHighMem, DetectStereo
	- unit S2 (VBXE handler)

+ Krzysztof Dudek (http://xxl.atari.pl/) :
	- unit XBIOS: BLIBS library
	- unit LZ4: unLZ4
	- unit aPLib: unAPL

+ Marcin Żukowski :
	- unit FASTGRAPH: fLine

+ Michael Jaskula :
	- {$DEFINE BASICOFF} (base\atari\basicoff.asm)

+ Piotr Fusik (https://github.com/pfusik) :
	- base\common\shortreal.asm (div24by15)
	- base\runtime\icmp.asm
	- unit GRAPH: detect X:Y graphics resolution (OS mode)
	- unit CRC
	- unit DEFLATE: unDEF

+ Sebastian Igielski :
	- unit MISC: DetectStereo

+ Steven Don (https://www.shdon.com/) :
	- unit IMAGE, VIMAGE: BMP, GIF, PCX

+ Ullrich von Bassewitz, Christian Krueger (https://github.com/cc65/cc65/libsrc/common/) :
	- base\common\memmove.asm
	- base\common\memset.asm

+ Ullrich von Bassewitz (https://github.com/cc65/cc65/libsrc/runtime/) :
	- 8x8 => 16 multiplication routine (base\common\byte.asm)
	- 16x8 => 24 multiplication routine (base\common\word.asm)
	- 16x16 => 32 multiplication routine (base\common\word.asm)

+ Wojciech Bociański (http://bocianu.atari.pl/) :
	- library BLIBS: B_CRT, B_DL, B_PMG, B_SYSTEM, B_UTILS, XBIOS
	- MADSTRAP
	- PASDOC


# rejestr X (=$FF) uzywany jest do przekazywania parametrow przez programowy stos :STACKORIGIN
# stos programowy sluzy tez do tymczasowego przechowywania wyrazen, wynikow operacji itp.

# typ REAL Fixed-Point Q16.16 przekracza 32 bity dla MUL i DIV, czesty OVERFLOW

# uzywaj asm65('') zamiast #13#10, POS bedzie wlasciwie zwracalo indeks

# parametry dla imulCL, imulCX w konkretnej kolejnosci 1: ECX, 2: EAX

# wystepuja tylko skoki w przod @+ (@- nie wystepuja)

# s[x][0..3] := '';            -> lda :STACKORIGIN+...
# s[x][0..3] := #9'mva #$00';  -> lda #$00

# :edx+2, :edx+3 nie wystepuje

# 'register' dla procedury/funkcji alokuje parametry na stronie zerowej 1: EDX, 2: ECX, 3: EAX
# 'register' dla zmiennych alokuje maksymalnie 16 bajtow zmniejszajac licznik 1: :TMP, 2: :ECX, 3: :EDX, 4: :EAX

# jeq, jne, jcc, jcs, jmi, jpl l_xxxx

# wartosc dla typu POINTER zwiekszana jest o CODEORIGIN

# indeks do tablicy zawsze promowany jest do typu WORD

# :BP  tylko przy adresowaniu 1-go bajtu, :BP = $00 !!!, zmienia sie tylko :BP+1
# :BP2 przy adresowaniu wiecej niz 1-go bajtu (WORD, CARDINAL itd.)

# indeks dla jednowymiarowej tablicy [0..x] = a * DataSize[AllocElementType]
# indeks dla dwuwymiarowej tablicy [0..x, 0..y] = a * ((y+1) * DataSize[AllocElementType]) + b * DataSize[AllocElementType]

# dla typu OBJECT przekazywany jest poczatkowy adres alokacji danych pamieci (HI = regY, LO = regA), potem sa obliczane kolejne adresy w naglowku procedury/funkcji

# podczas wartosciowania wyrazen typy sa roszerzane, w przypadku operacji '-' promowane do SIGNEDORDINALTYPES (BYTE -> SMALLINTTOK ; WORD -> INTEGERTOK)

# (Tok[ ].Kind = ASMTOK + Tok[ ].Value = 0) wersja z { }
# (Tok[ ].Kind = ASMTOK + Tok[ ].Value = 1) wersja bez { }

# --------------------------------------------------------------------------------------------------------------
#                          |      DataType      |  AllocElementType  |  NumAllocElements  |  NumAllocElements_ |
# --------------------------------------------------------------------------------------------------------------
# VAR RECORD               | RECORDTOK          | 0                  | RecType            | 0                  |
# VAR ^RECORD              | POINTERTOK         | RECORDTOK          | RecType            | 0                  |
# ARRAY [0..X]             | POINTERTOK         | Type               | X Array Size       | 0                  |
# ARRAY [0..X, 0..Y]       | POINTERTOK         | Type               | X Array Size       | Y Array Size       |
# ARRAY [0..X] OF ^RECORD  | POINTERTOK         | RECORDTOK          | RecType            | X Array Size       |
# ARRAY [0..X] OF ^OBJECT  | POINTERTOK         | OBJECTTOK          | RecType            | X Array Size       |
# --------------------------------------------------------------------------------------------------------------

*)


program MADPASCAL;

{$i define.inc}

uses
	Crt, SysUtils,

{$IFDEF WINDOWS}
	Windows,
{$ENDIF}

	Common, Messages, Scanner, Parser, Optimize, Diagnostic,
	SystemJVM;

{$INFO JAC! mp.pas}

function Tab2Space(a: string; spc: byte = 8): string;
var column, nextTabStop: integer;
    ch: char;
begin

 Result := '';
 column:=0;

 for ch in a do
  case ch of

   #9:
	begin
		nextTabStop := (column + spc) div spc * spc;
		while column <> nextTabStop do begin Result := Result + ' '; inc(column) end;
	end;

   CR, LF:
	begin
		Result := Result + ch;
		column:=0;
        end;

  else
		Result := Result + ch;
		inc(column);
  end;

end;

// Main program

begin

{$IFDEF WINDOWS}
 if GetFileType(GetStdHandle(STD_OUTPUT_HANDLE)) = 3 then begin
  Assign(Output, ''); Rewrite(Output);
 end;
{$ENDIF}

//WriteLn('Sub-Pascal 32-bit real mode compiler v. 2.0 by Vasiliy Tereshkov, 2009');



end.
