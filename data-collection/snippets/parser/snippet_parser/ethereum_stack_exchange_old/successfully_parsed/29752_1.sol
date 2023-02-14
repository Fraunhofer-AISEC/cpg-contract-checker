import './StringUtils.sol';


contract PastryChef {
    using StringUtils for StringUtils;

    string name;

    function PastryChef(string _name) public {
        require(!StringUtils.isEmptyString(_name)); 
        name = _name;
    }

}
