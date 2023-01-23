import "strings.sol";

contract MyContract {
    using strings for *;

    function bytes32ToString (bytes32 data) constant returns (string) {
        bytes memory bytesString = new bytes(32);
        for (uint j=0; j<32; j++) {
            byte char = byte(bytes32(uint(data) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[j] = char;
            }
        }
        return string(bytesString);
    }

    function uintToBytes(uint v) constant private returns (bytes32 ret) {
        if (v == 0) {
            ret = '0';
        }
        else {
            while (v > 0) {
                ret = bytes32(uint(ret) / (2 ** 8));
                ret |= bytes32(((v % 10) + 48) * 2 ** (8 * 31));
                v /= 10;
            }
        }
        return ret;
    }

    function uintToString(uint v) constant private returns (string ret) {
        return bytes32ToString(uintToBytes(v));
    }

    function formatUrl(uint param1, uint param2) constant returns(string) {
        var parts = new strings.slice[](4);
        parts[0] = "http://someurl.com/?param1=".toSlice();
        parts[1] = uintToString(param1).toSlice();
        parts[2] = "&?param2=".toSlice();
        parts[3] = uintToString(param2).toSlice();

        return "".toSlice().join(parts);
    }
}
