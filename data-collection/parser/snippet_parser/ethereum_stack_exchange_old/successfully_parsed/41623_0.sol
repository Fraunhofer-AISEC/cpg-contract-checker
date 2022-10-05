contract omega {
mapping (uint => uint[3]) public GPS;

function omega(uint[] coords) public{
    uint x = uint(coords.length)/uint(3);
    uint cont = 0;
    for(uint r = 0; r<x;r++){
        setXYZ(r,coords[cont],coords[cont+1],coords[cont+2]);
        cont+=2;
    }
}

function setXYZ(uint index, uint _x,uint _y,uint _z) public{
    setX(index,_x);
    setY(index,_y);
    setZ(index,_z);
}

function setX(uint index,uint _value){
    GPS[index][0] = _value;
}
function setY(uint index,uint _value){
    GPS[index][1] = _value;
}
function setZ(uint index,uint _value){
    GPS[index][2] = _value;
}
}
