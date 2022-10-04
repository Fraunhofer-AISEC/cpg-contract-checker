pragma solidity >=0.6.0 <0.8.0;

contract ContractFactory {
    address[] contractsAddress;
    mapping(address => Contract) private contracts;
    
    function createContract(uint price) public {
        Contract newContract = new Contract(msg.sender, price);
        contractsAddress.push(address(newContract));
        contracts[address(newContract)] = newContract;
    }
    
    receive() external payable{
    }
    
    function pay(address payable contractAddress) public payable{
        contractAddress.transfer(address(this).balance);
    }
    
    function getAllContractsAddress() view public returns(address[] memory) {
        return contractsAddress;
    }
}

contract Contract {
    enum Status {Unavailable, Available}
    Status public contractStatus;
    
    address payable public contractOwner;
    address payable public buyer;
    
    uint public price;
    
    event Occupy(address _occupant);
    
    constructor(address payable _contractOwner, uint _price) {
        contractOwner = _contractOwner;
        price = _price;
        contractStatus = Status.Available;
    }
    
    modifier onlyWhenAvailable {
        require(contractStatus == Status.Available);
        _;
    }
    
    modifier notOwner {
        require(msg.sender != contractOwner);
        _;
    }
    
    modifier payEnoughAmount {
        uint priceInEther = price * 1 ether;
        require(msg.value >= priceInEther);
        _;
    }
    
    receive() external payable onlyWhenAvailable notOwner payEnoughAmount {
        contractStatus = Status.Unavailable;
        buyer = msg.sender;
    }
}
