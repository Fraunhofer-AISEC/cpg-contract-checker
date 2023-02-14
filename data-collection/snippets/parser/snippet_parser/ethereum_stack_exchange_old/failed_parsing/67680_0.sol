pragma solidity ^0.4.2;

CODE:

mapping (address => uint) private saldos;

function deposito() public returns (uint) {
    saldos[msg.sender] += msg.value;

    
    

    LogRealizacaoDeDeposito(msg.sender, msg.value); 

    return saldos[msg.sender];
}
