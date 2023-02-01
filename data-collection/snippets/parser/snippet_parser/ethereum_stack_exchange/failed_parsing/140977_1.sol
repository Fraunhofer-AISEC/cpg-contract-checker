function deposit(bytes5 _name, uint256 _amount) internal { ... }

let stringToBytes5 = function (str: string) {
    return ethers.utils.hexZeroPad(ethers.utils.toUtf8Bytes(str), 5);
}
let bytes5ToString = function (hexString: string) {
    return ethers.utils.toUtf8String(hexString);
}

await contract.deposit(stringToBytes5('John'), 10);
