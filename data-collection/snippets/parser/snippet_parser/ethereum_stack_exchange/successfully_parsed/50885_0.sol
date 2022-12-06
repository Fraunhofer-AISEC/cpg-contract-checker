mapping(address => uint) public addresskey1;

mapping(uint => mapping(address => uint)) public addresskey2;

function addAddress(address _address, uint _pin) public {

    addresskey1[_address] = ID;

    addresskey2[_pin] = addresskey1[_address];


}
