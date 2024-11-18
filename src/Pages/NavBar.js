import React from 'react';
import './NavBar.css'
import { Link } from 'react-router-dom';


function NavbarComponent() {


  return (
    <div className="navbar">
      <div className="container">
        <nav className="nav">

          <Link to="/courses" className="nav-link">Courses</Link>
          <Link to="/about_us" className="nav-link">About Us</Link>

        </nav>
      </div>
    </div>
  );
}

export default NavbarComponent;
