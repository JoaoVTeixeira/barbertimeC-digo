module.exports = {execSQLQuery,loginQuery}

const mysql = require('mysql2');
const connection = mysql.createConnection({
  host     : 'localhost',
  port     : 3306,
  user     : 'root',
  password : '',
  database : 'barbearia'
});

async function connect(){
    if(global.connection && global.connection.state !== 'disconnected')
        return global.connection;
    
    const mysql = require("mysql2/promise");
    const connection = await mysql.createConnection("mysql://root@localhost:3306/barbearia");
    console.log("Conectou no MySQL!");
    global.connection = connection;
    return connection;
}

function execSQLQuery(sqlQry, res){

  connection.query(sqlQry, (error, results, fields) => {
      /*if(error) 
        res.json(error);
      else
        res.json(results);*/
      connection.end();
      console.log('executou a API');
  });
}

function loginQuery(sqlQry, res){
  connection.query(sqlQry, function(error, results, fields) {
    // If there is an issue with the query, output the error
    if (error) throw error;
    // If the account exists
    if (results.length > 0) {
        res.redirect('/inicial');
    } else {
        res.send('Incorrect Username and/or Password!');
    }			
    res.end();
});
}
 


/*
async function execSQLQuery(sqlQry, res){

    //const mysql = require("mysql2/promise");
    //const connection = await mysql.createConnection("mysql://root@localhost:3306/casalista");
    const connection = await connect();

    /*connection.query(sql, (error, response) => {
      if (error) throw error;
      console.log("Response: ", response);
  });

    connection.query(sqlQry, (error, results) => {      
        if(error) 
          res.json(error);
        else
        res.json(results);
        connection.end();        
    });


    connection.query(sqlQry, (error, results))
        .then((data) => {
          res.json(results);
        }).catch(error);

  }*/


function addRows(conn){
  const sql = "INSERT INTO presentes(Nome,Valor,StatusCPF) VALUES ?";
  const values = [
        ['teste1', '12345678901', 1],
        ['teste1', '09876543210', 1],
        ['teste3', '12312312399', 1]
      ];

  conn.query(sql, [values], (error, results, fields) => {
          if(error) return console.log(error);
          console.log('adicionou registros!');
          conn.end();//fecha a conexão
      });
}