function fight(Unit storage _attacker, Unit storage _defender) private returns (bool) 
    {   
        _defender.hp -= _attacker.dmg;
        _attacker.hp -= _defender.dmg;

        if (isUnitAlive(_defender)) 
        {
            return false;
        }
        
        else
        {
            liquidateUnit(_defender);
            unmapUnit(_defender);
            return true;
        } 
    }
