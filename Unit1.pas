unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.StdCtrls, Vcl.Controls, Vcl.StdCtrls;

type
  TForm1 = class(TWebForm)
    WebButton1: TWebButton;
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    WebMemo1: TWebMemo;
    WebEdit1: TWebEdit;
    WebLabel3: TWebLabel;
    WebComboBox1: TWebComboBox;
    WebLabel4: TWebLabel;
    procedure WebFormCreate(Sender: TObject);
    procedure WebButton1Click(Sender: TObject);
    procedure WebComboBox1Change(Sender: TObject);
  private
    function GerarJogoMegaSena(const QuantidadeNumeros: Integer): TArray<Integer>;
    function GerarJogoLotoFacil(const QuantidadeNumeros: Integer): TArray<Integer>;
    procedure ExibirNumeros(const Numeros: TArray<Integer>; const Titulo: string);
    procedure AplicarCoresDoJogo(const TipoJogo: Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  Math;

{ TForm1 }

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  Caption := 'Sorteador Mega Sena e Loto Fácil - TMS Web Core';
  WebLabel1.Caption := 'Sorteador de Números - Mega Sena e Loto Fácil';
  WebLabel4.Caption := 'Escolha o tipo de jogo:';
  WebLabel2.Caption := 'Quantidade de dezenas:';
  WebLabel3.Caption := 'Números sorteados:';

  // Preenche o ComboBox com as opções de jogo
  WebComboBox1.Items.Clear;
  WebComboBox1.Items.Add('Mega Sena (6 dezenas)');
  WebComboBox1.Items.Add('Loto Fácil (15 dezenas)');
  WebComboBox1.ItemIndex := 0; // Mega Sena por padrão

  WebEdit1.Text := '6'; // Valor inicial para Mega Sena
  WebButton1.Caption := 'Sortear Números';
  WebMemo1.ReadOnly := True;
  WebMemo1.Lines.Clear;

  // Aplica as cores iniciais (Mega Sena)
  AplicarCoresDoJogo(WebComboBox1.ItemIndex);
end;

procedure TForm1.AplicarCoresDoJogo(const TipoJogo: Integer);
begin
  if TipoJogo = 0 then
  begin
    // Mega Sena: tons de verde
    Self.Color := $00E8F5E9;          // Verde bem claro (fundo do form)
    WebMemo1.Color := $00C8E6C9;      // Verde claro (fundo do memo)
    WebMemo1.Font.Color := $00004D00; // Verde escuro (texto)
    WebLabel1.Font.Color := $00008000;// Verde escuro (título)
  end
  else
  begin
    // Loto Fácil: tons de roxo
    Self.Color := $00F3E5F5;          // Roxo bem claro (fundo do form)
    WebMemo1.Color := $00E1BEE7;      // Roxo claro (fundo do memo)
    WebMemo1.Font.Color := $004A148C; // Roxo escuro (texto)
    WebLabel1.Font.Color := $006A1B9A;// Roxo escuro (título)
  end;
end;

procedure TForm1.WebComboBox1Change(Sender: TObject);
begin
  // Atualiza automaticamente a quantidade conforme o jogo escolhido
  if WebComboBox1.ItemIndex = 0 then
    WebEdit1.Text := '6'   // Mega Sena
  else
    WebEdit1.Text := '15'; // Loto Fácil

  // Aplica as cores conforme o jogo selecionado
  AplicarCoresDoJogo(WebComboBox1.ItemIndex);
end;

procedure TForm1.WebButton1Click(Sender: TObject);
var
  Quantidade: Integer;
  Numeros: TArray<Integer>;
  TipoJogo: Integer;
begin
  Quantidade := StrToIntDef(WebEdit1.Text, 0);
  TipoJogo := WebComboBox1.ItemIndex;

  // Validação conforme o tipo de jogo escolhido
  if TipoJogo = 0 then // Mega Sena
  begin
    if (Quantidade < 6) or (Quantidade > 15) then
    begin
      WebMemo1.Lines.Clear;
      WebMemo1.Lines.Add('Erro: Para a Mega Sena, a quantidade deve ser entre 6 e 15 dezenas.');
      Exit;
    end;

    Numeros := GerarJogoMegaSena(Quantidade);
    ExibirNumeros(Numeros, 'Mega Sena');
  end
  else // Loto Fácil
  begin
    if (Quantidade < 15) or (Quantidade > 20) then
    begin
      WebMemo1.Lines.Clear;
      WebMemo1.Lines.Add('Erro: Para a Loto Fácil, a quantidade deve ser entre 15 e 20 dezenas.');
      Exit;
    end;

    Numeros := GerarJogoLotoFacil(Quantidade);
    ExibirNumeros(Numeros, 'Loto Fácil');
  end;
end;

function TForm1.GerarJogoMegaSena(const QuantidadeNumeros: Integer): TArray<Integer>;
var
  Disponiveis: TArray<Integer>;
  i, j, SorteadoIndex: Integer;
  Temp: Integer;
begin
  Randomize;

  SetLength(Disponiveis, 60);
  for i := 0 to 59 do
    Disponiveis[i] := i + 1;

  for i := 0 to QuantidadeNumeros - 1 do
  begin
    SorteadoIndex := Random(60 - i);
    Temp := Disponiveis[SorteadoIndex];
    Disponiveis[SorteadoIndex] := Disponiveis[59 - i];
    Disponiveis[59 - i] := Temp;
  end;

  SetLength(Result, QuantidadeNumeros);
  for i := 0 to QuantidadeNumeros - 1 do
    Result[i] := Disponiveis[59 - i];

  for i := 0 to QuantidadeNumeros - 2 do
    for j := i + 1 to QuantidadeNumeros - 1 do
      if Result[i] > Result[j] then
      begin
        Temp := Result[i];
        Result[i] := Result[j];
        Result[j] := Temp;
      end;
end;

function TForm1.GerarJogoLotoFacil(const QuantidadeNumeros: Integer): TArray<Integer>;
var
  Disponiveis: TArray<Integer>;
  i, j, SorteadoIndex: Integer;
  Temp: Integer;
begin
  Randomize;

  SetLength(Disponiveis, 25);
  for i := 0 to 24 do
    Disponiveis[i] := i + 1;

  for i := 0 to QuantidadeNumeros - 1 do
  begin
    SorteadoIndex := Random(25 - i);
    Temp := Disponiveis[SorteadoIndex];
    Disponiveis[SorteadoIndex] := Disponiveis[24 - i];
    Disponiveis[24 - i] := Temp;
  end;

  SetLength(Result, QuantidadeNumeros);
  for i := 0 to QuantidadeNumeros - 1 do
    Result[i] := Disponiveis[24 - i];

  for i := 0 to QuantidadeNumeros - 2 do
    for j := i + 1 to QuantidadeNumeros - 1 do
      if Result[i] > Result[j] then
      begin
        Temp := Result[i];
        Result[i] := Result[j];
        Result[j] := Temp;
      end;
end;

procedure TForm1.ExibirNumeros(const Numeros: TArray<Integer>; const Titulo: string);
var
  i: Integer;
  Linha: string;
begin
  WebMemo1.Lines.Clear;
  Linha := '';

  for i := 0 to High(Numeros) do
  begin
    if i > 0 then
      Linha := Linha + ' - ';
    Linha := Linha + FormatFloat('00', Numeros[i]);
  end;

  WebMemo1.Lines.Add('Jogo: ' + Titulo);
  WebMemo1.Lines.Add(Linha);
  WebMemo1.Lines.Add('');
  WebMemo1.Lines.Add('Total de dezenas: ' + IntToStr(Length(Numeros)));
end;

end.
