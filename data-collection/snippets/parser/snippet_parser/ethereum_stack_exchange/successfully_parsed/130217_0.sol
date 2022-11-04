pragma solidity 0.8.14;

contract A{
    receive() payable external{
        set = "hello";
    }
    string public set;
    constructor() payable {
        set = "world";
    }

}

contract B{

    event deploy(address addr);
    function Deploy(uint _salt) external{
        A me = new A{salt: bytes32(_salt)}();
        emit deploy(address(me));
    }

    function getaddress(uint _salt) public view returns(address){
    bytes32 hash = keccak256(abi.encodePacked(bytes1(0xFF),address(this),_salt , keccak256(getBytecode(msg.sender))));
    return address(uint160(uint(hash)));
    }

    function getBytecode(address _owner) public pure returns(bytes memory){
    bytes memory bytecode = type(A).creationCode;
    return abi.encodePacked(bytecode , abi.encode(_owner));
    }

}
