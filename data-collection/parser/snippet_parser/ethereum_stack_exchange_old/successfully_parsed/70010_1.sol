pragma solidity >=0.4.21 <0.6.0;

contract CertificateOwnable {

    address public ownerAddress;

    event OwnershipRenounced(address indexed previousOwner);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public {
        ownerAddress = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == ownerAddress);
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0));
        emit OwnershipTransferred(ownerAddress, newOwner);
        ownerAddress = newOwner;
    }

    function renounceOwnership() public onlyOwner {
        emit OwnershipRenounced(ownerAddress);
        ownerAddress = address(0);
    }
}
