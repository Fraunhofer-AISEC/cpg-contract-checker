

pragma solidity ^0.8.0;

contract T1 {
    
    function shuffleArray(string[5] memory _dnaArray) public view returns(string[5] memory) {
        for (uint256 i = 0; i < _dnaArray.length; i++) {
            uint256 n = i + uint256(keccak256(abi.encodePacked(block.timestamp))) % (_dnaArray.length - i);
            string memory temp = _dnaArray[n];
            _dnaArray[n] = _dnaArray[i];
            _dnaArray[i] = temp;
        }
        return _dnaArray;
    }

    function getJDNA(string[5] memory _dnaArray) public view returns (string memory) {
        return string(abi.encodePacked(keccak256(abi.encodePacked(_dnaArray[0], _dnaArray[1], _dnaArray[2], _dnaArray[3], _dnaArray[4]))));
    }
        
    function parseInt(string memory _value) public pure returns (uint _ret) {
        bytes memory _bytesValue = bytes(_value);
        uint j = 1;
        for(uint i = _bytesValue.length-1; i >= 0 && i < _bytesValue.length; i--) {
            assert(uint8(_bytesValue[i]) >= 48 && uint8(_bytesValue[i]) <= 57);
            _ret += (uint8(_bytesValue[i]) - 48)*j;
            j*=10;
        }
    }
    
    function getFinal() public view returns (uint) {
        uint chance = parseInt(getJDNA(shuffleArray(["a","b","c","d","e"])));
    }
}
