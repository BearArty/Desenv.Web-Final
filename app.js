const express = require("express");
const session = require("express-session");
const app = express();
const PATH = 3000;

const userRotas = require("./routes/userRotas");
const jogoRotas = require('./routes/jogoRotas');
const jogandoRotas = require('./routes/jogandoRotas');

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: false }))

// Definir a Pasta Public para arquivos estáticos
app.use(express.static("public"));
app.use('/uploads', express.static('uploads'));  // Pasta para servir imagens enviada

app.use(session({ 
    secret: "senai456",
    resave: false,
    saveUninitialized: false
}));

// Utilizar rotas de acesso do usuário
app.use(userRotas);
app.use(jogoRotas);
app.use(jogandoRotas);

app.listen(PATH, () => {
    console.log(`Servidor rodando em http://localhost:${PATH}`);
});
