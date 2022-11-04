
pragma solidity >0.6.0;

contract SimpleStorage {

    mapping(string => uint256) public nameToNumber;

    
    function store_first(uint256 _favoriteNumber, string memory _name) public {
        nameToNumber[_name] = _favoriteNumber;
    }

    
    function store_second(string memory _name, uint256 _favoriteNumber) public {
        nameToNumber[_name] = _favoriteNumber;
    }

    function retrieve(string memory _name) public view returns(uint256){
        return nameToNumber[_name];
    }
}
