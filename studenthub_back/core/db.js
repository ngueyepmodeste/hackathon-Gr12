const mongoose = require('mongoose');

const connectDB = async () => {
  try {
    await mongoose.connect('mongodb://mongo:27017/studenthub', {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('🟢 Connexion à MongoDB réussie');
  } catch (err) {
    console.error('🔴 Erreur de connexion MongoDB :', err);
    process.exit(1);
  }
};

module.exports = connectDB;
