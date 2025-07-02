const express = require('express');
const app = express();
const PORT = 3000;
const connectDB = require('./core/db');
const dotenv = require('dotenv');

dotenv.config();

connectDB();

// Middleware pour parser le JSON
app.use(express.json());

// Exemple de route GET simple
app.get('/', (req, res) => {
    res.send('service backend');
});

// Import des routes
const authRoutes = require('./routes/auth.routes');
const studentRoutes = require('./routes/students.routes');

// Utilisation des routes
app.use('/api/auth', authRoutes);      // pour create-account et log-in
app.use('/api/students', studentRoutes); // pour get, put, etc.

app.listen(PORT, () => {
    console.log(`Serveur démarré sur http://localhost:${PORT}`);
});
