const jwt = require('jsonwebtoken');

module.exports = function(req, res, next) {
  const token = req.header('Authorization')?.split(' ')[1]; // Format: Bearer token
  if (!token) return res.status(401).json({ message: 'Accès refusé 🔴. Aucun token fourni.' });

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded; // { _id, username }
    next();
  } catch (err) {
    res.status(400).json({ message: 'Token invalide 🔴' });
  }
};
