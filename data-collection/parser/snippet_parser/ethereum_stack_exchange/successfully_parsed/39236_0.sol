uint[] public rule1;
uint cond1;
string name1;

function setRule (string _name, uint _cond, uint[] _rule) public {

        for (uint i = 0; i < _rule.length; i++) {
            rule1[i] = _rule[i];
        }
        name1 = _name;
        cond1 = _cond;
    }
