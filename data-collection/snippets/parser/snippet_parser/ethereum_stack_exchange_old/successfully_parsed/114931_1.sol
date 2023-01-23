pragma solidity 0.8.9;

contract Test {
    string public output;

    constructor() {
        string memory url = "https://APIURL/functions/functionName?address=";
        string memory senderAddress = bytes20ToLiteralString(
            bytes20(msg.sender)
        );
        output = string(
            abi.encodePacked(
                url,
                senderAddress
            )
        );
    }

    function bytes20ToLiteralString(bytes20 data) 
        private
        pure
        returns (string memory result)
    {
        bytes memory temp = new bytes(41);
        uint256 count;

        for (uint256 i = 0; i < 20; i++) {
            bytes1 currentByte = bytes1(data << (i * 8));
            
            uint8 c1 = uint8(
                bytes1((currentByte << 4) >> 4)
            );
            
            uint8 c2 = uint8(
                bytes1((currentByte >> 4))
            );
        
            if (c2 >= 0 && c2 <= 9) temp[++count] = bytes1(c2 + 48);
            else temp[++count] = bytes1(c2 + 87);
            
            if (c1 >= 0 && c1 <= 9) temp[++count] = bytes1(c1 + 48);
            else temp[++count] = bytes1(c1 + 87);
        }
        
        result = string(temp);
    }
    
}
