pragma solidity >=0.4.25 <0.7.0;

contract ItemBill{

    enum ProductState {Shipped, Store, Owned, Sale}
    address owner;
    bytes32 public name;
    uint public productCount = 0;

    struct Product 
    {
            uint id;
            bytes32 name;
            bytes32 serlialNo;
            uint price;
            address UpdatedBy;
            bytes10 pro_state; 
    }

    mapping(address => Product[]) OwnerOfProducts;

    
    

    event ProductCreated
    (
        uint id,
        bytes32 name,
        bytes32 serlialNo,
        uint price,
        address owner,
        bytes10 pro_state 
    );

    constructor() public {
            owner = msg.sender;
    }

    function createProduct(address _OwnerAddress, bytes32 _name, bytes32 _serialNo, uint _price, bytes10 _pro_state) public {
        
        require(_name.length > 0);
        
        require(_price >= 0);
        
        require(_serialNo.length > 0);
        
        Product memory p;
        
        p.id = productCount++;
        p.name = _name;
        p.serlialNo = _serialNo;
        p.price = _price;
        p.UpdatedBy = msg.sender;
        p.pro_state = _pro_state;

        OwnerOfProducts[_OwnerAddress].push(p);

        
        emit ProductCreated(productCount, _name, _serialNo, _price, msg.sender, _pro_state );
    }

    function getProduct(address _address) view public returns(uint, bytes32, bytes32, uint, address, bytes10) {

        returns(OwnerOfProducts[_address].id, OwnerOfProducts[_address].name, OwnerOfProducts[_address].serlialNo, OwnerOfProducts[_address].price, OwnerOfProducts[_address].owner, OwnerOfProducts[_address].pro_state); 

**

    }

    function getproductcount() view public returns(uint){
        returns OwnerOfProducts.length;
    }
}

