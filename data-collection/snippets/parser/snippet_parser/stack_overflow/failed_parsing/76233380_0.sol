pragma solidity >=0.4.25 <0.9.0;

contract HelloBlockchain {
    
    .....
    
    string public ResponseMessage;

    .....

    function getRequestMessage() view external returns(string memory) {
        return RequestMessage;
    }
}
