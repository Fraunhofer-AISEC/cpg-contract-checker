function contractmanager(uint i) public view returns(uint , address , address , uint , uint , uint){
            return (contrs[list_contr[i]].idc , contrs[list_contr[i]].seller , contrs[list_contr[i]].buyer, contrs[list_contr[i]].price ,contrs[list_contr[i]].date , contrs[list_contr[i]].pos );
    }
