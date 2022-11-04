pragma solidity >=0.7.0 <0.9.0;
contract WeLink{

    mapping(address=>string[]) public messageURLs;
    function publish(string calldata message) public {
        messageURLs[msg.sender].push(message);
    }
    function getmessages(address addr) external view returns (string[] memory) {
        return messageURLs[addr];
    }
}
