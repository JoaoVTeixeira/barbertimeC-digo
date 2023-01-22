module.exports = function (app) {
    var inicial = app.controllers.inicial;
    app.get("/inicial", inicial.index);
};