contract Escrow {

    mapping(address => uint256) public payments;
    mapping(address => uint256) public released;
    mapping(address => uint256) public transferred;
    address public owner;

    constructor() public {
        owner = msg.sender;
    }
    function payInto() payable {
        require(msg.value > 0, 'Sender attempted to pay zero amount.');
        require(payments[msg.sender] == 0, 'Sender previously paid into escrow.');
        payments[msg.sender] = msg.value;
    }

    function release() {
        require(payments[msg.sender] > 0, 'Sender has not paid into escrow.');
        require(released[msg.sender] == 0, 'Sender has already released funds.');
        released[msg.sender] = payments[msg.sender];
    }

    function safeWithdraw(address buyer) {
        require(msg.sender == owner, 'Non-owner tried to withdraw funds.');
        require(released[buyer] > 0, 'No released funds from buyer to withdraw.');
        require(transferred[buyer] == 0, 'Re-entrancy attempt during withdrawal.');
        transferred[buyer] = released[buyer];
        owner.transfer(released[buyer]);
    }
}
