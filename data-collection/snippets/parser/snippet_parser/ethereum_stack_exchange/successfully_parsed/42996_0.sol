mapping (address => uint) countTotal;

function countSends() public returns(uint retClicks) {
    clicksTotal[msg.sender]++;
    return countTotal[msg.sender];
}
