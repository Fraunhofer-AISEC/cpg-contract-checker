modifier Modifier_Name() {
        if (Some_Check == Bool) {
            Event(Event_Arg_Type);
            Function_Access_Bool = Bool;
        }
        _;
    }

function Function_Name(Function_Args) public
     Modifier_Name()
     returns bool (success) 
     {
      if (Function_Access_Bool == false) {
          return false;
      }
      else
      {
        ...Desired_Code...;
          return true;
      }
  }
