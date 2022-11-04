uint public id = 1; 


mapping (bytes32 => uint) lut;

function add(uint _element)
    returns (uint)
{
    lut[sha3(_element)] = id;
    lut[sha3(id)] = _element;
    id++;
}

function get(uint idOrElement)
    constant
    returns (uint)
{
    return lut[sha3(idOrElement)];
}
