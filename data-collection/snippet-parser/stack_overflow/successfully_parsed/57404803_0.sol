pragma solidity ^0.4.21;

contract TransferERC20 {

    event TransferEvent (
        bool _flag,
        string _invoiceId,
        address _erc20ContractHash,
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    function transfer(string _invoiceId, address _erc20ContractHash,address _from, address _to, uint256 _amount) public returns (bool) {
        bytes4 methodTransfer = bytes4(keccak256("transfer(address,uint256)"));
        if(_erc20ContractHash.call(methodTransfer, _to, _amount)) {
            emit TransferEvent(true, _invoiceId, _erc20ContractHash, _from, _to, _amount);
            return true;
        }
        emit TransferEvent(false, _invoiceId, _erc20ContractHash, _from, _to, _amount);
        return false;
    }
}
