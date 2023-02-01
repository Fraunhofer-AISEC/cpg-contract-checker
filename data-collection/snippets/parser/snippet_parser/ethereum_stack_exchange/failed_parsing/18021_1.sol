function f() public pure returns (uint, bool, uint) {
        return (7, true, 2);
}
var (x,y,z) = f(); 

(x,y) = (y,x) 
