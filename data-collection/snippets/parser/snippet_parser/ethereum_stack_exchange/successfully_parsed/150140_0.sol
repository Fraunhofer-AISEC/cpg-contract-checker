contract Contracts_Factory {
    
    uint256 SIZE = 10;
    uint index = 0;
    string[] accounts = [
        "0x86d9Cd9A9F7263367fc232110CE987cF654DcF28",
        "0x6F746B2C11b766b813ae80AF50B7ff7244f53E7B",
        "0x12910F86889f796aC677BF70a5Da0C25d3485338",
        "0xae6AC0D3A3c8Aa519004163f969D32ee859c4e4c",
        "0x763EF7E590F979563cB598e21E9e45495C86a715",
        "0x47b57fAf1CEee1eC78F2C182f0e75AeE826D72E5",
        "0x47b57fAf1CEee1eC78F2C182f0e75AeE826D72E5",
        "0x7dD0D6eC2FE74A79A119F8d648bEE5C5d48CC53e",
        "0x87ccbFF8dA543CE840f7b7324da8c1e9ccEf4d33",
        "0x41Cc6B410264B37ef3cF629700F26253FF36afe9"
    ];




function getEthAccount() public view returns (string[] memory) {
    return accounts;
}

function getIndex() public view returns (uint) {
    return index;
}

function incrementIndex() public {
    index++;
}


int256 _manufacturer_SIZE = 0;
Manufacturer[] _manufacturers;

function createManufacturer() public {
    Manufacturer newManufacturer = new Manufacturer();
    _manufacturers.push(newManufacturer);
    _manufacturer_SIZE++;
}

function allManufacturers() public view returns (Manufacturer[] memory) {
    return _manufacturers;
}

function get_manufacturer_SIZE() public view returns (int256) {
    return _manufacturer_SIZE;
}


int256 _distributor_SIZE = 0;
Distributor[] _distributors;

function createDistributor() public {
    Distributor newdistributor = new Distributor();
    _distributors.push(newdistributor);
    _distributor_SIZE++;
}

function allDistributors() public view returns (Distributor[] memory) {
    return _distributors;
}

function get_distributor_SIZE() public view returns (int256) {
    return _distributor_SIZE;
}


int256 _retailer_SIZE = 0;
Retailer[] _retailers;

function createRetailer() public {
    Retailer newRetailer = new Retailer();
    _retailers.push(newRetailer);
    _retailer_SIZE++;
}

function allRetailers() public view returns (Retailer[] memory) {
    return _retailers;
}

function get_retailer_SIZE() public view returns (int256) {
    return _retailer_SIZE;
}


int256 _customer_SIZE = 0;
Customer[] _customers;

function createCustomer() public {
    Customer newManufacturer = new Customer();
    _customers.push(newManufacturer);
    _customer_SIZE++;
}

function allCustomers() public view returns (Customer[] memory) {
    return _customers;
}

function get_customer_SIZE() public view returns (int256) {
    return _customer_SIZE;
}


int256 _product_SIZE = 0;
Product[] _products;

function createProduct(string memory _owner) public {
    Product newProduct = new Product(_owner);
    _products.push(newProduct);
    _product_SIZE++;
}

function allProducts() public view returns (Product[] memory) {
    return _products;
}

function get_product_SIZE() public view returns (int256) {
    return _product_SIZE;
}


int256 _transport_SIZE = 0;
Transport[] _transports;

function createTransport(string memory _owner) public {
    Transport newTransport = new Transport(_owner);
    _transports.push(newTransport);
    _transport_SIZE++;
}

function allTransports() public view returns (Transport[] memory) {
    return _transports;
}

function get_transport_SIZE() public view returns (int256) {
    return _transport_SIZE;
    }
}
