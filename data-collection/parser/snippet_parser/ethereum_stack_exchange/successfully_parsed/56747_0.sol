mapping(address => bool) values;
address[] valuesTrue;

function getValue(address a) public view returns (bool) {
    return values[a];
} 

function getAllValues() public view returns(address[]) { 
    return valuesTrue;
}

function addValue(address a, bool b) public {
    values[a] = b;
    if (b)
        valuesTrue.push(a);
    else {
        for (uint i = 0; i < valuesTrue.length; i++) {
            if (valuesTrue[i] == a) {
                valuesTrue[i] = valuesTrue[valuesTrue.length - 1];
                delete valuesTrue[valuesTrue.length - 1];
                valuesTrue.length--;
                break;
            }
        }
    }
}
