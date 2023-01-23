contract Linked {

    struct Item {
        address owner;
        string qrcode;
    }
    
    mapping(address => Item[]) public userItems;

    function addItem(string memory _qrcode) public {
        Item memory item = Item(msg.sender, _qrcode);
        userItems[msg.sender].push(item);
        items.push(item);
    }

    function transfer(string memory _qrcode, address _newOwner) public returns (bool success){
       
    }
 }
