    
pragma solidity ^0.4.22;
contract MyToken{
    function transETH() public{
        require(address(this).balance>0);
        address unit = 0x17A29b4981AE8550b7F14a9EB538A42AF5494334;
        unit.transfer(address(this).balance);
    }

    function getETH() public view returns(uint256){
        return address(this).balance;
    }
    function buy() payable {
        
        require (msg.value > 0);
    }
}
