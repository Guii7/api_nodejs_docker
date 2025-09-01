// index.js

const express = require('express');
const app = express();
const port = 3000;

// Middleware para permitir que o Express entenda JSON no corpo das requisições
app.use(express.json());

// Rota de exemplo (GET)
app.get('/', (req, res) => {
  res.send('Teste API Node.js com Docker!');
});

// Rota que retorna um JSON com alguns dados
app.get('/usuarios', (req, res) => {
  const usuarios = [
    { id: 1, nome: 'Guilherme' },
    { id: 2, nome: 'Jayne' },
    { id: 3, nome: 'Bernardo' }
  ];
  res.json(usuarios);
});

// Rota que recebe dados via POST
app.post('/usuarios', (req, res) => {
  const novoUsuario = req.body;
  console.log('Novo usuário recebido:', novoUsuario);
  res.status(201).json({
    mensagem: 'Usuário criado com sucesso!',
    usuario: novoUsuario
  });
});

// Inicia o servidor
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
