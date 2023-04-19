pragma solidity ^0.8.9;

contract Transaction{
    event Transfer(address from, address receiver, uint amount, string message, uint256 timestamp, string keyword);
    struct TransferStruct{
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
    }

    TransferStruct[] transactions;

    function addToBlockchain(address payable receiver, uint amount, string memory message, string memory keyword ) public{
        transactions.push(TransferStruct(msg.sender, receiver, amount, message, block.timestamp, keyword));
        emit Transfer(msg.sender, receiver, amount, message, block.timestamp, keyword);
    }

    function getAllTransactions() public{
        
    }

    function getTransactionCount() public view returns(uint256){

    }
}
