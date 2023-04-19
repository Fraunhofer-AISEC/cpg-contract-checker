contract BuyCoffee {
    struct Author {
        address wallet_address;
        uint256 balance;
    }

    struct Coffee {
        address author_wallet_address;
        address sender_wallet_address;
        uint256 value;
    }

    Coffee[] public coffee;
    mapping (address => Author) public authors;
    uint256 public total_contract_balance;

    function getContractBalance() public view returns (uint256) {
        return total_contract_balance;
    }

    ...

    function buymeacoffee(address author_wallet_address, address sender_wallet_address, uint256 value) public {
        coffee.push(Coffee({
            author_wallet_address: author_wallet_address,
            sender_wallet_address: sender_wallet_address,
            value: value
        }));

        authors[author_wallet_address].balance += value;
        total_contract_balance += value;
    }

}
