object frmRegistrar: TfrmRegistrar
  Left = 0
  Top = 0
  ActiveControl = edtNome
  BorderStyle = bsSingle
  Caption = 'Registrar'
  ClientHeight = 585
  ClientWidth = 650
  Color = 2264591
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    650
    585)
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRegistrar: TPanel
    AlignWithMargins = True
    Left = 150
    Top = 0
    Width = 350
    Height = 585
    Margins.Left = 150
    Margins.Top = 0
    Margins.Right = 150
    Margins.Bottom = 0
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      350
      585)
    object lblTituloRegistrar: TLabel
      Left = 50
      Top = 41
      Width = 250
      Height = 33
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Criar conta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -27
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lblSubTituloRegistrar: TLabel
      Left = 50
      Top = 80
      Width = 250
      Height = 19
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Preencha os campos abaixo'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblTituloAutenticar: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 528
      Width = 344
      Height = 15
      Align = alBottom
      Alignment = taCenter
      Caption = 'Possui conta?'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 80
    end
    object lblSubTituloAutenticar: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 549
      Width = 344
      Height = 33
      Align = alBottom
      Alignment = taCenter
      AutoSize = False
      Caption = 'Clique aqui para autenticar'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 2264591
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      OnClick = lblSubTituloAutenticarClick
      ExplicitLeft = 50
      ExplicitTop = 454
    end
    object edtNome: TEdit
      Left = 50
      Top = 143
      Width = 250
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TextHint = 'Digite seu nome'
    end
    object edtCpf: TEdit
      Left = 50
      Top = 176
      Width = 250
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TextHint = 'Digite seu cpf'
    end
    object edtSenha: TEdit
      Left = 50
      Top = 242
      Width = 250
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 3
      TextHint = 'Digite sua senha'
    end
    object edtConfirmarSenha: TEdit
      Left = 50
      Top = 275
      Width = 250
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 4
      TextHint = 'Confirme sua senha'
    end
    object edtLogin: TEdit
      Left = 50
      Top = 209
      Width = 250
      Height = 27
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvNone
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TextHint = 'Digite seu login'
    end
  end
  object pnlBotaoAutenticar: TPanel
    Left = 200
    Top = 335
    Width = 250
    Height = 41
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Autenticar'
    Color = 2264591
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clWhite
    Font.Height = -15
    Font.Name = 'Technic'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    OnClick = pnlBotaoAutenticarClick
  end
end
