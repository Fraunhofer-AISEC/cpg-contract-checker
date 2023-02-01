address public previousOwner;
address public currentOwner;
uint public txTimeStamp;
event transferred();

function transfer() external payable onlyOwnerB {
     require (msg.value == 1 ether);
     ownerA.transfer(1 ether);
     previousOwner = ownerA;
     currentOwner = ownerB;
     txTimeStamp = now;
     emit transferred();
}
