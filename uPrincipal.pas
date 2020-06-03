unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Graphics, FMX.Forms, FMX.Dialogs, FMX.TabControl, System.Actions, FMX.ActnList,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Ani, FMX.Layouts,
  FMX.ExtCtrls, FMX.Edit, FMX.EditBox, FMX.NumberBox, Math, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.ComboEdit, FMX.Colors;

type
  TfrmPrincipal = class(TForm)
    TopToolBar: TToolBar;
    ToolBarLabel: TLabel;
    BottomToolBar: TToolBar;
    TABCPrincipal: TTabControl;
    TABHome: TTabItem;
    TABConsorcio: TTabItem;
    BTNConsorcio: TButton;
    btnBack: TSpeedButton;
    Label9: TLabel;
    BTNSimular: TButton;
    ImageViewer1: TImageViewer;
    TABLances: TTabItem;
    VertScrollBox1: TVertScrollBox;
    Panel11: TPanel;
    Label8: TLabel;
    NBVlrCartaL: TNumberBox;
    Panel12: TPanel;
    Label11: TLabel;
    NBPrazoL: TNumberBox;
    Panel13: TPanel;
    Label12: TLabel;
    NBTaxaAdmL: TNumberBox;
    Panel14: TPanel;
    Label13: TLabel;
    CBSeguroL: TComboBox;
    Panel15: TPanel;
    Label14: TLabel;
    DEDataAdesaoL: TDateEdit;
    BTNCalcularL: TButton;
    Panel17: TPanel;
    LBParcelasL: TLabel;
    Panel16: TPanel;
    LBVlrPrestLance: TLabel;
    Panel21: TPanel;
    ColorBox1: TColorBox;
    Label18: TLabel;
    Panel18: TPanel;
    Label15: TLabel;
    NBParcelasPagas: TNumberBox;
    Panel19: TPanel;
    Label16: TLabel;
    NBLanceEmbutido: TNumberBox;
    Panel20: TPanel;
    Label17: TLabel;
    NBLanceNormal: TNumberBox;
    BTNCalcularLance: TButton;
    Panel22: TPanel;
    LBTotalLance: TLabel;
    LBVlrTotalLance: TLabel;
    Panel23: TPanel;
    LBCreditoAposLance: TLabel;
    LBVlrCreditoLance: TLabel;
    Panel24: TPanel;
    ColorBox2: TColorBox;
    Label20: TLabel;
    Panel26: TPanel;
    LBParcelasDiluicao: TLabel;
    Panel28: TPanel;
    LBParcelasReducao: TLabel;
    Panel25: TPanel;
    LBVlrParcelasDiluicao: TLabel;
    Panel27: TPanel;
    LBVlrParcelasReducao: TLabel;
    VertScrollBox2: TVertScrollBox;
    Panel10: TPanel;
    LBEconomiaTotal: TLabel;
    Panel9: TPanel;
    LBEconomiaMes: TLabel;
    Panel8: TPanel;
    Label10: TLabel;
    LBVlrFinalConsorcio: TLabel;
    Panel7: TPanel;
    Label6: TLabel;
    LBVlrPrestConsorcio: TLabel;
    Panel5: TPanel;
    Label5: TLabel;
    LBVlrFinalFinanc: TLabel;
    Panel4: TPanel;
    Label3: TLabel;
    LBVlrPrestFinanc: TLabel;
    BTNCalcular: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    NBPrazo: TNumberBox;
    Panel1: TPanel;
    Label1: TLabel;
    NBVlrCarta: TNumberBox;
    Panel3: TPanel;
    ColorBox4: TColorBox;
    Label4: TLabel;
    Panel6: TPanel;
    ColorBox3: TColorBox;
    Label7: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure BTNConsorcioClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure BTNCalcularClick(Sender: TObject);
    procedure BTNSimularClick(Sender: TObject);
    procedure BTNCalcularLClick(Sender: TObject);
    procedure BTNCalcularLanceClick(Sender: TObject);
  private
    { Private declarations }
    Juros, VlrI22, VlrJ22, VlrL22, VlrCalculoParcelas: Extended;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.iPhone4in.fmx IOS}

procedure TfrmPrincipal.btnBackClick(Sender: TObject);
begin
  TABCPrincipal.ActiveTab := TABHome;
  ToolBarLabel.Text := 'GilBraz Consórcios';
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  { This defines the default active tab at runtime }
  TABCPrincipal.First(TTabTransition.None);

  Juros  := 0.025;
  VlrI22 := 19.48;
  VlrJ22 := 0.0006;
  VlrL22 := 0.19;
end;

