unit Common;

interface

{$i define.inc}

// ----------------------------------------------------------------------------

const

  title = '1.6.9';

  TAB = ^I;		// Char for a TAB
  CR  = ^M;		// Char for a CR
  LF  = ^J;		// Char for a LF

  AllowDirectorySeparators : set of char = ['/','\'];

  AllowWhiteSpaces	: set of char = [' ',TAB,CR,LF];
  AllowQuotes		: set of char = ['''','"'];
  AllowLabelFirstChars	: set of char = ['A'..'Z','_'];
  AllowLabelChars	: set of char = ['A'..'Z','0'..'9','_','.'];
  AllowDigitFirstChars	: set of char = ['0'..'9','%','$'];
  AllowDigitChars	: set of char = ['0'..'9','A'..'F'];


  // Token codes

  UNTYPETOK		= 0;

  CONSTTOK		= 1;     // !!! nie zmieniac
  TYPETOK		= 2;     // !!!
  VARTOK		= 3;     // !!!
  PROCEDURETOK		= 4;     // !!!
  FUNCTIONTOK		= 5;     // !!!
  LABELTOK		= 6;	 // !!!
  UNITTOK		= 7;	 // !!!


  GETINTVECTOK		= 10;
  SETINTVECTOK		= 11;
  CASETOK		= 12;
  BEGINTOK		= 13;
  ENDTOK		= 14;
  IFTOK			= 15;
  THENTOK		= 16;
  ELSETOK		= 17;
  WHILETOK		= 18;
  DOTOK			= 19;
  REPEATTOK		= 20;
  UNTILTOK		= 21;
  FORTOK		= 22;
  TOTOK			= 23;
  DOWNTOTOK		= 24;
  ASSIGNTOK		= 25;
  WRITETOK		= 26;
  READLNTOK		= 27;
  HALTTOK		= 28;
  USESTOK		= 29;
  ARRAYTOK		= 30;
  OFTOK			= 31;
  STRINGTOK		= 32;
  INCTOK		= 33;
  DECTOK		= 34;
  ORDTOK		= 35;
  CHRTOK		= 36;
  ASMTOK		= 37;
  ABSOLUTETOK		= 38;
  BREAKTOK		= 39;
  CONTINUETOK		= 40;
  EXITTOK		= 41;
  RANGETOK		= 42;

  EQTOK			= 43;
  NETOK			= 44;
  LTTOK			= 45;
  LETOK			= 46;
  GTTOK			= 47;
  GETOK			= 48;
  LOTOK			= 49;
  HITOK			= 50;

  DOTTOK		= 51;
  COMMATOK		= 52;
  SEMICOLONTOK		= 53;
  OPARTOK		= 54;
  CPARTOK		= 55;
  DEREFERENCETOK	= 56;
  ADDRESSTOK		= 57;
  OBRACKETTOK		= 58;
  CBRACKETTOK		= 59;
  COLONTOK		= 60;

  PLUSTOK		= 61;
  MINUSTOK		= 62;
  MULTOK		= 63;
  DIVTOK		= 64;
  IDIVTOK		= 65;
  MODTOK		= 66;
  SHLTOK		= 67;
  SHRTOK		= 68;
  ORTOK			= 69;
  XORTOK		= 70;
  ANDTOK		= 71;
  NOTTOK		= 72;

  ASSIGNFILETOK		= 73;
  RESETTOK		= 74;
  REWRITETOK		= 75;
  APPENDTOK		= 76;
  BLOCKREADTOK		= 77;
  BLOCKWRITETOK		= 78;
  CLOSEFILETOK		= 79;
  GETRESOURCEHANDLETOK	= 80;
  SIZEOFRESOURCETOK     = 81;

  WRITELNTOK		= 82;
  SIZEOFTOK		= 83;
  LENGTHTOK		= 84;
  HIGHTOK		= 85;
  LOWTOK		= 86;
  INTTOK		= 87;
  FRACTOK		= 88;
  TRUNCTOK		= 89;
  ROUNDTOK		= 90;
  ODDTOK		= 91;

  PROGRAMTOK		= 92;
  LIBRARYTOK		= 93;
  EXPORTSTOK		= 94;
  EXTERNALTOK		= 95;
  INTERFACETOK		= 96;
  IMPLEMENTATIONTOK     = 97;
  INITIALIZATIONTOK     = 98;
  CONSTRUCTORTOK	= 99;
  DESTRUCTORTOK		= 100;
  OVERLOADTOK		= 101;
  ASSEMBLERTOK		= 102;
  FORWARDTOK		= 103;
  REGISTERTOK		= 104;
  INTERRUPTTOK		= 105;
  PASCALTOK		= 106;
  STDCALLTOK		= 107;
  INLINETOK		= 108;
  KEEPTOK		= 109;

  SUCCTOK		= 110;
  PREDTOK		= 111;
  PACKEDTOK		= 112;
  GOTOTOK		= 113;
  INTOK			= 114;
  VOLATILETOK		= 115;


  SETTOK		= 127;	// Size = 32 SET OF

  BYTETOK		= 128;	// Size = 1 BYTE
  WORDTOK		= 129;	// Size = 2 WORD
  CARDINALTOK		= 130;	// Size = 4 CARDINAL
  SHORTINTTOK		= 131;	// Size = 1 SHORTINT
  SMALLINTTOK		= 132;	// Size = 2 SMALLINT
  INTEGERTOK		= 133;	// Size = 4 INTEGER
  CHARTOK		= 134;	// Size = 1 CHAR
  BOOLEANTOK		= 135;	// Size = 1 BOOLEAN
  POINTERTOK		= 136;	// Size = 2 POINTER
  STRINGPOINTERTOK	= 137;	// Size = 2 POINTER to STRING
  FILETOK		= 138;	// Size = 2/12 FILE
  RECORDTOK		= 139;	// Size = 2/???
  OBJECTTOK		= 140;	// Size = 2/???
  SHORTREALTOK		= 141;	// Size = 2 SHORTREAL			Fixed-Point Q8.8
  REALTOK		= 142;	// Size = 4 REAL			Fixed-Point Q24.8
  SINGLETOK		= 143;	// Size = 4 SINGLE / FLOAT		IEEE-754 32bit
  HALFSINGLETOK		= 144;	// Size = 2 HALFSINGLE / FLOAT16	IEEE-754 16bit
  PCHARTOK		= 145;	// Size = 2 POINTER TO ARRAY OF CHAR
  ENUMTOK		= 146;	// Size = 1 BYTE
  PROCVARTOK		= 147;	// Size = 2
  TEXTFILETOK		= 148;	// Size = 2/12 FILE
  FORWARDTYPE		= 149;	// Size = 2

  SHORTSTRINGTOK	= 150;	// zamieniamy na STRINGTOK
  FLOATTOK		= 151;	// zamieniamy na SINGLETOK
  FLOAT16TOK		= 152;	// zamieniamy na HALFSINGLETOK
  TEXTTOK		= 153;	// zamieniamy na TEXTFILETOK

  DEREFERENCEARRAYTOK	= 154;	// dla wskaznika do tablicy


  DATAORIGINOFFSET	= 160;
  CODEORIGINOFFSET	= 161;

  IDENTTOK		= 180;
  INTNUMBERTOK		= 181;
  FRACNUMBERTOK		= 182;
  CHARLITERALTOK	= 183;
  STRINGLITERALTOK	= 184;

  LOOPUNROLLTOK		= 185;
  NOLOOPUNROLLTOK	= 186;
  LINKTOK		= 187;
  MACRORELEASE		= 188;
  PROCALIGNTOK		= 189;
  LOOPALIGNTOK		= 190;
  LINKALIGNTOK		= 191;
  INFOTOK		= 192;
  WARNINGTOK		= 193;
  ERRORTOK		= 194;
  UNITBEGINTOK		= 195;
  UNITENDTOK		= 196;
  IOCHECKON		= 197;
  IOCHECKOFF		= 198;
  EOFTOK		= 199;     // MAXTOKENNAMES = 200

{$INFO TEST Common.pas }
  UnsignedOrdinalTypes: set of byte = [BYTETOK, WORDTOK, CARDINALTOK];
  SignedOrdinalTypes: set of byte = [SHORTINTTOK, SMALLINTTOK, INTEGERTOK];
  RealTypes: set of byte	= [SHORTREALTOK, REALTOK, SINGLETOK, HALFSINGLETOK];

  IntegerTypes: set of byte	= UnsignedOrdinalTypes+SignedOrdinalTypes;
  OrdinalTypes: set of byte	= IntegerTypes + [CHARTOK, BOOLEANTOK, ENUMTOK];

  Pointers: set of byte		= [POINTERTOK, PROCVARTOK, STRINGPOINTERTOK];

  AllTypes: set of byte		= OrdinalTypes + RealTypes + Pointers;

  StringTypes: set of byte		= [STRINGLITERALTOK, STRINGTOK, PCHARTOK];

  // Identifier kind codes

  CONSTANT		= CONSTTOK;
  USERTYPE		= TYPETOK;
  VARIABLE		= VARTOK;
//  PROC			= PROCEDURETOK;
//  FUNC			= FUNCTIONTOK;
  LABELTYPE		= LABELTOK;
  UNITTYPE		= UNITTOK;

  ENUMTYPE		= ENUMTOK;

  // Compiler parameters

  MAXNAMELENGTH		= 32;
  MAXTOKENNAMES		= 200;
  MAXSTRLENGTH		= 255;
  MAXFIELDS		= 256;
  MAXTYPES		= 1024;
//  MAXTOKENS		= 32768;
  MAXIDENTS		= 16384;
  MAXBLOCKS		= 16384;	// maksymalna liczba blokow
  MAXPARAMS		= 8;		// maksymalna liczba parametrow dla PROC, FUNC
  MAXVARS		= 256;		// maksymalna liczba parametrow dla VAR
  MAXUNITS		= 512;
  MAXDEFINES		= 256;		// maksymalna liczba $DEFINE
  MAXALLOWEDUNITS	= 256;

  CODEORIGIN		= $100;
  DATAORIGIN		= $8000;

  CALLDETERMPASS	= 1;
  CODEGENERATIONPASS	= 2;

  // Indirection levels

  ASVALUE		 = 0;
  ASPOINTER		 = 1;
  ASPOINTERTOPOINTER	 = 2;
  ASPOINTERTOARRAYORIGIN = 3;
  ASPOINTERTOARRAYORIGIN2= 4;
  ASPOINTERTORECORD	 = 5;
  ASPOINTERTOARRAYRECORD = 6;
  ASSTRINGPOINTERTOARRAYORIGIN = 7;
  ASPOINTERTODEREFERENCE = 8;
  ASPOINTERTORECORDARRAYORIGIN = 9;
  ASARRAYORIGINOFPOINTERTORECORDARRAYORIGIN = 10;
  ASPOINTERTOARRAYRECORDTOSTRING = 11;

  ASCHAR		= 6;	// GenerateWriteString
  ASBOOLEAN		= 7;
  ASREAL		= 8;
  ASSHORTREAL		= 9;
  ASHALFSINGLE		= 10;
  ASSINGLE		= 11;
  ASPCHAR		= 12;

  OBJECTVARIABLE	= 1;
  RECORDVARIABLE	= 2;

  // Fixed-point 32-bit real number storage

  FRACBITS		= 8;	// Float Fixed Point
  TWOPOWERFRACBITS	= 256;

  // Parameter passing

  VALPASSING		= 1;
  CONSTPASSING		= 2;
  VARPASSING		= 3;


  // Data sizes

  DataSize: array [BYTETOK..FORWARDTYPE] of Byte = (1,2,4,1,2,4,1,1,2,2,2,2,2,2,4,4,2,2,1,2,2,2);

  fBlockRead_ParamType : array [1..3] of byte = (UNTYPETOK, WORDTOK, POINTERTOK);

implementation
begin

end.
