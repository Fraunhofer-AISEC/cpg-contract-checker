
pragma solidity 0.8.18;

contract EjercicioSemana4 {
    
    address public admin = 0x08Fb288FcC281969A0BBE6773857F99360f2Ca06;
    
    bool public pausado;

    error SaldoInsuficiente();
...
    function transferir(address _destinatario, uint256 _cantidad) public {
        if (_cantidad >= balances[msg.sender]) {
            revert SaldoInsuficiente();
        } else {
            balances[msg.sender] -= _cantidad;
            balances[_destinatario] += _cantidad;
            emit Transfer(msg.sender, _destinatario, _cantidad);
        }
    }

