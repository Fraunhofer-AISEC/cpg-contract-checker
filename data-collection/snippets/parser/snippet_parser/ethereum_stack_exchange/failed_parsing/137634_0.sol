struct StructB {
     uint256 a;
     uint256 b;
}
struct StructC {
     uint256 a;
     uint256 b;
}
struct StructA {
    uint256 a;
    uint256 b;
    StructB structB;
    StructC structC;

}

contract MyContract {
     function myFunction() external returns (StructA memory result) {
           result.a = 0;
           result.b = 1;
           result.structA.a = 0;
           result.structA.b = 1;
           result.structB.a = 0;
           result.structB.b = 1;

     }
     return result;
}


