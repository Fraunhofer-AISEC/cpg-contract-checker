pragma solidity ^0.6.0;

contract MyWallet {
    
    address[] addressArray;
    uint[] shareAmountArray;
    
    function receive() external payable{
    }
    
    function addAddressandShareAmount(address payable adrs, uint numberOfShares) public {
        require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        addressArray.push(adrs);
        shareAmountArray.push(numberOfShares);
    }
    
    function getPosition(uint index) public view returns (address) {
        return addressArray[index];
    }
    
    function payShareHolders(address payable address1, uint256 amount1) public {
        require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
        for(addressArray[0]; addressArray[addressArray.length]){
            address.transfer(1 ether);
        }
}
