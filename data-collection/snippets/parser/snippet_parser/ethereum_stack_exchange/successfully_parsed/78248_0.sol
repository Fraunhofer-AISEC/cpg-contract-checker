pragma solidity 0.4.24;

contract MyContract {

    uint256 public  totalSupply ; 
    mapping( address => uint256) public  balances ;
    address public owner;

    constructor(address _wallet) public payable {
        totalSupply = 6;
        owner = _wallet;
    }

    function () external payable{
        buyToken();
    }

    function buyToken() public payable {
        require(totalSupply >= (msg.value/1000000000000000000)*2);
        balances[msg.sender] += (msg.value/1000000000000000000)*2;
        totalSupply -=(msg.value/1000000000000000000)*2;

    }
    function getTotalSupply()public view returns  (uint256 ){
        return totalSupply;
    }
       function setTotalSupply(uint256 newSupply) public {
        require(msg.sender==owner);
        totalSupply = newSupply;

    }

}
