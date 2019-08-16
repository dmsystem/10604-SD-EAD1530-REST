unit UEfetuarPedidoDTOImpl;

interface

uses
  Soap.InvokeRegistry, UPizzaTamanhoEnum,
  UPizzaSaborEnum,
  MVCFramework.Serializer.Commons;

type
  [MVCNameCase(ncLowerCase)]
  TEfetuarPedidoDTO = class(TRemotable)
  private
    fpizzatamanho: TPizzaTamanhoEnum;
    fpizzasabor: TPizzaSaborEnum;
    fdocumentocliente: String;
  published
    property pizzatamanho: TPizzaTamanhoEnum read FpizzaTamanho
      write fpizzaTamanho;
    property pizzasabor: TPizzaSaborEnum read fpizzaSabor write fpizzaSabor;
    property documentocliente: String read fdocumentoCliente
      write fdocumentoCliente;
  end;

implementation

end.
