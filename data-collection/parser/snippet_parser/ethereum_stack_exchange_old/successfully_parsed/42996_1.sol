mapping (address => uint) countTotal;

function countSends() public returns(uint retClicks) {
    countTotal[msg.sender]++;
    return countTotal[msg.sender];
}
