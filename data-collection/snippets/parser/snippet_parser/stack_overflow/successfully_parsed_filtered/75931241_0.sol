

pragma solidity ^0.8.0;

contract Prontuario {
    struct Evolucao {
        string categoria;
        string titulo;
        string descricao;
        string data;
    }

    Evolucao [] public evolucoes; 

    function addEvolucao(string memory _categoria, string memory _titulo, string memory _descricao, string memory _data) public {
        Evolucao memory newEvolucao;
        newEvolucao.categoria = _categoria;
        newEvolucao.titulo = _titulo;
        newEvolucao.descricao = _descricao;
        newEvolucao.data = _data;

        evolucoes.push(newEvolucao);
    }

     function getAllEvolucoes() public view returns (Evolucao[] memory) {
         return evolucoes;
     }
}
