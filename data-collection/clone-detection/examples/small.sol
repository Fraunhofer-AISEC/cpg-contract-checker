function requireNoError(uint errCode, string memory message) internal pure {
    if (errCode == uint(Error.NO_ERROR)) {
        return;
    }

    bytes memory fullMessage = new bytes(bytes(message).length + 5);
    uint i;

    for (i = 0; i < bytes(message).length; i++) {
        fullMessage[i] = bytes(message)[i];
    }

    fullMessage[i+0] = byte(uint8(32));
    fullMessage[i+1] = byte(uint8(40));
    fullMessage[i+2] = byte(uint8(48 + ( errCode / 10 )));
    fullMessage[i+3] = byte(uint8(48 + ( errCode % 10 )));
    fullMessage[i+4] = byte(uint8(41));

    require(errCode == uint(Error.NO_ERROR), string(fullMessage));
}
