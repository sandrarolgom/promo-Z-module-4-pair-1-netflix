const express = require('express');
const cors = require('cors');
const mysql= require('mysql2/promise');

// create and config server
const server = express();
server.use(cors());
server.use(express.json());
server.set("view engine", "ejs");

// init express aplication
const serverPort = 4000;
server.listen(serverPort, () => {
  console.log(`Server listening at http://localhost:${serverPort}`);
});

//crear conexión con la BD
async function connectDB(){
  const connection = await mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "Vertmysql21&", //PONER CONTRASEÑA PROPIA
    database: "netflix"
});
  await connection.connect();
  console.log(`se ha conectado con el id:${connection.threadId}`);
  return connection;
};

server.get("/movies", async(req, res)=>{
  const connectionDB= await connectDB();
  const sqlQuery="select * from movies";
  const [resultMovies]= await connectionDB.query(sqlQuery);
  //console.log(resultMovies);
  res.json({
    success: true,
    movies:  resultMovies
  });
});

//endpoint motor de plantillas
server.get("/movies/:id", async (req, res)=>{
  const conex = await connectDB();
  const idMovies = req.params.id;
  console.log(idMovies)
  const sql = "SELECT * FROM movies WHERE idMovies=?;";
  const [result] = await conex.query(sql, [idMovies])
  conex.end();
  res.render("movie", {movie:result[0]});
})

//endpoint para el signup



// Hacer un servidor de estaticos 
const staticServerPath = './src/public-react';
server.use(express.static(staticServerPath));