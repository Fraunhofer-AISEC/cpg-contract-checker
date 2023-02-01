interface ICat{
    struct Cat {
        string name;
        uint age;
        uint babys;
    }
    function getCatById(uint _id) external view retruns(Cat memory cat)
}

contract NextGenCat {
    address catContract = 
    
    
    ICat(catContract).Cat() cat = ICat(catContract).getCatById(0);
}
