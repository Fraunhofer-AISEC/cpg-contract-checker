pragma solidity ^0.5.11;

contract ProntuarioHistorico2 {

    struct Dados {
        uint altura;
        uint peso;
    }


    struct DesempenhoVida {
        uint circunferencia;
        uint idade;
        uint saude;
        bool fumante;
    }

    mapping (address => Dados) register_Dados;
    mapping (address => DesempenhoVida) register_DesempenhoVida;

    function setDados(uint altura, uint peso) public {
        register_Dados[msg.sender] = Dados({
            altura: altura,
            peso: peso
        });
    }

    function getaltura() public view returns(uint) {
        return register_Dados[msg.sender].altura;
    }

    function getpeso() public view returns(uint) {
        return register_Dados[msg.sender].peso;
    }

    function setDesempenhoVida(uint circunferencia, uint idade, uint saude, bool fumante) public {
        register_DesempenhoVida[msg.sender] = DesempenhoVida({
            circunferencia: circunferencia,
            idade: idade,
            saude: saude,
            fumante: fumante
        });
    }

    function getcircunferencia() public view returns(uint) {
        return register_DesempenhoVida[msg.sender].circunferencia;
    }

    function getidade() public view returns(uint) {
        return register_DesempenhoVida[msg.sender].idade;
    }

    function getsaude() public view returns(uint) {
        return register_DesempenhoVida[msg.sender].saude;
    }

    function getfumante() public view returns(bool) {
        return register_DesempenhoVida[msg.sender].fumante;
    }


}
