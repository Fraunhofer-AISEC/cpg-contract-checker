pragma solidity >=0.4.0 <0.7.0;

contract SimpleDAO {
    mapping (address => uint256) public credit;
    bool flag = true;

    constructor() payable public {
        donate();
    }

    function donate() payable public{
        credit[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public{
        require(flag, "Only one time call is allowed.");
        flag = false;
        if (credit[msg.sender]>= amount) {
            credit[msg.sender]-=amount;
        }
    }

    function queryCredit(address to) public view returns (uint256) {
        return credit[to];
    }
}
