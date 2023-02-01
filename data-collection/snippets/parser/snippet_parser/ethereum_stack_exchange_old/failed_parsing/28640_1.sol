/home/codewarrior/solidity/contracts/solution.sol:18:15: TypeError: Type int256[3] memory[] memory is not implicitly convertible to expected type uint256[3] storage ref[] storage ref.
        arr = board;
              ^---^
,/home/codewarrior/solidity/contracts/solution.sol:22:26: TypeError: Invalid type for argument in function call. Invalid implicit conversion from uint256[3] storage ref to int256[] memory requested.
        int h1 =  checkH(arr[1]);
                         ^----^
,/home/codewarrior/solidity/contracts/solution.sol:25:30: TypeError: Invalid type for argument in function call. Invalid implicit conversion from uint256[3] storage ref to int256[] memory requested.
            int h2 =  checkH(arr[2]);
                             ^----^
,/home/codewarrior/solidity/contracts/solution.sol:27:34: TypeError: Invalid type for argument in function call. Invalid implicit conversion from uint256[3] storage ref to int256[] memory requested.
                int h3 =  checkH(arr[3]);
                                 ^----^
,/home/codewarrior/solidity/contracts/solution.sol:39:28: TypeError: Invalid type for argument in function call. Invalid implicit conversion from uint256[3] storage ref[] storage ref to int256[3] memory[] memory requested.
            check = checkS(arr);
                           ^-^
,/home/codewarrior/solidity/contracts/solution.sol:41:32: TypeError: Invalid type for argument in function call. Invalid implicit conversion from uint256[3] storage ref[] storage ref to int256[3] memory[] memory requested.
                check = checkX(arr);
                               ^-^
