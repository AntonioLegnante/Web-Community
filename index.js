const express = require("express");
const path = require("path");
const ejs = require("ejs");
const sqlite3 = require("sqlite3");
const app = express();

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

const db = new sqlite3.Database("eventi.db", function(err){
    app.listen(3000);
});

app.get("/", function(req,res){
    const sql = ("SELECT titolo, luogo, dataevento, provincia FROM Eventi;");
    db.all(sql, function(err, rows){
        console.log(rows);
        res.render("index", {diocane:rows});
    });
});

app.get("/registrazione", function(req,res){
    res.render("Registrazione");
});

app.post("/rig", function(req,res){
    const sql = ("INSERT INTO Utenti (Nickname, Nome, Cognome, email, provincia) VALUES (?, ?, ?, ?, ?);"
    db.run(sql, [req.body.Nickname, req.body.Cognome, req.body.pass], function(){
        res.redirect("/");
    });
});
app.use(function(req,res){
    res.status(404).sendFile(path.join(__dirname, "public", "404.html"));
});
