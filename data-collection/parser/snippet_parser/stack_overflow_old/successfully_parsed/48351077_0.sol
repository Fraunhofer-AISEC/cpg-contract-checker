contract  AcceptEth {
    address public owner;
    uint public bal;
    uint public price;
    mapping (address => uint) balance;

    function AcceptEth() {
        
        owner = msg.sender;
        
        price = 2 ether;
    }

    function accept() payable returns(bool success) {
        
        balance[msg.sender] -= price;
        
        balance[owner] += price;
        return true;
    }
}
