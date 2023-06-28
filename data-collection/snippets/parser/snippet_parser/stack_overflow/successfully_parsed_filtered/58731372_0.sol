pragma solidity 0.5.1;

contract MyContract {

    uint256 totalSupply; 
    mapping(address => uint256) public balances;
    address owner;

    constructor(address payable _wallet) public {
        totalSupply = 10;
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
       function setTotalSupply(uint256 newSupply)public {
        require(msg.sender == owner && totalSupply<1);
        totalSupply = newSupply;

    }
    function getBalance() public view returns  (uint) {
        return address(this).balance;
    }

}
