struct Lottos {
    uint maxPlayers;
    string winObject;
    address depositAddress;
    string name;
    uint id;
    bool ended;
}

mapping(uint => Lottos) lottos;
address payable[] public players;
mapping(address => uint balance);
uint public price;

function createLotto(uint _id, string _name, address _depositAddress, string _winObject, uint _maxPlayers, bool _ended) public onlyOwner {
    Lottos memory newLotto = Lottos(_maxPlayers, _winObject, _depositAddress, _name, _id, _ended);
    lottos.push(newLotto);
}


function totalLottos() public view returns (uint) {
    return lottos.length;
}

function checkLotto(uint i) public view returns (uint, string, address, string, uint, bool {
    return (lottos[i].maxPlayers, lottos[i].winObject, lottos[i].depositAddress, lottos[i].name, lottos[i].id, lottos[i].ended);
}
