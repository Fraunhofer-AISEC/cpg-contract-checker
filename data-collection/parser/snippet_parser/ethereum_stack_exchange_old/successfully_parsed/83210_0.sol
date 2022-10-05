pragma solidity >=0.4.22 <0.7.0;

contract Cinema {

    struct Artist {
        string name;
        uint price;
        address owner;
    }

    Artist public artist; 
    mapping (uint => Artist) public artists;
    address payable private manager;
    address payable[] public owners;
    uint numArtists;

    constructor() public {
        manager = msg.sender;
    }

    function bulkSend(uint256 amount) public payable {
        uint256 share = amount / owners.length;
        uint256 length = owners.length;
        uint256 currentSum = 0;
        for (uint256 i = 0; i < length; i++) {
            require(share > 0);
            currentSum += share;
            require(currentSum <= msg.value);
            owners[i].transfer(share);
        }
    }

    function addArtist(string memory name, uint price, address payable owner) public returns(uint artistID) {
        artistID = numArtists++; 
        artists[artistID] = Artist(name, price, owner);
        owners.push(owner);
    }

    function contribute(uint artistID) public payable {
        Artist storage c = artists[artistID];
        require(msg.value == c.price, "Wrong amount");
        manager.transfer(msg.value / 10); 
        bulkSend(msg.value * 9 / 10); 
        c.owner = msg.sender; 
        delete owners[c.index];
        owners.push(msg.sender); 
    }
}
