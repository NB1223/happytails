import React, { useState, useEffect } from 'react';
import axios from 'axios';

function Health() {
  const [petId, setPetId] = useState('');  // Pet ID entered by the user
  const [healthStatus, setHealthStatus] = useState('');  // Health status of the pet

  // Fetch the current health status from the backend when the component mounts
  useEffect(() => {
    const fetchHealthStatus = async () => {
      if (petId) {
        try {
          const response = await axios.get(`http://localhost:5000/pet-health/${petId}`);
          setHealthStatus(response.data.healthStatus);  // Set the health status from the API response
        } catch (error) {
          console.error('Error fetching health status:', error);
          alert('Error fetching health status');
        }
      }
    };

    fetchHealthStatus();  // Call the function to fetch the health status
  }, [petId]);  // The effect runs when the petId changes

  // Function to handle health status change
  const handleHealthChange = (event) => {
    setHealthStatus(event.target.value);
  };

  // Function to update the pet's health by calling the backend API
  const updateHealth = async () => {
    if (!petId || !healthStatus) {
      alert('Please enter a valid Pet ID and select a health status.');
      return;
    }
    try {
      // Make PUT request to the backend API to update the health status
      const response = await axios.put(`http://localhost:5000/update-health/${petId}`, {
        healthStatus: healthStatus
      });

      alert(response.data);  // Show success message
    } catch (error) {
      console.error('There was an error updating the health status:', error);
      alert('Error updating health status');
    }
  };

  return (
    <div>
      <h1>Update Pet Health Status</h1>
      
      {/* Input for Pet ID */}
      <div>
        <label htmlFor="petId">Enter Pet ID:</label>
        <input
          type="number"
          id="petId"
          value={petId}
          onChange={(e) => setPetId(e.target.value)}
        />
      </div>

      {/* Show current health status */}
      <p>Current Health Status: {healthStatus || 'Not updated yet'}</p>

      {/* Dropdown for selecting health status */}
      <select value={healthStatus} onChange={handleHealthChange}>
        <option value="">Select Health Status</option>
        <option value="Good">Good</option>
        <option value="Fair">Fair</option>
        <option value="Poor">Poor</option>
        <option value="Needs Vaccination">Needs Vaccination</option>
        <option value="Underweight">Underweight</option>
      </select>

      {/* Button to trigger health status update */}
      <button onClick={updateHealth}>Update Health Status</button>
    </div>
  );
}

export default Health;
