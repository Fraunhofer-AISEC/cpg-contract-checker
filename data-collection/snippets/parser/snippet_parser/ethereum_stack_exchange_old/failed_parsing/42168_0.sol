pragma solidity ^0.4.11;<br/>

    contract ERC165 {

         function interfaceID() constant returns (uint)
         {
            bytes4[] sigs = type(this).signatures;
            uint mask = 0;
            for (var i = 0; i < sigs.length; i++)
            mask ^= uint(sigs[i]);
        return mask;
    }
}
