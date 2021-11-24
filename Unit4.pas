unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, System.Generics.Collections,
  REST.Types, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RotationPeriodLabel: TLabel;
    OrbitalPeriodLabel: TLabel;
    DiameterLabel: TLabel;
    ClimateLabel: TLabel;
    PopulationLabel: TLabel;
    FilmsLabel: TLabel;
    ListBoxFilms: TListBox;
    ResidentsLabel: TLabel;
    ListBoxResidents: TListBox;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    procedure ListBoxFilmsClick(Sender: TObject);
    procedure ListBoxResidentsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses Unit3;

procedure TForm4.ListBoxFilmsClick(Sender: TObject);
var
   item, content: string;
   resource_id: integer;
   localFilmsMap: TDictionary<string, integer>;
begin
  item := ListBoxFilms.Items[ListBoxFilms.ItemIndex];

  localFilmsMap := Unit3.Form3.filmsMap;

  localFilmsMap.TryGetValue(item, resource_id);

  RESTRequest1.Resource := 'api/films/' + inttostr(resource_id);
  RESTRequest1.Execute;
  content := RESTResponse1.Content;

  showMessage(content);

end;

procedure TForm4.ListBoxResidentsClick(Sender: TObject);
var
   item, content: string;
   resource_id: integer;
   localResidentsMap: TDictionary<string, integer>;
begin
  item := ListBoxResidents.Items[ListBoxResidents.ItemIndex];

  localResidentsMap := Unit3.Form3.residentsMap;

  localResidentsMap.TryGetValue(item, resource_id);

  RESTRequest1.Resource := 'api/people/' + inttostr(resource_id);
  RESTRequest1.Execute;
  content := RESTResponse1.Content;

  showMessage(content);
end;

end.
