object frmListaClientes: TfrmListaClientes
  Left = 0
  Top = 0
  Caption = 'Lista de Clientes'
  ClientHeight = 594
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlListaClientes: TPanel
    Left = 0
    Top = 0
    Width = 721
    Height = 594
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 640
    ExplicitHeight = 443
    DesignSize = (
      721
      594)
    object lblInformacoesGerenciais: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 8
      Width = 705
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Align = alTop
      Caption = 'Informa'#231#245'es gerenciais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 221
    end
    object Shape1: TShape
      Left = 8
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 14671839
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape2: TShape
      Left = 228
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 14671839
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape5: TShape
      Left = 118
      Top = 44
      Width = 104
      Height = 73
      Brush.Color = 14671839
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object lblListaClientesTitulo: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 153
      Width = 153
      Height = 25
      Margins.Left = 8
      Margins.Top = 8
      Margins.Right = 8
      Margins.Bottom = 8
      Caption = 'Lista de clientes'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -21
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object lvwClientes: TListView
      AlignWithMargins = True
      Left = 8
      Top = 181
      Width = 705
      Height = 353
      Margins.Left = 8
      Margins.Top = 140
      Margins.Right = 8
      Margins.Bottom = 60
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      Color = clWhite
      Columns = <
        item
          Caption = 'Nome'
          Width = 300
        end
        item
          Caption = 'Cpf'
          Width = 150
        end
        item
          Caption = 'Telefone'
          Width = 150
        end
        item
          Caption = 'Status'
          Width = 100
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      GridLines = True
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      ViewStyle = vsReport
      ExplicitWidth = 624
      ExplicitHeight = 202
    end
    inline frmBotaoCancelar: TfrmBotaoCancelar
      Left = 143
      Top = 549
      Width = 120
      Height = 45
      Anchors = [akLeft, akBottom]
      TabOrder = 1
      ExplicitLeft = 143
      ExplicitTop = 398
      ExplicitWidth = 120
      ExplicitHeight = 45
      inherited pnlFundo: TPanel
        Width = 120
        Height = 45
        ExplicitWidth = 120
        ExplicitHeight = 45
        inherited spbBotaoCancelar: TSpeedButton
          Width = 120
          Height = 45
          Caption = 'Cancelar'
          ExplicitLeft = 16
          ExplicitTop = 0
          ExplicitWidth = 104
          ExplicitHeight = 45
        end
      end
    end
    inline frmBotaoExcluir: TfrmBotaoExcluir
      Left = 269
      Top = 549
      Width = 120
      Height = 45
      Anchors = [akLeft, akBottom]
      TabOrder = 2
      ExplicitLeft = 269
      ExplicitTop = 398
      ExplicitWidth = 120
      ExplicitHeight = 45
      inherited pnlFundo: TPanel
        Width = 120
        Height = 45
        ExplicitWidth = 120
        ExplicitHeight = 45
        inherited spbBotaoExcluir: TSpeedButton
          Width = 120
          Height = 45
          Caption = 'Excluir'
          ExplicitWidth = 120
          ExplicitHeight = 45
        end
      end
    end
    inline frmBotaoPrimario1: TfrmBotaoPrimario
      Left = 20
      Top = 549
      Width = 117
      Height = 45
      Align = alCustom
      Anchors = [akLeft, akBottom]
      TabOrder = 3
      ExplicitLeft = 20
      ExplicitTop = 502
      ExplicitWidth = 117
      ExplicitHeight = 45
      inherited pnlFundo: TPanel
        Width = 117
        Height = 45
        inherited spbBotaoPrimario: TSpeedButton
          Width = 117
          Height = 45
          OnClick = frmBotaoPrimario1spbBotaoPrimarioClick
          ExplicitLeft = 0
          ExplicitTop = -10
          ExplicitWidth = 117
          ExplicitHeight = 45
        end
      end
    end
  end
end
