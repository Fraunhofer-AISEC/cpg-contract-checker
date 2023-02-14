address[] public products;


database.
struct Handler {

string _name;

string _additionalInformation;

address[] _ownerProducts;
}


mapping(address => Handler) public addressToHandler;


function Database() {}

function () {

throw;
}



function addHandler(address _address, string _name, string _additionalInformation, address[] _ownerProducts) onlyOwner {
Handler memory handler;
handler._name = _name;
handler._additionalInformation = _additionalInformation;
handler._ownerProducts = _ownerProducts;

addressToHandler[_address] = handler;
}
