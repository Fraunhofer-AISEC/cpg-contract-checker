bytes[] memory val = new bytes[](_value.length);
for (uint i = 0; i < _value.length; i++) {
    (bool success, bytes memory response) = addr.call.value(_value[i])(_data);
    require(success, "call failed");
    val[i] = new bytes(response.length);
    for (uint j = 0; j < response.length; j++) {
        val[i][j] = response[j];
    }
}
