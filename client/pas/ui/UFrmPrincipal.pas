unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtDocumentoCliente: TLabeledEdit;
    cmbTamanhoPizza: TComboBox;
    cmbSaborPizza: TComboBox;
    Button1: TButton;
    mmRetornoWebService: TMemo;
    edtEnderecoBackend: TLabeledEdit;
    edtPortaBackend: TLabeledEdit;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    txtDocumentoPesquisa: TLabeledEdit;
    btnPesquisar: TButton;
    mmRetornoConsulta: TMemo;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    procedure Button1Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

uses
  Rest.JSON, MVCFramework.RESTClient,
  UEfetuarPedidoDTOImpl,
  System.Rtti,
  UPizzaSaborEnum,
  UPizzaTamanhoEnum,
  UPedidoRetornoDTOImpl;

{$R *.dfm}

procedure TForm1.btnPesquisarClick(Sender: TObject);
var
  Clt: TRestClient;
  Response: IRESTResponse;
begin
  Clt := MVCFramework.RESTClient.TRestClient.Create(edtEnderecoBackend.Text,
    StrToIntDef(edtPortaBackend.Text, 80), nil);
  try
    try
      Clt.QueryStringParams.Add('DocumentoCliente=' + txtDocumentoPesquisa.Text);
      Response := Clt.doGET('/consultarPedido', []);
      mmRetornoConsulta.Text := Response.BodyAsString;
    finally
    end;
  finally
    Clt.Free;
  end;
end;
  // Clt := MVCFramework.RESTClient.TRestClient.Create(edtEnderecoBackend.Text,
  // StrToIntDef(edtPortaBackend.Text, 80), nil);
  // try
  // //oConsultarPedido := TPedidoRetornoDTO.Create;
  // try
  // mmRetornoConsulta.Clear;
  //
  // oConsultarPedido :=

  //
  // mmRetornoConsulta.Lines.Add( 'DETALHES DO ÚLTIMO PEDIDO DO CLIENTE');
  // mmRetornoConsulta.Lines.Add( '===============================');
  // mmRetornoConsulta.Lines.Add('Tamanho: '+UpperCase(Copy(TRttiEnumerationType.GetName<TPizzaTamanhoEnum>(oConsultarPedido.PizzaTamanho),
  // 3,length(TRttiEnumerationType.GetName<TPizzaTamanhoEnum>(oConsultarPedido.PizzaTamanho)))));
  // mmRetornoConsulta.Lines.Add('Sabor : '+UpperCase(Copy(TRttiEnumerationType.GetName<TPizzaSaborEnum>(oConsultarPedido.PizzaSabor),3,
  // length(TRttiEnumerationType.GetName<TPizzaSaborEnum>(oConsultarPedido.PizzaSabor)))));
  // mmRetornoConsulta.Lines.Add('Preço : '+ FormatCurr('R$0.00',oConsultarPedido.ValorTotalPedido));
  // mmRetornoConsulta.Lines.Add('Tempo : '+ oConsultarPedido.TempoPreparo.ToString + ' minutos.');
  // mmRetornoConsulta.Lines.Add( '===============================');
  //
  // finally
  // oConsultarPedido.Free;
  // end;
  // finally
  // Clt.Free;
  // end;
//end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Clt: TRestClient;
  oEfetuarPedido: TEfetuarPedidoDTO;
begin
  Clt := MVCFramework.RESTClient.TRestClient.Create(edtEnderecoBackend.Text,
    StrToIntDef(edtPortaBackend.Text, 80), nil);
  try
    oEfetuarPedido := TEfetuarPedidoDTO.Create;
    try
      oEfetuarPedido.PizzaTamanho :=
        TRttiEnumerationType.GetValue<TPizzaTamanhoEnum>(cmbTamanhoPizza.Text);
      oEfetuarPedido.PizzaSabor :=
        TRttiEnumerationType.GetValue<TPizzaSaborEnum>(cmbSaborPizza.Text);
      oEfetuarPedido.DocumentoCliente := edtDocumentoCliente.Text;
      mmRetornoWebService.Text := Clt.doPOST('/efetuarPedido', [],
        TJson.ObjecttoJsonString(oEfetuarPedido)).BodyAsString;
    finally
      oEfetuarPedido.Free;
    end;
  finally
    Clt.Free;
  end;
end;

end.
