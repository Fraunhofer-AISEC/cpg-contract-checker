contract Item is ERC721{

struct Item{
    string name; 
    uint level; 
    uint rarityLevel;  
    uint id;
}

mapping(uint => Item) items; 
uint count;
address public owner;

function Item() public {
    owner = msg.sender; 
}

function createItem(string memory _name, address _to, uint level, uint rarityLevel
                    uint id) public{
    require(owner == msg.sender); 
        uint num = count++;
        items[num].name = _name;
        items[num].level = level;
        items[num].rarityLevel = rarityLevel;
        items[num].id = num;
        count++;
}

function getItem(uint item) public view returns(string memory _name, uint level, 
                 uint rarityLevel, uint id){
        uint level = items[item].level;
        uint rarityLevel = items[item].rarityLevel;
        uint id = items[item].id;
        string memory _name = items[item].name
        return(level, rarityLevel, id, _name)
}
