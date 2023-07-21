
pragma solidity >=0.8.0 <0.9.0;

struct Message {
    string from;
    string message;
}

contract Messenger {
    
    mapping(string => address) private nameToAddressLookup;
    mapping(address => string) private addressToNameLookup;
    mapping(string => Message[]) private userMessages;

    function send(
        string calldata toName,
        string calldata data
    ) public returns (bool) {
        address _fromAdd = msg.sender;
        address _toAdd = nameToAddressLookup[toName];

        string memory from = addressToNameLookup[_fromAdd];
        string memory _to = addressToNameLookup[_toAdd];

        Message memory message = Message(from, data);
        userMessages[_to].push(message);
        return true;
    }

    function register(string calldata name) public {
        
        addressToNameLookup[msg.sender] = name;
        
        nameToAddressLookup[name] = msg.sender;
    }

    function getMessages() public view returns (Message[] memory) {
        return userMessages[addressToNameLookup[msg.sender]];
    }
}
