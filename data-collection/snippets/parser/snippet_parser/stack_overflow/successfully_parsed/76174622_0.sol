 function convert(bytes memory data) public pure returns (string memory) {
        return abi.decode(data,(string));
    }

 function compare(string memory str1, string memory str2) public pure returns (bool) {
        return keccak256(abi.encodePacked(str1)) == keccak256(abi.encodePacked(str2));
    }

    function check(bytes32 temp)public pure returns(bool){
        bytes memory data= abi.encodePacked(temp);
        string memory res = convert(abi.encode(data)); 
        return compare(res, "har0");
    } 
