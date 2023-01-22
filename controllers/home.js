module.exports = function (app) 
{ var HomeController = {
            index: function (req, res) {
                    res.render("home");
                  },
            entrar: function (req, res) {
                    const db = require("../db");
                    console.log('conectou pela API'); 
                    let email = req.body.email;
                    let senha = req.body.senha;


                    // Ensure the input fields exists and are not empty
                    if (email && senha) {

                        let login = db.loginQuery(`SELECT * FROM cliente WHERE email = '${email}' AND senha_cliente = '${senha}'`,res)

                    } else {
                        res.send('Por favor entre com email e senha');
                        res.end();
                    }
               },
            cadastro: function(req, res){
                    res.redirect("/cadastro")
            }
    };
    return HomeController;
};