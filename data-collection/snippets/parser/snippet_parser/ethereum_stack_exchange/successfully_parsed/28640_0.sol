pragma solidity ^0.4.13;

contract TicTacToe {


    uint[3][]   arr ;

    function isSolved(int[3][] board) returns (int) {
        arr = board;
        

        int check  = 0;
        int h1 =  checkH(arr[1]);

        if(h1 == -1){
            int h2 =  checkH(arr[2]);
            if(h2 == -1){
                int h3 =  checkH(arr[3]);
                 check = h3;

            }else{
                check = h2;
            }
        }else{
          check = h1;
        }


        if(check == -1){
            check = checkS(arr);
            if(check == -1){
                check = checkX(arr);
            }

        }

        if(check == -1){
            check = 0;

        }

        if(check == 0){
            check = -1;

        }


        return check;

    }



    
    function checkH(int[] h) private   returns (int)  {
        if(h[0] == h[1] && h[1] == h[2]){
            return h[0];
        }
        return -1;
    }

    
    function checkS(int[3][] board) private   returns (int)  {
        if(board[0][0] == board[1][0] && board[1][0] == board[2][0]){
            return board[1][0];
        }
        if(board[0][1] == board[1][1] && board[1][1] == board[2][1]){
            return board[1][0];
        }
        if(board[0][2] == board[1][2] && board[1][2] == board[2][2]){
            return board[1][0];
        }
        return -1;
    }

    
    function checkX(int[3][] board) private   returns (int)  {
        if(board[0][0] == board[1][1] && board[1][1] == board[2][2]){
            return board[0][0];
        }
        if(board[0][2] == board[1][1] && board[1][1] == board[2][0]){
            return board[0][2];
        }
        return -1;
    }

}
