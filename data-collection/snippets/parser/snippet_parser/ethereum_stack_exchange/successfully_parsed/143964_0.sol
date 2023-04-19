contract HelloWorld{
    uint8[][] grid;

    function makegrid(uint8 row, uint8 col,uint8 value) public returns(uint[][] memory){
        for (uint8 i;i<=row;i++){
            for (uint8 j;j<=col;j++){
                grid[i][j].push(value);
            }
        }
        return grid;

    }   

}
