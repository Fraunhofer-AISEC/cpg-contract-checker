bytes[] memory val;
for(uint i = 0; i < item.length; i++) {
    (, bytes memory response) = addr.call.value(_value[i])(_data);
    if (response.length != 0) {
        val[i] = response;
    }
}
