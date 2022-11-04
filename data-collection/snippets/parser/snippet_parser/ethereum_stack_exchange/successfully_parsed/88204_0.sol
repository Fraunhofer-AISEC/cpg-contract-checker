uint money = (msg.sender).balance;
uint myUintValue = 20;
function getEther() public returns(uint) {
    money = money + 1  ether;
    return money;
}
