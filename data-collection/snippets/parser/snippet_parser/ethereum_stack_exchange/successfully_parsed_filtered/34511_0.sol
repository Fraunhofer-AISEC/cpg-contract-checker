function findSupplierByName(string supplierName) public view returns (address id, string name) {
    for (uint idx = 0; idx < supplierAddresses.length; idx++) {
        address supplierAddress = supplierAddresses[idx];
        var supplier = suppliers[supplierAddress];

        if (keccak256(supplier.name) == keccak256(supplierName)) {
            return (
                supplier.id,
                supplier.name
            );
        }
    }

    revert();
}
