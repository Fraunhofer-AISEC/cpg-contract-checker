
pragma solidity ^0.8.0;

contract Test {

    struct unnamed {
        mapping(string=>uint) crowdFundName;   
    }

    mapping(address=>unnamed) _map;

    
    function addCrowdfund(string memory _nameDeposit, uint _amount) public {
        _map[msg.sender].crowdFundName[_nameDeposit] = _amount;
    }

    
    function retrieveCrowdfund(string memory _nameDeposit) external view returns(uint) {
        return _map[msg.sender].crowdFundName[_nameDeposit];
    }

}
