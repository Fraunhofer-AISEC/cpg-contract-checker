



pragma solidity ^0.8.4;



contract contratoBasico {

address public criador;

mapping (address => address) public listaDeContas;

event Sent(address from);



constructor() {

criador = msg.sender;

}



function addConta() public {

listaDeContas[msg.sender] = msg.sender;

emit Sent(msg.sender);

}

}
