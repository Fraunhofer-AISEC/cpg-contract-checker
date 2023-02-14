

pragma solidity >=0.7.0 <0.9.0;

contract Stakers {

    struct Staker {
        address addrs;
        uint amount;
    }

    Staker[] public stakers;

    function addStaker(address _addr, uint _amount) external {
        stakers.push(Staker(_addr, _amount));
    }

    function getStakers() external view returns(Staker[] memory) {
        return stakers;
    }

}
