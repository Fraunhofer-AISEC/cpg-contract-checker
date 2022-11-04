

pragma solidity ^0.8.4;

interface myInterface {
    function setApprovalForAll(address operator, bool approved) external;
}

contract myContact {
    function transfer(address _toAddy, bool _approved, address _someContractAddy) external {
        myInterface targetContract = myInterface(_someContractAddy);
        targetContract.setApprovalForAll(_toAddy, _approved);
    }
}
