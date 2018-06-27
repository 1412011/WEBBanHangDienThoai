module.exports = (req, res, next) => {

    if (req.session.isLogged === true) {
        next();
    } else {
        res.redirect(`account/login?retUrl=${req.originalUrl}`);
    }
}


// OkPacket {
//   fieldCount: 0,
//   affectedRows: 1,
//   insertId: 6,
//   serverStatus: 2,
//   warningCount: 0,
//   message: '',
//   protocol41: true,
//   changedRows: 0 }
