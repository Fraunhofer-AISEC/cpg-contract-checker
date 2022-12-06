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
