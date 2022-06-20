function massImport(bytes[] _datas)  view external onlyOwner(){
        for(uint i = 0;i<_datas.length;i++){
            addYear(bytes(_datas[i]));
            for(uint j = 0; j<_datas[i].length;j++){
                addCase(bytes(_datas[i][j]));
            }
        }
    }
