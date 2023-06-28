pragma solidity ^0.8.10;


import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract TransactionContract {
    enum TransactionType {
        payment,
        donation
    }
    struct Transaction {
        string description;
        TransactionType transaction_type;
        IERC20 token;
        uint256 exchange_rate;
        uint256 amount;
        uint256 converted_amount;
        string remarks;
    }

    string public display_name;
    address public wallet_address;
    string[] public transaction_list;
    mapping(string => Transaction) public transactions;

    function initializeProfile(string memory displayName) public {
        display_name = displayName;
        wallet_address = msg.sender;
    }

    function createTransaction(string memory transactionID, Transaction memory transactionDetails) payable public {
        require(msg.value >= transactionDetails.converted_amount);
        transactionDetails.token.transfer(payable(wallet_address), transactionDetails.converted_amount);
        transactions[transactionID] = transactionDetails;
        transaction_list.push(transactionID);
    }

}
