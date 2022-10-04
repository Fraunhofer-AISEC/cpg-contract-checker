
pragma solidity ^0.8.2;

contract RegisteredQueue {

    struct Registered {
        address addr;
        uint value;
    }
    struct Battle {
        Registered reg1;
        Registered reg2;
    }

    event NewRegistered (Registered indexed registered);
    event NewBattle (Battle indexed battle);
    
    Registered[] public registeredValues;
    Battle[] public battlesDone;

    function register(uint _value) public {
        for (uint i=0; i<registeredValues.length; i++) {
            require(registeredValues[i].addr != msg.sender, "You're already registred");
        }

        registeredValues.push(Registered(msg.sender, _value));
        uint l = registeredValues.length;

        emit NewRegistered(registeredValues[l-1]);

        if (l >= 2) {
            
            
            battlesDone.push(Battle(registeredValues[0], registeredValues[1]));
            emit NewBattle(battlesDone[battlesDone.length - 1]);

            
            for (uint idx=2; idx<l; idx++) {
                registeredValues[idx-2] = registeredValues[idx];
            }
            
            registeredValues.pop();
            registeredValues.pop();
        }
    }

    function countRegistered() public view returns(uint) {
        return registeredValues.length;
    }
    function countBattle() public view returns(uint) {
        return battlesDone.length;
    }
}
