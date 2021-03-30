import React from 'react';
import { Link } from 'react-router-dom';

export default ({ currentUser, logout }) => {
  debugger
  const display = currentUser ? (
    <div>
      <p>Hello {currentUser.username}</p>
      <button onClick={logout}>Log Out</button>
    </div>
  ) : (
    <div>
      <Link className="btn" to="/signup">Sign Up</Link>
      <Link className="btn" to="/login">Log In</Link>
    </div>
  );

  return (
    <header className="nav-bar">
      <h1 className="logo">BLUEBIRD</h1>
      <div>
        {display}
      </div>
    </header>
  );
}; 


// class Navbar extends React.Component{
//   constructor(props){
//     super(props)
//   }

//   render(){

//     const display = this.props.currentUser ? (
//       <div>
//         <p>Hello {this.props.currentUser.username}</p>
//         <button onClick={this.props.logout}>Log Out</button>
//       </div>
//     ) : (
//       <div>
//         <Link className="btn" to="/signup">Sign Up</Link>
//         <Link className="btn" to="/login">Log In</Link>
//       </div>
//     );

//     return (
//       <header className="nav-bar">
//         <h1 className="logo">BLUEBIRD</h1>
//         <div>
//           {display}
//         </div>
//       </header>
//     )
//   }

// }

// export default Navbar
