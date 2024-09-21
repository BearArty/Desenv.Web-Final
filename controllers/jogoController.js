const fs = require('fs');
const path = require('path');
const { Jogo } = require('../models');

exports.getAddJogo = (req, res) => {
    res.render('addJogo');
  };

// Cadastrar um novo jogo com imagem (apenas para admin)
exports.postAddJogo = async (req, res) => {
  const { nome, genero_principal, desenvolvedor, estudio, descricao, data_lanc } = req.body;
  const imagem = req.file ? req.file.filename : null;  // Pega o nome do arquivo da imagem

  try {
    await Jogo.create({
      nome,
      genero_principal,
      desenvolvedor,
      estudio,
      descricao,
      data_lanc,
      imagem  // Armazena o nome do arquivo da imagem no banco de dados
    });
    res.redirect('/jogos?success=Jogo+cadastrado+com+sucesso');
  } catch (err) {
    console.error(err);
    res.redirect('/jogos?error=Erro+ao+cadastrar+jogo');
  }
};

// Visualizar todos os jogos (acessível para todos os usuários)
exports.getJogos = async (req, res) => {
    try {
      const jogos = await Jogo.findAll();
      res.render('jogos', { jogos });
    } catch (err) {
      console.error(err);
      res.render('jogos', { jogos: [], error: 'Erro ao buscar jogos' });
    }
};

exports.getEditJogo = async (req, res) => {
  const jogoId = req.params.id;
  try {
    const jogo = await Jogo.findByPk(jogoId);
    res.render('editJogo', { jogo });
  } catch (error) {
    console.error(error);
    res.render('/dashboard', { jogos: [], error: 'Erro ao carregar o jogo' });
  }
};

// Processar a edição do livro (apenas para admin)
exports.postEditJogo = async (req, res) => {
  const jogoId = req.params.id;
  const { nome, genero_principal, desenvolvedor, estudio, descricao, data_lanc } = req.body;
  
  try {
    // Buscar o livro original para acessar a imagem antiga
    const jogo = await Jogo.findByPk(jogoId);

    let novaImagem;
    if (req.file) {
      // Se houver uma nova imagem, use o nome da nova imagem
      novaImagem = req.file.filename;

      // Excluir a imagem antiga, se existir
      if (jogo.imagem) {
        const imagemAntiga = path.join(__dirname, '../uploads', jogo.imagem);
        fs.unlinkSync(imagemAntiga);  // Remove o arquivo de imagem antigo
      }
    } else {
      // Se nenhuma nova imagem for enviada, mantenha a imagem existente
      novaImagem = jogo.imagem;
    }

    // Atualizar os dados do livro no banco de dados
    await Jogo.update({ nome, genero_principal, desenvolvedor, estudio, descricao, data_lanc, imagem: novaImagem},
      { where: { id_jogo: jogoId } }
    );

    res.redirect(`/edit-jogo/${req.params.id}?successAlt=Jogo+atualizado+com+sucesso`);
  } catch (err) {
    console.error(err);
    res.redirect(`/edit-jogo/${req.params.id}?errorAlt=Erro+ao+atualizar+o+jogo`);
  }
};

// Excluir livro e a imagem associada (apenas para admin)
exports.deleteJogo = async (req, res) => {
  const jogoId = req.params.id;

  try {
    // Buscar o livro para acessar o caminho da imagem
    const jogo = await Jogo.findByPk(jogoId);

    // Excluir o livro do banco de dados
    await Jogo.destroy({ where: { id_jogo: jogoId } });

    // Excluir a imagem associada, se existir
    if (jogo.imagem) {
      const imagePath = path.join(__dirname, '../uploads', jogo.imagem);
      fs.unlinkSync(imagePath);  // Remove o arquivo de imagem
    }

    res.redirect('/jogos?successDel=Jogo+excluído+com+sucesso');
  } catch (err) {
    console.error(err);
    res.redirect('/jogos?errorDel=Erro+ao+excluir+o+jogo');
  }
};
