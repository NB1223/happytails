import React from 'react';
import BG_image from '../images/bg.jpg';  // Your background image
import './Home.css';

function Home() {
  // Inline style for background image
  const backgroundImageStyle = {
    backgroundImage: `url(${BG_image})`,
    backgroundSize: 'cover',
    backgroundPosition: 'center',
    height: '91vh',
    width: '100%',  // Adjusted width to fit the viewport better
    display: 'flex',
    justifyContent: 'center',
    alignItems: 'center',
    color: 'white',
    textAlign: 'center',
    position: 'relative'
  };

  return (
    <div style={backgroundImageStyle} className="bg">
      <div className="overlay">
        <h1 className="heading">WELCOME TO HAPPYTAILS</h1>
        {/* Remove authentication logic, just show a link to other parts of the site */}
      </div>
    </div>
  );
}

export default Home;
