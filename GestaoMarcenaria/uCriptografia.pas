unit uCriptografia;

interface

uses System.SysUtils;

const
  CKEY1 = 53761;
  CKEY2 = 32618;

  /// <summary> Criptografar senha
  /// </summary>
  /// <param name="wsSenha"> Palavra utilizada
  /// </param>
  /// <param name="wKey"> Chave númerica
  /// </param>
  /// <returns>Deve retornar a senha criptografada
  /// </returns>
  function CriptografarSenha(const wsSenha: WideString; wKey: Word): WideString; stdcall; export;

  /// <summary> Descriptografar senha
  /// </summary>
  /// <param name="wsSenha"> Palavra utilizada
  /// </param>
  /// <param name="wKey"> Chave númerica
  /// </param>
  /// <returns>Deve retornar a senha original
  /// </returns>
  function DescriptografarSenha(const wsSenha: WideString; wKey: Word): WideString; stdcall; export;

implementation

function CriptografarSenha(const wsSenha: WideString; wKey: Word): WideString;
var
  i: Integer;
  RStr: RawByteString;
  RStrB: TBytes Absolute RStr;
begin
  Result := '';
  RStr := UTF8Encode(wsSenha);
  for i := 0 to Length(RStr) - 1 do
  begin
    RStrB[i] := RStrB[i] xor (wKey shr 8);
    wKey := (RStrB[i] + wKey) * CKEY1 + CKEY2;
  end;
  for i := 0 to Length(RStr) - 1 do
    Result := Result + IntToHex(RStrB[i], 2);
end;

function DescriptografarSenha(const wsSenha: WideString; wKey: Word): WideString;
var
  i, tmpKey: Integer;
  RStr: RawByteString;
  RStrB: TBytes Absolute RStr;
  sAux: String;
begin
  sAux := UpperCase(wsSenha);
  SetLength(RStr, Length(sAux) div 2);
  i := 1;
  try
    while (i < Length(sAux)) do
    begin
      RStrB[i div 2] := StrToInt('$' + sAux[i] + sAux[i + 1]);
      Inc(i, 2);
    end;
  except
    Result := '';
    Exit;
  end;
  for i := 0 to Length(RStr) - 1 do
  begin
    tmpKey := RStrB[i];
    RStrB[i] := RStrB[i] xor (wKey shr 8);
    wKey := (tmpKey + wKey) * CKEY1 + CKEY2;
  end;
  Result := UTF8ToWideString(RStr);//UTF8Decode(RStr);
end;


end.
