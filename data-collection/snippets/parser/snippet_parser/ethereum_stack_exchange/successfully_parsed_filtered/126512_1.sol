
pragma solidity ^0.8.4;

contract TestContract {
    address ownerAddress;

    constructor() {
        ownerAddress = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == ownerAddress,"Visible only by owner");
        _;
    }

    struct Participant {
        address participantAddress;
        string team;
        string personalDescription;
        string secret;    
    }

    
    mapping(address => Participant) private participantsMapping;

    function fillMapping(Participant memory _partecipant) public {
        participantsMapping[msg.sender] = _partecipant;
    }

    
    function getFields(address _address) external view returns(address participantAddress, string memory team, string memory personalDescription) {
        return (participantsMapping[_address].participantAddress, participantsMapping[_address].team, participantsMapping[_address].personalDescription);
    }

    
    function getSecret(address _address) onlyOwner external view returns(string memory secret) {
        return (participantsMapping[_address].secret);
    }

}
