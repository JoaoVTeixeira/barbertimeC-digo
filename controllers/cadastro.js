module.exports = function (app) {
    var CadastroController = {
        index: function (req, res) {
            res.render("cadastro")},
        cadastrar: function (req, res) {
            (async () => {
                const db = require("../db");
                console.log('conectou pela API');                
       
                const nome = req.body.nome;
                const telefone = req.body.telefone;
                const email = req.body.email;
                const senha = req.body.senha;
                const status = 1;
                const cadastro = await db.execSQLQuery(`INSERT INTO cliente( nome, telefone, email, senha_cliente) VALUES ('${nome}','${telefone}','${email}','${senha}')`, res.redirect('..'));
            
            })(); }            
    };
    return CadastroController;
};


