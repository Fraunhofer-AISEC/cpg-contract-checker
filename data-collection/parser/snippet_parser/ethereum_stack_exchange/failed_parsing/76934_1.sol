bytes[] memory val;
for(uint i = 0; i < _value.length; i++) {
    (, bytes memory response) = addr.call.value(_value[i])(_data);
    val[i] = response;
}
