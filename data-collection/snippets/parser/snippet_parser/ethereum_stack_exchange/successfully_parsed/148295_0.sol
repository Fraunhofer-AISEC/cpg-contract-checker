
pragma solidity ^0.8.0;

contract TransactionContract {
    struct Product {
        string name;
        uint256 price;
    }

struct Transaction {
    uint256 id;
    uint256 date;
    address buyer;
    address seller;
    uint256 ORnumber;
    Product[] products;
    uint256 total;
}

Transaction[] public transactions;

function addTransaction(
    uint256 _id,
    uint256 _date,
    address _buyer,
    address _seller,
    uint256 _ORnumber,
    Product[] memory _products
) public {
    uint256 _total = 0;
    for (uint256 i = 0; i < _products.length; i++) {
        _total += _products[i].price;
    }

    Transaction memory newTransaction = Transaction({
        id: _id,
        date: _date,
        buyer: _buyer,
        seller: _seller,
        ORnumber: _ORnumber,
        products: _products,
        total: _total
    });

    transactions.push(newTransaction);
}

function getTransaction(uint256 _index)
    public
    view
    returns (
        uint256 id,
        uint256 date,
        address buyer,
        address seller,
        uint256 ORnumber,
        Product[] memory products,
        uint256 total
    )
{
    require(_index < transactions.length, "Transaction index out of bounds.");
    Transaction storage transaction = transactions[_index];

    return (
        transaction.id,
        transaction.date,
        transaction.buyer,
        transaction.seller,
        transaction.ORnumber,
        transaction.products,
        transaction.total
    );
}

function getAllTransactions()
    public
    view
    returns (Transaction[] memory)
{
    return transactions;
}
}
