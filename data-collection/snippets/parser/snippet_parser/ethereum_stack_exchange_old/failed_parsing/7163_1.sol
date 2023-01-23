contract Equipment {
    uint atk;
    uint duration;
    
    
    uint unique;

    function Equipment(uint atk_param, uint duration_param) {
       atk = atk_param;
       duration = duration_param;
    }

    
    function getWeaponOrArmor() constant public (uint) {
       return unique;
    }
}

contract Weapon is Equipment {

    
    function Weapon(uint atk, uint duration) public {
        unique = 0;
    }

}
