contract HelloWorld{
    uint8[][] public grid;

    function makegrid(uint8 row, uint8 col,uint8 value) public {
        for (uint8 i;i<row;i++){
            uint8[] memory temp = new uint8[](col);
            for (uint8 j;j<col;j++){
                temp[j] = value;
            }
            grid.push(temp);
        }
    }   
}
