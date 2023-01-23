mapping(bytes32 => Contract) public contracts;
bytes32[] public customerContracts;
uint public totalBalance

struct Contract {
    address customer;
    uint inventory;
}

function totalInventory()
public
{
 uint temporaryBalance;
 for (uint i = 0; i < contracts.length; i++) {
     Subcontract storage k = contracts[customerContracts[i]];
     temporaryBalance += k.inventory;
 }
 totalBalance = temporaryBalance;
 }
