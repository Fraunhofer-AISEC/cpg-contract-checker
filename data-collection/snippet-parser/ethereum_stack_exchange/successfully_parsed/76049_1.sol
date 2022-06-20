pragma solidity >=0.5.1 <0.6.0;

contract leilaoSimples{
    uint valorAtual;
    address payable comprador;
    address dono;
    string nome;
    uint contadorDeOfertas = 0;
    uint[] ofertas;

    constructor(uint valorInicial) public{
        valorAtual=valorInicial;
        dono = msg.sender;
    }

    function set() public payable{
        uint oferta = msg.value;
        require(oferta>valorAtual, "Oferta abaixo do valor atual.");
        require(comprador!=msg.sender, "Você deu o último lance.");

        comprador.transfer(valorAtual);

        valorAtual = oferta;
        contadorDeOfertas++;
        ofertas.push(valorAtual);
        comprador = msg.sender;
    }

    function get() public view returns(
        address _dono,
        uint _contadorDeOfertas,
        address _comprador,
        uint _ultimaOferta,
        uint[] _historicoDeOfertas
    ){
        return(
            dono,
            contadorDeOfertas,
            comprador,
            valorAtual,
            ofertas
        );
    }
}
