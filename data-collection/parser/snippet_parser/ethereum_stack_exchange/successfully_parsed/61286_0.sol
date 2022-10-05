pragma solidity ^0.4.23;

contract s {
    uint private _min = 0;
    uint private _max = 2;

    function go() public view returns(string) {
        return string(abi.encodePacked("\"min\":", uint2str(_min), ",\"max\":", uint2str(_max), ","));
    }

    function uint2str(uint i) internal pure returns (string){
        if (i == 0) return "0";
        uint j = i;
        uint length;
        while (j != 0){
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint k = length - 1;
        while (i != 0){
            bstr[k--] = byte(48 + i % 10);
            i /= 10;
        }
        return string(bstr);
    }
}
