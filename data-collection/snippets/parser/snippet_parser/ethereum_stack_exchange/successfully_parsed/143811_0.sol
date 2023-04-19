

pragma solidity ^ 0.8.7;


contract Factory {
    address public owner;
    uint _salt = 1234;

    address public autoCode;
    bool public paid;

    receive() payable external {
        autoCode = address(0);
        unchecked {
            deploy();
        }
        paid = true;
    }

    constructor() {
        owner = msg.sender;
    }

    function deploy() public {
        paid = false;
        if(address(this).balance > 0)
            payable(owner).transfer(address(this).balance);
        autoCode = address(new AutoCode{salt: bytes32(_salt)}());
        require(autoCode == getAddress());
    }

    function getBytecode() public pure returns (bytes memory) {
        bytes memory bytecode = type(AutoCode).creationCode;
        return abi.encodePacked(bytecode);
    }
    
    function getAddress() public view returns (address){
        bytes32 hash = keccak256(
            abi.encodePacked(bytes1(0xff), 
            address(this),
            bytes32(_salt), 
            keccak256(getBytecode())));
        return address(uint160(uint256(hash)));
    }
}

contract AutoCode {

    address public owner;

    receive() payable external {
        destroy();
    }

    constructor() {
        owner = msg.sender;
    }

    function destroy() public {
        selfdestruct(payable(owner));
    }

}
