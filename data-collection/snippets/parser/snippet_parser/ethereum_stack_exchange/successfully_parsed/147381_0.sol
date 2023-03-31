function update(uint _x, uint8 _y, bytes5 _z) public returns (bool){
    data[_x].a[_y]++;
    data[_x].z= _z;

    return (data[_x].a[_y] < data[_x].b[_y]);
}
