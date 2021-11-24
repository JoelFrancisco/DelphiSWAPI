object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Form4'
  ClientHeight = 671
  ClientWidth = 1005
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 144
    Top = 128
    Width = 148
    Height = 22
    Caption = 'Per'#237'odo de rota'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 144
    Top = 192
    Width = 125
    Height = 22
    Caption = 'Per'#237'do de '#243'rbita'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 144
    Top = 256
    Width = 71
    Height = 22
    Caption = 'Di'#226'metro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 144
    Top = 312
    Width = 43
    Height = 22
    Caption = 'Clima'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 144
    Top = 368
    Width = 80
    Height = 22
    Caption = 'Popula'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object RotationPeriodLabel: TLabel
    Left = 400
    Top = 128
    Width = 6
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object OrbitalPeriodLabel: TLabel
    Left = 400
    Top = 192
    Width = 6
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DiameterLabel: TLabel
    Left = 400
    Top = 256
    Width = 6
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ClimateLabel: TLabel
    Left = 400
    Top = 312
    Width = 6
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object PopulationLabel: TLabel
    Left = 400
    Top = 368
    Width = 6
    Height = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object FilmsLabel: TLabel
    Left = 144
    Top = 416
    Width = 49
    Height = 22
    Caption = 'Filmes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ResidentsLabel: TLabel
    Left = 140
    Top = 552
    Width = 84
    Height = 22
    Caption = 'Residentes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ListBoxFilms: TListBox
    Left = 296
    Top = 416
    Width = 313
    Height = 89
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBoxFilmsClick
  end
  object ListBoxResidents: TListBox
    Left = 296
    Top = 552
    Width = 313
    Height = 89
    ItemHeight = 13
    TabOrder = 1
    OnClick = ListBoxResidentsClick
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://swapi.dev'
    Params = <>
    Left = 768
    Top = 24
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = 'api/films/1'
    Response = RESTResponse1
    Left = 840
    Top = 24
  end
  object RESTResponse1: TRESTResponse
    Left = 920
    Top = 24
  end
end
