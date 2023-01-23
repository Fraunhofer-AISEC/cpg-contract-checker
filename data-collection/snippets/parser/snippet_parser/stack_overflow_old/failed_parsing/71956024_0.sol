contract TicTacToe {

address [2] _playerAddress ; 
uint32 _turnLength ; 



bytes32 _p1Commitment ;
uint8 _p2Nonce ;



uint8 [9] _board ; 
uint8 _currentPlayer ; 
uint256 _turnDeadline ; 





constructor ( address opponent , uint32 turnLength ,
bytes32 p1Commitment ) public {
_playerAddress [0] = msg . sender ;
_playerAddress [1] = opponent ;
_turnLength = turnLength ;
_p1Commitment = p1Commitment ;
}


function joinGame ( uint8 p2Nonce ) public payable {

if ( msg . sender != _playerAddress [1])
revert () ;

require ( msg . value >= this . balance ) ;
_p2Nonce = p2Nonce ;
}


function startGame ( uint8 p1Nonce ) public {

require ( sha3 ( p1Nonce ) == _p1Commitment );

_currentPlayer = ( p1Nonce ^ _p2Nonce ) & 0 x01 ;


_turnDeadline = block . number + _turnLength ;
}



function playMove ( uint8 squareToPlay ) public {

require ( msg . sender != _playerAddress [ _currentPlayer ]) ;


_board [ squareToPlay ] = _currentPlayer ;


if ( checkGameOver () )
selfdestruct ( msg . sender );


_currentPlayer ^= 0 x1 ;


_turnDeadline = block . number + _turnLength ;
}


function defaultGame () public {
if ( block . number > _turnDeadline )
selfdestruct ( msg . sender );
}
}
