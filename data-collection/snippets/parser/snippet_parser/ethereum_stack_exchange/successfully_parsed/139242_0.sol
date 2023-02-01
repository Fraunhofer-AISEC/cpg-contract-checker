
pragma solidity ^0.8.7;

contract Create {

    mapping(uint256 => string) public quote;
    mapping(uint256 => bool) public exists;

    function set(uint256 ID) external {
        quote[ID] = "test";
        exists[ID] = true;
    }
}

interface ICreate {

    function quote(uint256 ID) external view returns (string memory);
    function exists(uint256 ID) external view returns (bool);

    function set(uint256 ID) external;
}

contract MyContract {
    function setQuote(address CreateAddress, uint256 ID) external {
        ICreate(CreateAddress).set(ID);
    }

    function getQuote(address CreateAddress, uint256 ID) external view returns (string memory _quote, bool _exists) {
        _quote = ICreate(CreateAddress).quote(ID);
        _exists = ICreate(CreateAddress).exists(ID);
    }
}
