module.exports = function (app) {
    var InicialController = {
        index: function (req, res) {
            res.render("inicial")}            
    };
    return InicialController;
};

