function setvalue(string memory _name,string memory _description,string memory _uses,string memory _ingredients,string memory _sideeffects,string memory _warnings)public{
      Tablet storage data = tablets[_name];

      
      
      

      data.name = _name;
      data.description = _description;
      data.uses = _uses;
      data.ingredients = _ingredients;
      data.sideeffects = _sideeffects;
      data.warnings = _warnings;

      require(!alreadyexist[_name]);
      nextdrug.push(_name);
      alreadyexist[_name] = true;
    }
