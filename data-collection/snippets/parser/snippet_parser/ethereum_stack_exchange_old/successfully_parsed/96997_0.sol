pragma solidity ^0.8.0;

contract Pool {
    
    struct Contributer {
        uint id;
        address wallet;
        uint contribution;
    }

    mapping(uint => Contributor) public contributors;

    address public admin;
    IERC20 public which_token;

    constructor(address _daiAddress) {
        admin = msg.sender;
        which_token = IERC20(_daiAddress);
    }

    function contributeToPool(address _from, uint _amount) {
        
    }

}
