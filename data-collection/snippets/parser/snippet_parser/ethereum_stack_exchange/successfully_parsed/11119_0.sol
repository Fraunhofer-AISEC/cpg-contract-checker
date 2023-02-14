bytes32 x;

event LogChangedX(bytes32 X);

function doSomething(bytes32 newX) {
  x = newX;
  LogChangedX(x); 
}