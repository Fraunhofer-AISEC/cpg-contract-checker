      const data = await window.contract.methods.getName().call();
      document.getElementById("dataArea").innerHTML = `Message is here: ${data}`;
