import React from 'react';
import { BrowserRouter, Routes, Route} from 'react-router-dom';

import NavbarComponent from './Pages/NavBar.js'; 
import Home from './Pages/Home.js'; 
import Health from './Pages/Health.js';

function App() {
  return (
    <div className="app-div">
      <BrowserRouter>
        <NavbarComponent /> 
        <Routes>

          <Route path="/" element={<Home />} />
          <Route path="/health" element={<Health />} />
          
          {/* Add other routes as necessary */}
        </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
