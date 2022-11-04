pragma solidity >=0.5.0;
pragma experimental ABIEncoderV2;



contract Buyproduct{

    uint public orderCount = 0;
    mapping(uint => Order) public orders;

    uint public productCount = 0;
    mapping(uint => Product) public products;

    uint public userCount = 0;
    mapping(address => User) public users;

    struct Order {
        uint oid;
        address payable seller;
        address payable buyer;
      
        string status;
        uint pid;
        string location;
        uint quantitiy;
    }

    struct Product {
        uint pid;
        string name;
        uint price;
        address payable seller;

        string info;
        uint quantity;
    }

    struct User {
        uint uid;
        string name;
        uint role;
        address payable user;
        string location;
        bool created;
    }

    event ProductCreated(
        uint pid,
        string name,
        uint price,
        address payable seller,
        string info,
        uint quantity
    );

    event  UserCreated(
        uint uid,
        string name,
        uint role,
        address payable user,
        string location,
        bool created
    );

    event ProductPurchased(
        uint oid,
        address payable seller,
        address payable buyer,
        string status,
        uint pid,
        string location,
        uint quantity
    );

    event ReviewAdded(
        uint rid,
        address reviewer,
        uint pid,
        string review
    );

    function createUser(string memory _name, uint _role, string memory _location) public payable{
        
        require(users[msg.sender].created == false, 'User already created');
        
        userCount++;
        
        users[msg.sender] = User(userCount, _name, _role, msg.sender, _location, true);
        
        emit UserCreated(userCount, _name, _role, msg.sender, _location, true);
    }

    function createProduct(string memory _name, uint _price, string memory _info, uint _quantity) public payable {
        
        require(_price > 0, 'Invalid Price');
        
        productCount ++;
        
        products[productCount] = Product(productCount, _name, _price, msg.sender, _info, _quantity);
        
        emit ProductCreated(productCount, _name, _price, msg.sender, _info, _quantity);
    }

    function purchaseProduct(uint _id,  uint _quantity) public payable {
        
        Product memory _product = products[_id];
        
        address payable _seller = _product.seller;
        
        require(users[msg.sender].created == true, 'Unregistered user');
        
        require(_product.pid > 0 && _product.pid <= productCount, 'Invalid Product ID');
        
        require(msg.value >= _product.price, 'Not enough ether in Wallet');
        
        require(_seller != msg.sender,'Invalid Purchase');
        
        orderCount++;
        
        orders[orderCount] = Order(orderCount, _seller, msg.sender, 'Ordered', _product.pid, users[msg.sender].location, _quantity);
        
        _product.quantity -= _quantity;
        
        address payable wallet = address(uint160(address(this)));
        wallet.transfer(msg.value);
        
        emit ProductPurchased(orderCount, _seller, msg.sender,  'Ordered', _product.pid, users[msg.sender].location, _quantity);
    }


}'''
