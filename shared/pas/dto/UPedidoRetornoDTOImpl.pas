unit UPedidoRetornoDTOImpl;

interface

uses
  Soap.InvokeRegistry, UPizzaTamanhoEnum, UPizzaSaborEnum,
  MVCFramework.Serializer.Commons;

type

  [MVCNameCase(ncLowerCase)]
  Tpedidoretornodto = class(TRemotable)
  private
    fpizzatamanho: TPizzaTamanhoEnum;
    fpizzasabor: TPizzaSaborEnum;
    fvalortotalpedido: Currency;
    ftempopreparo: Integer;
  published
    property pizzaTamanho: TpizzatamanhoEnum read Fpizzatamanho
      write fpizzaTamanho;
    property pizzaSabor: TpizzaSaborEnum read fpizzaSabor write fpizzaSabor;
    property valortotalPedido: Currency read fvalortotalPedido
      write fvalorTotalPedido;
    property tempoPreparo: Integer read ftempoPreparo write ftempoPreparo;
  public
    constructor Create(const APizzaTamanho: TPizzaTamanhoEnum;
      const APizzaSabor: TPizzaSaborEnum; const AValorTotalPedido: Currency;
      const ATempoPreparo: Integer); reintroduce;
  end;

implementation

{ TPedidoRetornoDTO }

constructor TPedidoRetornoDTO.Create(const APizzaTamanho: TPizzaTamanhoEnum;
  const APizzaSabor: TPizzaSaborEnum; const AValorTotalPedido: Currency;
  const ATempoPreparo: Integer);
begin
  FPizzaTamanho := APizzaTamanho;
  FPizzaSabor := APizzaSabor;
  FValorTotalPedido := AValorTotalPedido;
  FTempoPreparo := ATempoPreparo;
end;

end.
