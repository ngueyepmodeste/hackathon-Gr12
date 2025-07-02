const mongoose = require('mongoose');
const bcrypt = require('bcrypt');

const studentSchema = new mongoose.Schema({
    f_name: { type: String, required: true },
    l_name: { type: String, required: true },
    username: {
        type: String,
        required: true,
        unique: true,
        default: function () {
            const lastName = this.l_name ? this.l_name.split(' ').pop() : '';
            const randomNum = Math.floor(Math.random() * 9000) + 1000; // generer un numero aleatoire de 4 chiffres
            //   return `${lastName}_${randomNum}`;
            return `${lastName}${randomNum}`;
        }
    },
    avatar_url: String,
    email: { type: String, required: true, unique: true },
    school: { type: String, required: true },
    major: { type: String, required: true },
    major_year: { type: String, required: true },
    password: { type: String, required: true, minlength: 8 },
}, { timestamps: true });

// Hash password
studentSchema.pre('save', async function (next) {
    if (!this.isModified('password')) return next();
    try {
        const salt = await bcrypt.genSalt(10);
        this.password = await bcrypt.hash(this.password, salt);
        next();
    } catch (err) {
        next(err);
    }
});

module.exports = mongoose.model('Students', studentSchema);
