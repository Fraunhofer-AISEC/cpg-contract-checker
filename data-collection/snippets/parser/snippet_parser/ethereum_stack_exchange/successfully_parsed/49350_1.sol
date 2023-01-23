function error(uint16 errorCode, string message) constant returns (bool result) {
    result = (errorCode != 0);
    if (result)
        _report(result, message);
    else
        _report(result, _appendTagged(_tag(uint(errorCode), "Tested"), message));
}
