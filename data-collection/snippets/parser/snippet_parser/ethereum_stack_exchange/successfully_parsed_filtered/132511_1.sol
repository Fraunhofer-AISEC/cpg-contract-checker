    function test3() public pure returns(string memory, bytes memory) {
        bytes6 _id = '123456';
        bytes memory b = 'The input _id is ______ and it was replaced using assembly';


        assembly {
            let src := add(_id, 32)
            let dest := add(b, 49)

            let mask := shl(208, 0x0000FFFF0000)

            let srcpart := and(src, mask)
            
            let destpart := and(mload(dest), not(mask))

            mstore(dest, or(destpart, srcpart))
        }

        return (string(b), b);
    }
