contract Case2 {

    struct AA{
        uint val;
    }

    struct BB{

        mapping (uint => AA) map_2;
    }

    mapping (uint => BB) map_1; 

    function getter(uint BBId, uint AAId) public view returns(uint val) {
        return map_1[BBId].map_2[AAId].val;
    }
}
