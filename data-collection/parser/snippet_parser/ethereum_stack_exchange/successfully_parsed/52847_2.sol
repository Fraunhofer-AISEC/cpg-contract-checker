  pragma solidity ^0.4.21;




contract HexUtils {

    
    byte constant a = byte('a');
    byte constant f = byte('f');
    byte constant A = byte('A');
    byte constant F = byte('F');
    byte constant zero = byte('0');
    byte constant nine = byte('9');

    
    function hexCharToByte(uint c) pure internal returns(uint) {
        byte b = byte(c);

        
        if(b >= zero && b <= nine) {
            return c - uint(zero);
        } else if(b >= a && b <= f) {
            return 10 + (c - uint(a));
        } else if(b >= A && b <= F) {
            return 10 + (c - uint(A));
        }
    }

    
    function hasZeroXPrefix(string s) pure internal returns(bool) {
        bytes memory b = bytes(s);
        if(b.length < 2) {
            return false;
        }
        return b[1] == 'x';
    }

    
    function hexToUint(string s) pure public returns(uint) {
        
        bytes memory b = bytes(s);

        
        require(b.length % 2 == 0, "String must have an even number of characters");

        
        uint i = 0;
        
        if(hasZeroXPrefix(s)) {
            i = 2;
        }
        uint r = 0;
        for(;i<b.length;i++) {
            
            uint b1 = hexCharToByte(uint(b[i]));

            
            
            r = (r << 4) | b1;
        }
        
        return r;
    }

    
    function substr(string s, uint start, uint end) pure public returns(string) {
        require(end > start, "End must be more than start");
        bytes memory res = new bytes(end-start);
        bytes memory bts = bytes(s);
        require(end <= bts.length, "End must be less than or equal to the length of string");
        require(start >= 0 && start < bts.length, "Start must be between 0 and length of string");

        uint idx = 0;
        for(uint i=start;i<end;++i) {
          
            res[idx] = bts[i];
            ++idx;
        }
        return string(res);
    }

    
    function parseAddr(string _a) internal pure returns (address){
        
        uint iaddr = hexToUint(_a);
        return address(iaddr);
    }

    
    function parseResults(string _hexData) pure public returns(uint, address, uint) {
        
        uint startIdx = 0;
        if(hasZeroXPrefix(_hexData)) {
            startIdx = 2;
        }
        bytes memory bts = bytes(_hexData);
        
        uint ethVal = hexToUint(substr(_hexData, startIdx,64+startIdx));

        
        uint idStart = bts.length - 64;

        
        uint addrEnd = idStart-1;

        
        address addr = parseAddr(substr(_hexData, addrEnd-40, addrEnd));

        
        uint id = hexToUint(substr(_hexData, idStart, bts.length));

        
        return (ethVal, addr, id);
    }
}
