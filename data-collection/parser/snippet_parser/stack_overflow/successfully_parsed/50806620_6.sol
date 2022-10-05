

contract MyExposedContract is MyContract() {


    function callStoreNum(uint256 num)  public {
        storeNum(num);
    }

}
