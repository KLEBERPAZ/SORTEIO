object Form1: TForm1
  Width = 640
  Height = 520
  Caption = 'Sorteador Mega Sena e Loto F'#225'cil - TMS Web Core'
  Color = 15329769
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  ParentFont = False
  OnCreate = WebFormCreate
  object WebLabel1: TWebLabel
    Left = 24
    Top = 16
    Width = 426
    Height = 25
    Caption = 'Sorteador de N'#250'meros - Mega Sena e Loto F'#225'cil'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    HeightPercent = 100.000000000000000000
    ParentFont = False
    WidthPercent = 100.000000000000000000
  end
  object WebLabel4: TWebLabel
    Left = 24
    Top = 64
    Width = 136
    Height = 17
    Caption = 'Escolha o tipo de jogo:'
    Color = clBtnFace
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel2: TWebLabel
    Left = 24
    Top = 120
    Width = 142
    Height = 17
    Caption = 'Quantidade de dezenas:'
    Color = clBtnFace
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebLabel3: TWebLabel
    Left = 24
    Top = 200
    Width = 124
    Height = 17
    Caption = 'N'#250'meros sorteados:'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    HeightPercent = 100.000000000000000000
    ParentFont = False
    WidthPercent = 100.000000000000000000
  end
  object WebComboBox1: TWebComboBox
    Left = 24
    Top = 88
    Width = 300
    Height = 25
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnChange = WebComboBox1Change
    ItemIndex = -1
  end
  object WebEdit1: TWebEdit
    Left = 24
    Top = 144
    Width = 80
    Height = 25
    HeightPercent = 100.000000000000000000
    TabOrder = 1
    Text = '6'
    WidthPercent = 100.000000000000000000
  end
  object WebButton1: TWebButton
    Left = 120
    Top = 144
    Width = 160
    Height = 25
    Caption = 'Sortear N'#250'meros'
    HeightPercent = 100.000000000000000000
    TabOrder = 2
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object WebMemo1: TWebMemo
    Left = 24
    Top = 224
    Width = 560
    Height = 265
    HeightPercent = 100.000000000000000000
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    SelLength = 0
    SelStart = 2
    TabOrder = 3
    WidthPercent = 100.000000000000000000
  end
end
