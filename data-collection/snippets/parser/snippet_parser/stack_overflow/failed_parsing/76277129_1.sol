var numberToHex = function (value) {
    if ((value === null || value === undefined)) {
        return value;
    }
    if (!isFinite(value) && !isHexStrict(value)) {
        throw new Error('Given input "' + value + '" is not a number.');
    }
    var number = toBN(value);
    var result = number.toString(16);
    return number.lt(new BN(0)) ? '-0x' + result.substr(1) : '0x' + result;
};
