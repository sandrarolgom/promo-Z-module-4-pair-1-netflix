const express = require('express');
const cors = require('cors');
const mysql= require('mysql2/promise');

// create and config server
const server = express();
server.use(cors());
server.use(express.json());

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
    password: "Shanel9208", //PONER CONTRASEÑA PROPIA
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