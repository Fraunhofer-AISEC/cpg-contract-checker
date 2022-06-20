pragma solidity ^0.5.0;

contract TokenFarm {
    string private _name = "DApp Token Farm";
    string private _symbol = "dATF";

    function name() public view returns (string memory) {
        return _name;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }
}
