    const readData = async () => {
      const data = window.contract.methods.getName().call();
      document.getElementById("dataArea").innerHTML = `Message is here: ${data}`;
