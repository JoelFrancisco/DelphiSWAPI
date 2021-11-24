object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 873
  ClientWidth = 1108
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Nome'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 480
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Popula'#231#227'o'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 920
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Clima'
    TabOrder = 2
    OnClick = Button3Click
  end
  object ListBox1: TListBox
    Left = 34
    Top = 136
    Width = 1015
    Height = 537
    ItemHeight = 13
    TabOrder = 3
    OnClick = ListBox1Click
  end
  object SearchBox1: TSearchBox
    Left = 40
    Top = 40
    Width = 1009
    Height = 21
    TabOrder = 4
    OnInvokeSearch = SearchBox1InvokeSearch
  end
  object RESTClient1: TRESTClient
    BaseURL = 'https://swapi.dev'
    Params = <>
    Left = 48
    Top = 800
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Resource = 'api/planets'
    Response = RESTResponse1
    Left = 128
    Top = 800
  end
  object RESTResponse1: TRESTResponse
    RootElement = 'results'
    Left = 216
    Top = 800
  end
end
