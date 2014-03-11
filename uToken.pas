unit uToken;

interface
function GetTokenCount(Cadena, Separador: String): Integer; overload;
function GetToken(Str, Separator: String; Token: Integer): String;
function GetRemaining(Text, Token : String) : String;
implementation
function GetTokenCount(Cadena, Separador: String): Integer; overload;
var
Posicion: Integer;
 begin
 if Cadena <> '' then begin
 Posicion:= Pos(Separador, Cadena);
 Result:= 1;
 while Posicion <> 0 do begin
  Inc(Result);
  Delete(Cadena, 1, Posicion+Length(Separador)-1);
  Posicion:= Pos(Separador, Cadena);
 end;
 end else
  Result:=0;
end;

function GetToken(Str, Separator: String; Token: Integer): String;
var
  Position: Integer;
begin
   while Token > 1 do begin
     Delete(Str, 1, Pos(Separator,Str)+Length(Separator)-1);
     Dec(Token);
   end;
   Position:= Pos(Separator, Str);
   if Position = 0
   then  Result:= Str
   else  Result:= Copy(Str, 1, Position-1);
end;

function GetRemaining(Text, Token : String) : String;
begin
  result := Copy(Text, Pos(Token, Text) + Length(Token), Length(Text) - Pos(Token, Text) + Length(Token));
end;

end. 
