uint256 public count;
mapping (address => bool) public senders;

function () external payable {
    if (senders[msg.sender] == false) {
        require(count < 2);
        senders[msg.sender] = true;
        count++;
    }
}
