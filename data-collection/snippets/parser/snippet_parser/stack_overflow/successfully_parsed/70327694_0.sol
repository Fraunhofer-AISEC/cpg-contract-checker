struct StructureShip {
    address owner;
    string name;
    uint256 price;
    bool sale;
}

StructureShip[] private ships;

mapping(address => uint256[]) private ships_by_user;
mapping(uint256 => uint256) private ships_by_user_index;

uint256[] private ships_sale;
mapping(uint256 => uint256) private ships_sale_index;

function createShip(string memory _ship_name) public {
    StructureShip memory _ship = StructureShip({
        name: _ship_name,
        owner: msg.sender,
        price: 0,
        sale: false
    });
    ships.push(_ship);

    ships_by_user[msg.sender].push(ships.length - 1);
    ships_by_user_index[ships.length - 1] =
        ships_by_user[msg.sender].length -
        1;
}


function getShips(uint _page)
    external
    view
    returns (StructureShip[10] memory)
{
     StructureShip[10] memory _ships;
      
     for (uint index = (_page - 1) * 10; index < _page * 10; index++ ) {
         if (ships.length == index) {
             break;
         }
        _ships[index - (_page - 1) * 10] = ships[index];
     }
    return _ships;
}


function getShipsByUser(address _user, uint256 _page)
    external
    view
    returns (StructureShip[10] memory)
{
    StructureShip[10] memory _ships;
    for (uint index = (_page - 1) * 10; index < _page * 10; index++ ) {
         if (ships_by_user[_user].length == index) {
             break;
         }
       _ships[index - (_page - 1) * 10] = ships[ships_by_user[_user][index]];
    }
    return _ships;
}

function deleteShip(uint256 _id) public onlyCaptain(_id) {
    
    ships_by_user[ships[_id].owner][
        ships_by_user_index[_id]
    ] = ships_by_user[ships[_id].owner][
        ships_by_user[ships[_id].owner].length - 1
    ];
    ships_by_user_index[_id] = ships_by_user[ships[_id].owner].length - 1;
    ships_by_user[ships[_id].owner].pop();
    
    ships_by_user[ships[ships.length - 1].owner][
        ships_by_user_index[ships.length - 1]
    ] = _id;
    ships_by_user_index[ships.length - 1] = ships_by_user_index[_id];
    
    if (ships[_id].sale) {
        ships_sale_index[ships_sale[ships_sale.length - 1]] = _id;
        ships_sale[ships_sale_index[_id]] = ships_sale[
            ships_sale.length - 1
        ];
        ships_sale.pop();
    }
    
    if (ships[ships.length - 1].sale) {
        ships_sale_index[_id] = ships_sale_index[ships.length - 1];
        ships_sale[ships_sale_index[ships.length - 1]] = _id;
    }
    
    ships[_id] = ships[ships.length - 1];
    ships.pop();
}
