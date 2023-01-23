contract Marketplace {   
    uint256 transferBudget = 1 ether;
    bytes32[] ids;
    enum Position{
        Goalkeeper, Defender, Midfielder, Attacker, Coach
    }

    struct Footballer{
        bytes32 id;
        string name;
        address owner;
        Position position;
        uint price;
    }
    Footballer[] footballers;

    

    function deposit() public payable {
        if(msg.value>0){
            transferBudget = transferBudget+msg.value;
        }
    }

    function getTransferBudget() public view returns(uint256){
        return transferBudget;
    }

    function update(bytes32 ID, uint newPrice) public {
        for(uint i=0; i<footballers.length; i++){
            if(footballers[i].id==ID && msg.sender==footballers[i].owner){
                footballers[i].price = newPrice;
                break;
            }
        }
    }

     function newProduct2() public pure returns(uint) {
        return 12;
    }

    
    function newProduct(string name, uint price, Position position) public returns(bytes32 id) {
        bytes32 hashId = keccak256(name,price,position);
        Footballer memory footballer = Footballer(hashId, name, msg.sender,position,price);
        footballers.push(footballer);
        ids.push(hashId);
        return hashId;
    }

    function getProducts() public view returns(bytes32[]) {
       return ids;
    }

    function getPrice(bytes32 ID) public view returns (uint) {
        for(uint i=0; i<footballers.length; i++){
            if(footballers[i].id==ID){
                return footballers[i].price;
            }
        }
    }
}
