pragma solidity >=0.6.10;

contract NoUsePayable {
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract selfDestruct {
    function kill(address payable addr) public payable{
        selfdestruct(addr);
    }
}
