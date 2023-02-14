

pragma solidity ^0.6.6;



contract TestAnte
{
    uint private m_BUSD_ante = 10;

    function GetHctAnte()
    public view returns (uint)
    {
        

        address[] memory TOKEN_ADDRS = new address[](2);

        TOKEN_ADDRS[0] = 0x29A1e54DE0fCE58E1018535d30aF77A9d2D940c4;  
        TOKEN_ADDRS[1] = 0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56;  

        uint[] memory RateTaker = new uint[](2);

        RateTaker = PancakeRouter(
            0x10ED43C718714eb63d5aA57B78B54704E256024E).getAmountsOut(
            1000000000000000000, TOKEN_ADDRS);
            

        assert(RateTaker[1] > 0);  

         

        uint HCT_ante = (m_BUSD_ante * RateTaker[0]) / RateTaker[1];

        return HCT_ante;
    }
}



interface PancakeRouter
{
    function getAmountsOut(uint amountIn, address[] calldata path) 
    external view returns (uint[] memory amounts);
}