procedure TfrmPrincipal.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (Key = vkHardwareBack) and (TABCPrincipal.TabIndex <> 0) then
  begin
    TABCPrincipal.ActiveTab := TABHome;
    ToolBarLabel.Text := 'GilBraz Consórcios';
    Key := 0;
  end;
end;

procedure TfrmPrincipal.BTNConsorcioClick(Sender: TObject);
begin
  ToolBarLabel.Text := 'Consórcio X Financiamento';

  NBVlrCarta.Value := 0;
  NBPrazo.Value    := 0;
  LBVlrPrestFinanc.Text := '';
  LBVlrFinalFinanc.Text := '';
  LBVlrPrestConsorcio.Text := '';
  LBVlrFinalConsorcio.Text := '';
  LBEconomiaMes.Text   := '';
  LBEconomiaTotal.Text := '';

  TABCPrincipal.ActiveTab := TABConsorcio;
end;

procedure TfrmPrincipal.BTNSimularClick(Sender: TObject);
begin
  ToolBarLabel.Text := 'Simular Lances';

  NBVlrCartaL.Value := 0;
  NBPrazoL.Value    := 0;
  NBTaxaAdmL.Value  := 0;
  CBSeguroL.ItemIndex  := -1;
  DEDataAdesaoL.Date   := Date;
  LBParcelasL.Text     := '';
  LBVlrPrestLance.Text := '';

  VlrCalculoParcelas      := 0;
  NBParcelasPagas.Value   := 0;
  NBLanceEmbutido.Value   := 0;
  NBLanceNormal.Value     := 0;
  LBTotalLance.Text       := '';
  LBVlrTotalLance.Text    := '';
  LBCreditoAposLance.Text := '';
  LBVlrCreditoLance.Text  := '';
  LBParcelasDiluicao.Text    := '';
  LBVlrParcelasDiluicao.Text := '';
  LBParcelasReducao.Text     := '';
  LBVlrParcelasReducao.Text  := '';

  TABCPrincipal.ActiveTab := TABLances;
end;

procedure TfrmPrincipal.BTNCalcularClick(Sender: TObject);
var QtdParc: Integer;
    VlrPrestFinanc, VlrFinalFinanc, VlrPrestCons, VlrFinalCons: Extended;
begin
  if NBVlrCarta.Value = 0 then
  begin
    ShowMessage('Informe o valor da carta!');
    Exit;
  end;
  if NBPrazo.Value = 0 then
  begin
    ShowMessage('Informe o prazo!');
    Exit;
  end;

  QtdParc := Trunc(NBPrazo.Value);
  VlrPrestFinanc := Payment(Juros, QtdParc, NBVlrCarta.Value, 0, ptEndOfPeriod)*-1;
  VlrFinalFinanc := QtdParc * VlrPrestFinanc;
  VlrPrestCons   := ((NBVlrCarta.Value*(1+VlrL22))+(QtdParc*VlrI22)+((NBVlrCarta.Value*(1+VlrL22)*VlrJ22*QtdParc)))/QtdParc;
  VlrFinalCons   := QtdParc * VlrPrestCons;

  LBVlrPrestFinanc.Text := FloatToStrF(VlrPrestFinanc, ffCurrency, 18, 2);
  LBVlrFinalFinanc.Text := FloatToStrF(VlrFinalFinanc, ffCurrency, 18, 2);

  LBVlrPrestConsorcio.Text := FloatToStrF(VlrPrestCons, ffCurrency, 18, 2);
  LBVlrFinalConsorcio.Text := FloatToStrF(VlrFinalCons, ffCurrency, 18, 2);

  LBEconomiaMes.Text   := 'Economia por mês:  ' + FloatToStrF(VlrPrestFinanc - VlrPrestCons, ffCurrency, 18, 2);
  LBEconomiaTotal.Text := 'Economia total:  ' + FloatToStrF(VlrFinalFinanc - VlrFinalCons, ffCurrency, 18, 2);
end;

procedure TfrmPrincipal.BTNCalcularLanceClick(Sender: TObject);
var QtdParc1, QtdParc2, ReducaoParcelas: Integer;
    SegPremiatista, SegVida, VlrTotalLance: Extended;
