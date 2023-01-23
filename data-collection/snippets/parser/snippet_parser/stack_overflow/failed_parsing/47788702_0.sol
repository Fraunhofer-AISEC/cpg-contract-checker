contract Matematicas{
    uint256 ultimaSuma;
    uint256 ultimaMultiplicacion;
    uint256 contador;
    uint256 factorA;
    uint256 factorB;
    uint256 sumandoA;
    uint256 sumandoB;
    bytes datosMensaje;...

    function multiplica(uint256 a, uint256 b) public{
        datosMensaje=msg.data;
        factorA=a;
        factorB=b;
        ultimaMultiplicacion=(a*b);
    }
... 
}
