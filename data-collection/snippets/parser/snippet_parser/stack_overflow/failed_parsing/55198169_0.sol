 Function getFile(uint id) external constant returns (string, string) {
      file storage F = files[id];

      return (F.description, F.hash);
    }
