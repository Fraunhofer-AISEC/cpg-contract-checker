  function exist (uint age_, uint size_) view returns (bool){
      for (uint i; i< persons.length;i++){
          if (persons[i].age==age_ && persons[i].size==size_)
          return true;
      }
  }
