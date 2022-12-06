contract TestAll
{
    mapping(uint => uint) m_DataA;
    mapping(uint => mapping(uint => uint)) m_DataB;

    constructor()
        public
    {
        m_DataA[0] = 111;
        m_DataA[1] = 112;

        m_DataB[0][0] = 211;
        m_DataB[0][1] = 212;
    }

    function getAddress(uint pA)
        external view
        returns(uint)
    {
        return m_DataA[pA];
    }

    function getAddress(
        uint pA,
        uint pB
    )
        external view
        returns(uint)
    {
        return m_DataB[pA][pB];
    }
}
