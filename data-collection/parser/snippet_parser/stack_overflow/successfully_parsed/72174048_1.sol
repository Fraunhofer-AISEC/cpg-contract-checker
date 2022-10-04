struct datosTarea {
    uint256 id;
    string titulo;
    string descripcion;
    uint256 fecha;
}

uint256 public contador;
mapping( uint256 => datosTarea ) public ListaTareas;

function crearTarea( string memory _titulo, string memory _descripcion ) public returns(bool){
    ListaTareas[contador] = datosTarea(contador,_titulo,_descripcion,block.timestamp);
    contador++;
    return true;
}
