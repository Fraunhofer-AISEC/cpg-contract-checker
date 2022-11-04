contract Determinant {
  uint [5][5] public matA = [[1,1,2,1,2],[3,0,0,5,4],[2,1,4,3,1],[1,0,5,0,7],[4,2,5,4,3]];
  uint public matrix_order;
  int256 public output = 0;
  uint [5] public temp_output;

function compute () public {
    matrix_order = matA.length;
    output = determinantOfMatrix(matA, matrix_order);
}

function determinantOfMatrix (uint[5][5] memory mat1, uint _order) private returns (int256) {
    uint [5][5] memory submatrix;
    int256 det = 0;
    uint256 sign = 1;
    int256 result;

    if (_order == 2)
        return int256((mat1[0][0] * mat1[1][1]) - (mat1[1][0] * mat1[0][1]));
    else {
        for (uint x = 0; x < _order; x++){
            uint subi = 0;
            for (uint i = 1; i< _order; i++){
                uint subj = 0;
                for(uint j = 0; j<_order; j++){
                    if (j != x){
                        submatrix[subi][subj] = mat1[i][j];
                        subj++;
                    }
                }
                subi++;
            }
            result = int256((-sign) ** x);
            temp_output[x] = mat1[0][x] * uint(determinantOfMatrix (submatrix, _order - 1 ));
            det = det + result * int256(temp_output[x]);
        }
        return det;
    }
}    
}