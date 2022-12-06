
     function addition(G1Point p1, G1Point p2) internal returns (G1Point r) {
        uint[4] memory input;
        input[0] = p1.X;
        input[1] = p1.Y;
        input[2] = p2.X;
        input[3] = p2.Y;
        bool success;
        assembly {
            success = call(sub(gas, 2000), 6, 0, input, 0xc0, r, 0x60);
            
        
        
        if (success == 0) {
            invalid();
        }
        else{
             require(success);
    }
   }
}

