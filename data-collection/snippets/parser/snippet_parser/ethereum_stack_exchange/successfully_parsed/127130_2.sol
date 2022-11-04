pragma solidity <= 0.9.0;

contract camelcoin {
    address public founder;
    uint256 public totalsupply;
    struct Shareholder {
        uint account_index;
        uint balance;
        uint escrow;
        uint stake;
    }
    mapping(address => Shareholder) public shareholders;

    constructor() public {
        founder = msg.sender;
    }

    function fetchFounder() public view returns(address){
        return founder;
    }

    function fetchTotalSupply() public view returns(uint){
        return totalsupply;
    }
}