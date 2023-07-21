
pragma solidity ^0.8.12;

import "../../node_modules/@openzeppelin/contracts/utils/Create2.sol";
import "../../node_modules/@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import "../SimpleAccount.sol";


contract SimpleAccountFactory {
    SimpleAccount public immutable accountImplementation;

    constructor(IEntryPoint _entryPoint) {
        accountImplementation = new SimpleAccount(_entryPoint);
    }

    
    function createAccount(
        address owner,
        uint salt
    ) public returns (SimpleAccount ret) {
        address addr = getAddress(owner, salt);
        uint codeSize = addr.code.length;
        if (codeSize > 0) {
            return SimpleAccount(payable(addr));
        }
        ret = SimpleAccount(
            payable(
                new ERC1967Proxy{salt: bytes32(salt)}(
                    address(accountImplementation),
                    abi.encodeCall(SimpleAccount.initialize, (owner))
                )
            )
        );
    }

    
    function getAddress(
        address owner,
        uint salt
    ) public view returns (address) {
        return
            Create2.computeAddress(
                bytes32(salt),
                keccak256(
                    abi.encodePacked(
                        type(ERC1967Proxy).creationCode,
                        abi.encode(
                            address(accountImplementation),
                            abi.encodeCall(SimpleAccount.initialize, (owner))
                        )
                    )
                )
            );
    }

    function getERC1967ProxyBytecodeHash(
        address owner
    ) public view returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    type(ERC1967Proxy).creationCode,
                    abi.encode(
                        address(accountImplementation),
                        abi.encodeCall(SimpleAccount.initialize, (owner))
                    )
                )
            );
    }

    function getERC1967ProxyCreationCode() public pure returns (bytes memory) {
        return type(ERC1967Proxy).creationCode;
    }

    function getSalt(uint salt) public pure returns (bytes32) {
        return bytes32(salt);
    }

    function getERC1967ProxyConstructorCode(
        address owner
    ) public view returns (bytes memory) {
        return
            abi.encode(
                address(accountImplementation),
                abi.encodeCall(SimpleAccount.initialize, (owner))
            );
    }
}


