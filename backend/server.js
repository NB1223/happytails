const express = require('express');
const mysql = require('mysql2');  // Use mysql2 instead of mysql
const app = express();
const cors = require('cors');
const bodyParser = require('body-parser');

// Setup for CORS and parsing JSON requests
app.use(cors());
app.use(bodyParser.json());

// MySQL database connection with mysql2
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'Peace$23', // Use your MySQL password here
  database: 'happytails'
});

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error('Error connecting to the database:', err);
    return;
  }
  console.log('Connected to the MySQL database');
});

// API to fetch health status by Pet ID
app.get('/pet-health/:petId', async (req, res) => {
  const petId = req.params.petId;
  const query = 'SELECT Health_status FROM Pets WHERE Pet_ID = ?';

  try {
    const [rows] = await db.promise().query(query, [petId]);
    if (rows.length > 0) {
      return res.json({ healthStatus: rows[0].Health_status });
    } else {
      return res.status(404).json({ error: 'Pet not found' });
    }
  } catch (err) {
    console.error('Error fetching health status:', err);
    return res.status(500).json({ error: 'Failed to fetch health status' });
  }
});

// API to update health status of a pet
app.put('/update-health/:petId', async (req, res) => {
  const petId = req.params.petId;
  const { healthStatus } = req.body;

  if (!healthStatus) {
    return res.status(400).json({ error: 'Health status is required' });
  }

  const query = 'UPDATE Pets SET Health_status = ?, last_update = NOW() WHERE Pet_ID = ?';

  try {
    const [result] = await db.promise().query(query, [healthStatus, petId]);

    if (result.affectedRows > 0) {
      return res.json({ message: 'Health status updated successfully' });
    } else {
      return res.status(404).json({ error: 'Pet not found' });
    }
  } catch (err) {
    console.error('Error updating health status:', err);
    return res.status(500).json({ error: 'Failed to update health status' });
  }
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
