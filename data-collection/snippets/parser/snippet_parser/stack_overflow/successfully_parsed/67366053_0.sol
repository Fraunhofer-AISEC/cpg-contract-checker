
pragma solidity >=0.8;

contract CoinA {
    
    bytes32 public coinName = "FAKE";

    mapping (address => uint) public balances;

    function transfer(address receiver, uint amount) public {
        require(balances[msg.sender] >= amount, "Not enough amount");
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }

    function set(uint amount) public {
        require(amount >= 0);
        balances[msg.sender] = amount;
    }

    function get() view public returns (uint) {
        return balances[msg.sender];
    }

}
