contract  AcceptEth {
    address public owner;
    uint public price;
    mapping (address => uint) balance;

    function AcceptEth() {
        
        owner = msg.sender;
        
        price = 2 ether;
    }

    function accept() payable {
        
        require(msg.value == price);

        
        balance[msg.sender] += msg.value;
    }
}
