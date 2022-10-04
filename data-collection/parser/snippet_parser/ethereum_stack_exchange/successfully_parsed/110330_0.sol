

pragma solidity ^0.8.0;

contract Substring {
    
    function substring(string memory str, uint startIndex, uint endIndex) public view returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return string(result);
    }
    
    function shuffleArray(string[5] memory _dnaArray) public view returns(string[5] memory) {
        for (uint256 i = 0; i < _dnaArray.length; i++) {
            uint256 n = i + uint256(keccak256(abi.encodePacked(block.timestamp))) % (_dnaArray.length - i);
            string memory temp = _dnaArray[n];
            _dnaArray[n] = _dnaArray[i];
            _dnaArray[i] = temp;
        }
        return _dnaArray;
    }
    
    function getJDNA(string[5] memory _dnaArray) public view returns (uint) {
        return uint(keccak256(abi.encodePacked(_dnaArray[0], _dnaArray[1], _dnaArray[2], _dnaArray[3], _dnaArray[4])));
    }
    
    function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        return string(bstr);
    }
    
    function getDNA() public view returns (string memory,string memory){
        uint dna = getJDNA(shuffleArray(["a","b","c","d","e"]));
        string memory DNA = uint2str(dna);
        string memory chance = substring(DNA, 0,2);
        return (DNA, chance);
    }
}
