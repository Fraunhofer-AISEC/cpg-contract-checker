contract TestOneReturn
{
    mapping(uint => uint) m_Data;

    constructor()
        public
    {
        m_Data[0] = 111;
        m_Data[1] = 112;
    }

    function getAddress(uint pA)
        external view
        returns(uint)
    {
        return m_Data[pA];
    }
}

contract TestTwoReturns
{
    mapping(uint => mapping(uint => uint)) m_Data;

    constructor()
        public
    {
        m_Data[0][0] = 211;
         m_Data[0][1] = 212;
    }

    function getAddress(
        uint pA,
        uint pB
    )
        external view
        returns(uint)
    {
        return m_Data[pA][pB];
    }
}
