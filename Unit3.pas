unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, Vcl.StdCtrls, Vcl.WinXCtrls,
  Vcl.ComCtrls, System.JSON, System.Generics.Collections, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ListBox1: TListBox;
    SearchBox1: TSearchBox;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure SearchBox1InvokeSearch(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    filmsMap: TDictionary<string, integer>;
    residentsMap: TDictionary<string, integer>;
  end;

var
  Form3: TForm3;
  names: array of string;
  namesLength: integer;
  populations: array of string;
  populations_length: integer;
  climates: array of string;
  climates_length: integer;

implementation

{$R *.dfm}

uses Unit4;

procedure TForm3.Button1Click(Sender: TObject);
var
   i, j, page_number, old_names_length: Integer;
   content: String;
   results: TJsonArray;
   json: TJSonValue;
   next: string;

begin
    ListBox1.Clear;

    page_number := 1;

    namesLength := 0;

    while True do
    begin
      RESTRequest1.Resource := '/api/planets/?page=' + inttostr(page_number);
      RESTRequest1.Execute;

      content := RESTResponse1.Content;

      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(content), 0);

      results := json.GetValue<TJsonArray>('results');

      old_names_length := namesLength;

      namesLength := namesLength + results.Count;

      setLength(names, namesLength);

      for i := old_names_length to namesLength - 1 do
      begin
        names[i] := results[i - old_names_length].GetValue<string>('name');
        ListBox1.Items.Add(names[i]);
      end;

      next := json.GetValue<string>('next');

      if next = '' then
        break
      else
        page_number := page_number + 1;
    end;

end;

procedure TForm3.Button2Click(Sender: TObject);
var
   i, page_number, old_population_length: Integer;
   content: String;
   results: TJsonArray;
   json: TJSonValue;
   next: string;
begin
    ListBox1.Clear;

    page_number := 1;

    populations_length := 0;

    while True do
    begin
      RESTRequest1.Resource := '/api/planets/?page=' + inttostr(page_number);
      RESTRequest1.Execute;

      content := RESTResponse1.Content;

      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(content), 0);

      results := json.GetValue<TJsonArray>('results');

      old_population_length := populations_length;

      populations_length := populations_length + results.Count;

      setLength(populations, populations_length);

      for i := old_population_length to populations_length - 1 do
      begin
        populations[i] := results[i - old_population_length].GetValue<string>('population');
        ListBox1.Items.Add(populations[i]);
      end;

      next := json.GetValue<string>('next');

      if next = '' then
        break
      else
        page_number := page_number + 1;
    end;
end;

procedure TForm3.Button3Click(Sender: TObject);
var
   i, page_number, old_climates_length: Integer;
   content: String;
   results: TJsonArray;
   json: TJSonValue;
   next: string;
begin
    ListBox1.Clear;

    page_number := 1;

    climates_length := 0;

    while True do
    begin
      RESTRequest1.Resource := '/api/planets/?page=' + inttostr(page_number);
      RESTRequest1.Execute;

      content := RESTResponse1.Content;

      json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(content), 0);

      results := json.GetValue<TJsonArray>('results');

      old_climates_length := climates_length;

      climates_length := climates_length + results.Count;

      setLength(climates, climates_length);

      for i := old_climates_length to climates_length - 1 do
      begin
        climates[i] := results[i - old_climates_length].GetValue<string>('climate');
        ListBox1.Items.Add(climates[i]);
      end;

      next := json.GetValue<string>('next');

      if next = '' then
        break
      else
        page_number := page_number + 1;
    end;
end;

procedure TForm3.ListBox1Click(Sender: TObject);
var
  item, content, resource_id: string;
  rotation_period, orbital_period, diameter, climate, population: string;
  i, j, teste, x: integer;
  split_films, split_residents: TArray<string>;
  json: TJSonValue;
  json_films, json_residents: TJsonArray;
  title: string;
  name: string;
begin
  item := ListBox1.Items[ListBox1.ItemIndex];

  for i := 0 to namesLength - 1 do
  begin
    if item = names[i] then
      RESTRequest1.Resource := '/api/planets/' + inttostr(i+1);
  end;

  RESTRequest1.Execute;

  content := RESTResponse1.Content;

  json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(content), 0);

  rotation_period := json.GetValue<string>('rotation_period');
  orbital_period := json.GetValue<string>('orbital_period');
  diameter := json.GetValue<string>('diameter');
  climate := json.GetValue<string>('climate');
  population := json.GetValue<string>('population');
  json_films := json.GetValue<TJsonArray>('films');
  json_residents := json.GetValue<TJsonArray>('residents');

  Form4 := TForm4.Create(nil);
  Form4.Show;

  Form4.RotationPeriodLabel.Caption := rotation_period;
  Form4.OrbitalPeriodLabel.Caption := orbital_period;
  Form4.DiameterLabel.Caption := diameter;
  Form4.ClimateLabel.Caption := climate;
  Form4.PopulationLabel.Caption := population;

  for j := 0 to json_films.Count - 1 do
  begin
    split_films := json_films[j].ToString.Split(['/']);

    resource_id := split_films[5].Replace('\', '');

    RESTRequest1.Resource := '/api/films/' + resource_id;
    RESTRequest1.Execute;

    content := RESTResponse1.Content;
    json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(content), 0);

    title := json.GetValue<string>('title');

    filmsMap := TDictionary<string, integer>.Create;
    filmsMap.Add(title, strtoint(resource_id));

    Form4.ListBoxFilms.Items.Add(title);
  end;
  {
  for x := 0 to json_residents.Count - 1 do
  begin
    split_residents := json_residents[x].ToString.Split(['/']);

    resource_id := split_residents[5].Replace('\', '');

    RESTRequest1.Resource := '/api/people/' + resource_id;
    RESTRequest1.Execute;

    content := RESTResponse1.Content;
    json := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(content), 0);

    name := json.GetValue<string>('name');

    residentsMap := TDictionary<string, integer>.Create;
    residentsMap.Add(name, strtoint(resource_id));

    Form4.ListBoxResidents.Items.Add(name);
  end;
  }
end;

procedure TForm3.SearchBox1InvokeSearch(Sender: TObject);
var
  i, j, len: integer;
  search: string;
begin
  search := SearchBox1.Text;

  len := ListBox1.Items.Count;

  for i := len - 1 downto 0 do
  begin
    for j := search.Length downto 1 do
    begin
      if ListBox1.Items[i][j] <> search[j] then
      begin
        ListBox1.Items.Delete(i);
        break;
      end;
    end;

  end;

end;

end.
