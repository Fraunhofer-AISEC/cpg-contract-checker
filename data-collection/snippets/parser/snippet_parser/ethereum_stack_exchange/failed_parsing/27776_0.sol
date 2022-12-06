contract AContract {

    struct AStruct { 
      uint a_field;
    }

    AStruct variable_a;
    AStruct variable_b;

    AStruct storage pointer_to_either_a_or_b;

    modifier AModifier()
    {
      if (condition_a)
      {
        pointer_to_either_a_or_b = variable_a;
      }
      else
      {
        pointer_to_either_a_or_b = variable_b;
      }
    }

    function AFunctionUsingPointerToAorB100() internal AModifier()
    {
      pointer_to_either_a_or_b.a_field = 100;          
    }

    function AFunctionUsingPointerToAorB200() internal AModifier()
    {
      pointer_to_either_a_or_b.a_field = 200;          
    }

}
