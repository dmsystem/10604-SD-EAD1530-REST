unit UConsultarPedidoDTOImpl;

interface

uses
  Soap.InvokeRegistry,
  MVCFramework.Serializer.Commons;

type
  [MVCNameCase(ncLowerCase)]
  TConsultarPedidoDTO = class(TRemotable)
  private
    FDocumentoCliente: String;
  published
    property DocumentoCliente: String read FDocumentoCliente
      write FDocumentoCliente;
  end;

implementation

end.
