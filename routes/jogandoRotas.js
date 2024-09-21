const express = require('express');
const router = express.Router();
const jogandoController = require('../controllers/jogandoController');
const checarAcesso = require('../middleware/checarAcesso');

// Rota para exibir o formulário "Obter Livro"
// Rota para processar o "Obter Livro"
router.get('/obter-jogo/:id', checarAcesso.isAuthenticated, jogandoController.getObterJogo);
router.post('/obter-jogo/:id', checarAcesso.isAuthenticated, jogandoController.postObterJogo);

// Rota para exibir o formulário de edição de status de leitura
// Rota para processar a edição do status de leitura
router.get('/editar-status/:id', checarAcesso.isAuthenticated, jogandoController.getEditarStatus);
router.post('/editar-status/:id', checarAcesso.isAuthenticated, jogandoController.postEditarStatus);

// Rota para o admin visualizar a tabela "Leitura"
router.get('/jogando', checarAcesso.isAdmin, jogandoController.getJogando);

module.exports = router;