begin
  if VlrCalculoParcelas = 0 then
  begin
    ShowMessage('Primeiro faça o cálculo das parcelas!');
    Exit;
  end;
  if NBParcelasPagas.Value = 0 then
  begin
    ShowMessage('Informe a quantidade de parcelas pagas!');
    Exit;
  end;

  VlrTotalLance        := (NBLanceEmbutido.Value * NBVlrCartaL.Value / 100) + (NBLanceNormal.Value * NBVlrCartaL.Value / 100);
  LBTotalLance.Text    := 'Total Lance:';
  LBVlrTotalLance.Text := FloatToStrF(VlrTotalLance, ffCurrency, 18, 2);
  if NBLanceEmbutido.Value > 0 then
  begin
    LBCreditoAposLance.Text := 'Crédito após Lance Embutido:';
    LBVlrCreditoLance.Text  := FloatToStrF(NBVlrCartaL.Value * (1 - NBLanceEmbutido.Value/100), ffCurrency, 18, 2)
  end
  else
  begin
    LBCreditoAposLance.Text := '';
    LBVlrCreditoLance.Text  := '';
  end;

  QtdParc1 := Trunc(NBParcelasPagas.Value);
  QtdParc2 := Trunc(NBPrazoL.Value);
  LBParcelasDiluicao.Text := 'Parcelas por diluição (' + IntToStr(QtdParc1 + 1) + ' a ' + IntToStr(QtdParc2) + ')';

  SegPremiatista := 0.0006;
  SegVida        := 19.48;

  if CBSeguroL.Items[CBSeguroL.ItemIndex] = 'TOTAL' then
    LBVlrParcelasDiluicao.Text := FloatToStrF(((NBVlrCartaL.Value*(1+NBTaxaAdmL.Value/100))+(NBVlrCartaL.Value*(1+NBTaxaAdmL.Value/100)*SegPremiatista*QtdParc2)+(SegVida*QtdParc2)-(VlrCalculoParcelas*QtdParc1)-VlrTotalLance)/(QtdParc2-QtdParc1), ffCurrency, 18, 2)
  else if CBSeguroL.Items[CBSeguroL.ItemIndex] = 'PRESTAMISTA' then
    LBVlrParcelasDiluicao.Text := FloatToStrF(((NBVlrCartaL.Value*(1+NBTaxaAdmL.Value/100))+(NBVlrCartaL.Value*(1+NBTaxaAdmL.Value/100)*SegPremiatista*QtdParc2)-(VlrCalculoParcelas*QtdParc1)-VlrTotalLance)/(QtdParc2-QtdParc1), ffCurrency, 18, 2)
  else
    LBVlrParcelasDiluicao.Text := FloatToStrF(((NBVlrCartaL.Value*(1+NBTaxaAdmL.Value/100))+(SegVida*QtdParc2)-(VlrCalculoParcelas*QtdParc1)-VlrTotalLance)/(QtdParc2-QtdParc1), ffCurrency, 18, 2);

  ReducaoParcelas := Trunc(VlrTotalLance / VlrCalculoParcelas);
  LBParcelasReducao.Text    := 'Por redução de prazo (' + IntToStr(QtdParc1 + 1) + ' a ' + IntToStr(QtdParc2 - ReducaoParcelas) + ')';
  LBVlrParcelasReducao.Text := FloatToStrF(VlrCalculoParcelas, ffCurrency, 18, 2);
end;

procedure TfrmPrincipal.BTNCalcularLClick(Sender: TObject);
var QtdParc: Integer;
    SegPremiatista, SegVida: Extended;
begin
  if NBVlrCartaL.Value = 0 then
  begin
    ShowMessage('Informe o valor da carta!');
    Exit;
  end;
  if NBPrazoL.Value = 0 then
  begin
    ShowMessage('Informe o prazo!');
    Exit;
  end;
  if NBTaxaAdmL.Value = 0 then
  begin
    ShowMessage('Informe a taxa adm!');
    Exit;
  end;
  if CBSeguroL.ItemIndex = -1 then
  begin
    ShowMessage('Informe o seguro!');
    Exit;
  end;

  SegPremiatista := 0.0006;
  SegVida        := 19.48;

  QtdParc := Trunc(NBPrazoL.Value);
  LBParcelasL.Text := 'Parcelas de 1 a ' + IntToStr(QtdParc);
  if CBSeguroL.Items[CBSeguroL.ItemIndex] = 'TOTAL' then
    VlrCalculoParcelas := ((NBVlrCartaL.Value*(1+(NBTaxaAdmL.Value/100)))+(NBVlrCartaL.Value*(1+(NBTaxaAdmL.Value/100))*SegPremiatista*QtdParc))/QtdParc+SegVida
  else if CBSeguroL.Items[CBSeguroL.ItemIndex] = 'PRESTAMISTA' then
    VlrCalculoParcelas := ((NBVlrCartaL.Value*(1+(NBTaxaAdmL.Value/100)))+(NBVlrCartaL.Value*(1+(NBTaxaAdmL.Value/100))*SegPremiatista*QtdParc))/QtdParc
  else
    VlrCalculoParcelas := (NBVlrCartaL.Value*(1+(NBTaxaAdmL.Value/100)))/QtdParc+SegVida;

  LBVlrPrestLance.Text := FloatToStrF(VlrCalculoParcelas, ffCurrency, 18, 2);
end;

end.
