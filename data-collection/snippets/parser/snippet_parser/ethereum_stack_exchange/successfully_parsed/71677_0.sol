function mat3Mult(uint[3][3] mat1, uint[3][3] mat2) private returns (uint[3][3]) { 
        uint r1 = mat1.length; 
        uint c1 = mat1[0].length; 
        uint c2 = mat2[0].length; 

        uint[3][3] memory result; 

        for(uint i = 0; i < r1; ++i) {
            for(uint j = 0; j < c2; ++j) {
                for(uint k = 0; k < c1; ++k) {
                    result[i][j] += mat1[i][k] * mat2[k][j];
                }
            }
        }

        return(result);
    }
