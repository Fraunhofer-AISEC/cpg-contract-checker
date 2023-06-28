contract Test{
    function test() public view returns(bytes12){
        bytes32 num = 0xdeb02111e4e5fa8c7c05e983a3446893a36d12ad6d79206163636f756e740000;
        bytes12 res1 = bytes12(uint96(uint256(num)));
        bytes12 res2 = bytes12(num<<160);
        
        bytes12 res3;
        assembly {
            res3 := shl(160,num)
        }
        require(res1 == res2);
        require(res2 == res3);
        return res3;
    }
}
