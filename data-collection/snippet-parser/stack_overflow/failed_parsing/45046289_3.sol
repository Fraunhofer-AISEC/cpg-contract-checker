handleChange: function(e) {
        this.setState({[e.target.name]: e.target.value});
    }


  render() {
    peopleContract.addPerson(this.state.firstName, this.state.lastName, this.state.email, {from: accounts[1], gas: 3000000})
    return(
      <form onSubmit={this.handleSubmit}>
      <h4>Name</h4>
        <input
          type="text"
          placeholder="e.g. Bob"
          value={this.state.firstName}
          name = "firstName"
          onChange= {this.handleChange}  />
        <div>
        <h4>Last Name</h4>
          <input
            type="text"
            placeholder="e.g. Stark"
            value={this.state.lastName}
            name = "lastName"
            onChange= {this.handleChange}  />
        </div>
        <div>
        <h4>Email</h4>
          <input
            type="text"
            placeholder="e.g. bobstark@gmail.com"
            value={this.state.email}
            name = "email"
            onChange= {this.handleChange}  />
        </div>
        <input
          type = "submit"
          name = "Submit"
          />
      </form>
    );
  }
}
