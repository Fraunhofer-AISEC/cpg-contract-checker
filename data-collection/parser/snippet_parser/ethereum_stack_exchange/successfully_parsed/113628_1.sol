
pragma solidity ^0.8.10;

contract Escrow{
    
    address payable owner;
    address payable importer; 
    address payable exporter;
    address carrier;
    uint value;
    State state;
 

    event EscrowCreated(address indexed _importer, address indexed _exporter, address indexed _carrier, uint _value);

    constructor (address payable _carrier, address payable _exporter, uint256 _value) {
        require(_carrier != address(0), "Carrier missing");
        require(_exporter != address(0), "Exporter missing");
        owner = payable(msg.sender); 
        importer = payable(msg.sender);
        carrier = _carrier;
        exporter = _exporter;
        value = _value;
        state = State.waitingForDeposit;
        emit EscrowCreated(msg.sender, _exporter, _carrier, _value);
    }
    
}
