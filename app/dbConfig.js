const Connection = require("tedious").Connection;
const Request = require("tedious").Request;

const config = {
  server: "DESKTOP-FV2UHJB",
  authentication: {
    type: "default",
    options: {
      userName: "marcoff",
      password: "martinmarcoff123@",
    },
  },
  options: {
    port: 1433,
    database: "messianicos",
    trustServerCertificate: true,
  },
};

const connection = new Connection(config);

connection.connect();

connection.on("connect", (err) => {
  if (err) {
    console.log("Error al conectarse a la base de datos");
    throw err;
  } else {
    console.log("Conectado a la base de datos"), executeStatement();
  }
});

function executeStatement() {
  const request = new Request("Goles_SelectAll", (err) => {
    if (err) {
      console.log("error en la llamada");
      throw err;
    } else {
      connection.close();
    }
  });
  request.on("row", (columns) => {
    console.log(columns);
  });
  connection.execSql(request);
}
