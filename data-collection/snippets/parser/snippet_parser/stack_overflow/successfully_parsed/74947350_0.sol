
struct Emp {
uint256 id;
string val;
}

Emp[][] public emprec;

function addEmpArr(Emp[][] memory arr) external {
emprec.push(arr);
}
