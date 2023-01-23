
    pragma solidity 0.8.13;
    
    contract VaultContract {
        struct Vault {
            address creator;
            string name;
            address[] users;
            uint256 amount;
        }
    
        uint256 totalVaults;
        mapping(uint256 => Vault) public vaults;
        mapping(address => uint256) public balance;
    
        event VaultDistrubtion(uint256 vaultId, uint256 amount);
    
        function createVault(
            string memory name,
            address[] memory users,
            uint256 initialAmount
        ) public returns (uint256 vaultId) {
            Vault storage vault = vaults[totalVaults];
            vault.creator = msg.sender;
            vault.name = name;
            vault.users = users;
            vault.amount = initialAmount;
            totalVaults += 1;
            return totalVaults - 1;
        }
    
        function addAmount(uint256 vaultId, uint256 amount) public {
            Vault storage vault = vaults[vaultId];
            require(msg.sender == vault.creator, "Not vault owner");
            vault.amount = amount;
        }
    
        function distribute(uint256 vaultId) public {
            Vault storage vault = vaults[vaultId];
            uint256 amountPerUser = vault.amount / vault.users.length;
            if (vault.amount != 0) {
                for (uint8 i; i < vault.users.length; i++) {
                    vault.amount -= amountPerUser;
                    balance[vault.users[i]] = amountPerUser;
                }
            }
            else {
                revert("No Funds Available");
            }
            emit VaultDistrubtion(vaultId, amountPerUser * vault.users.length);
        }
    }
