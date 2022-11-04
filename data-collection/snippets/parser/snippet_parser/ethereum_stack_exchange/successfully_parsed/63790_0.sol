pragma solidity ^0.4.0
contract Registration {
    address public owner;
    uint threshold = 2;
    address [] participants;
    
    mapping(address => uint) public balances;
    uint conceptPrice;
    enum Stage{Initial, Registered, Modifiable, Done}
    Stage public stage = stage = Stage.Initial;
    function concept(uint _conceptPrice) public {
        owner = msg.sender;
        stage = Stage.Registered;
    }
    function saveContra() public constant returns (uint numParticipants){
        if (stage != Stage.Registered) return;
        participants.push(msg.sender);
        if (participants.length > threshold) {
            mineConcept();
        }
        
        numParticipants = participants.length;
    }
    function mineConcept(){
        balances[owner] += 100;
        for (uint i = 0; i < participants.length; i++) {
            balances[participants[i]] += 1;
        }
        stage = Stage.Modifiable;
    }
}
