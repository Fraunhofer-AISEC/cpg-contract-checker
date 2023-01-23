  function setvalue(string memory _name,string memory _description,string memory _uses,string memory _ingredients,string memory _sideeffects,string memory _warnings)public{
      Tablet storage data =tablets[_name];
      
      data.name.push(_name);
      data.description.push(_description);
      data.uses.push(_uses);
      data.ingredients.push(_ingredients);
      data.sideeffects.push(_sideeffects);
      data.warnings.push(_warnings);

      require(!alreadyexist[_name]);
      nextdrug.push(_name)-1;
      alreadyexist[_name] = true;
}