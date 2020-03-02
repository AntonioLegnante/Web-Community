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

app.use(function(req,res){
    res.status(404).sendFile(path.join(__dirname, "public", "404.html"));
});
