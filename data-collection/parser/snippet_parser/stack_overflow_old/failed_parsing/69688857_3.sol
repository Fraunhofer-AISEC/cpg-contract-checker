class App extends React.Component {

  static async getInitialProps() {
   const migrations = await factory.methods.getMigrations().call();

    return { migrations };
  }
 
   const renderMigrations = () => {
     return this.props.migrations.map((migration) => {
        return(
           <div>
             <li>{migration.name}</li>)
             <p>{migration.detail}</li>)
           </div>
        )
      })
   } 

  render() {
    const items = this.props.migration;
   
    return (
      
      <div>
      <center>
        <h2>MigrationHelper by DRIVENecosystem</h2>
        <p>
         <p><AccordionExampleStyled /></p>
          <p>List of all migrations </p>
          <p>
             {
               items?.length > 0 && renderMigrations
             }
          </p>
        </p>
       </center>
      </div>
    );
  }
};
 
export default App;
