pragma solidity ^0.4.21;

contract Demo {
    event Deposit(
        address indexed _from,
        bytes32 indexed _id,
        uint256 _value
    );

    function highLevelEvent() public {
        bytes32 _id = hex"420042";
        emit Deposit(msg.sender, _id, 123);
    }

    function lowLevelEvent() public {
        bytes32 _id = hex"420042";
        log3(
            bytes32(uint256(123)),
            bytes32(keccak256("Deposit(address,bytes32,uint256)")),
            bytes32(uint256(uint160(msg.sender))),
            _id
        );
    }
    
    
    

    function AssemblyEvent() public {
        bytes32 _id = hex"420042";
        bytes32 t1 = bytes32(uint256(123));
        bytes32 t2 = bytes32(keccak256("Deposit(address,bytes32,uint256)"));
        bytes32 t3 = bytes32(uint256(uint160(msg.sender)));

        assembly {
            let s := 0x20
            let p := _id
            log3(p, s, t1, t2, t3)
        }
    }
}
