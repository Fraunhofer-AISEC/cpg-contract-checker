pragma solidity 0.5.1;

contract Trivial {

    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public payable {
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;
        msg.sender.transfer(amount);
    }
}

contract Curious {

   function inspect(Trivial trivial, address account) public view returns(uint balance) {
       balance = trivial.balances(account); 
   } 
}
