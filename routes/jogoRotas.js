const express = require('express');
const router = express.Router();
const jogoController = require('../controllers/jogoController');
const checarAcesso = require('../middleware/checarAcesso');
const upload = require('../middleware/upload');

// Rota para exibir o formulário de cadastro de jogos (apenas admin)
router.get('/add-jogo', checarAcesso.isAdmin, jogoController.getAddJogo);

// Rota para cadastrar um jogo com upload de imagem (apenas admin)
router.post('/add-jogo', checarAcesso.isAdmin, upload.single('imagem'), jogoController.postAddJogo);

// Rota para exibir o formulário de edição do jogo (apenas admin)
router.get('/edit-jogo/:id', checarAcesso.isAdmin, jogoController.getEditJogo);

// Rota para cadastrar um jogo com upload de imagem (apenas admin)
router.post('/edit-jogo/:id', checarAcesso.isAdmin, upload.single('imagem'), jogoController.postEditJogo);

// Rota para visualizar todos os jogos (acessível para todos)
router.get('/jogos', checarAcesso.isAuthenticated, jogoController.getJogos);

// Rota para excluir um jogo (apenas admin)
router.post('/delete-jogo/:id', checarAcesso.isAdmin, jogoController.deleteJogo);

module.exports = router;