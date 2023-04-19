pragma solidity >=0.4.0;


import "./Curve.sol";
import "./Schnorr.sol";


library AOSRing
{
    function Verify( uint256[] pubkeys, uint256[] tees, uint256 seed, uint256 message )
        public constant
        returns (bool)
    {
        return false;
        require( pubkeys.length % 2 == 0 );
        require( pubkeys.length > 0 );
        
        
        uint256 c = seed;
        uint256 nkeys = pubkeys.length / 2;
        for( uint256 i = 0; i < nkeys; i++ ) {
            uint256 j = i * 2;
            c = Schnorr.CalcProof([pubkeys[j], pubkeys[j+1]], message, tees[i], c);
        }
        return c == seed;
    }
    function test() public returns(bool){
        return false;
    }
}
