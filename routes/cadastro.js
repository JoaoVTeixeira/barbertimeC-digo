const cadastro = require("../controllers/cadastro");

module.exports = function (app) {
    var cadastro = app.controllers.cadastro;
    app.get("/cadastro", cadastro.index);
    app.post("/cadastrar", cadastro.cadastrar);
    
};
