
    
    function compare() public view returns(string[] memory) {
        
        string[5] memory list1 = listOne; 
        string[5] memory list2 = listTwo;

        string[] memory l2Inl1;
        uint nonce;
        for(uint i; i < 5; i++){
            for(uint j; j < 5; j++){
                if(keccak256(abi.encodePacked(list2[i])) == keccak256(abi.encodePacked(list1[j]))){
                    l2Inl1[nonce] = list2[i];
                    nonce++;
                    break
                }
            } 
        }
        return l2Inl1;
    }
