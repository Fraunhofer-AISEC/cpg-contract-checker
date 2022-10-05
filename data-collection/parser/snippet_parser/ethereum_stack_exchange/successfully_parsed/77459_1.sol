    function random() private view returns(uint){
        uint source = block.difficulty + now;
        bytes memory source_b = toBytes(source);
        return uint(keccak256(source_b)) % 100;
    }
