const { User, Jogando, Jogo } = require('../models');

// Exibir formulário de "Obter Jogo"
exports.getObterJogo = async (req, res) => {
  const jogoId = req.params.id;
  
  try {
    // Buscar informações do jogo - Renderizar formulário de status de jogando
    const jogo = await Jogo.findByPk(jogoId);
    res.render('obterJogo', { jogo });
  } catch (err) {
    console.error(err);
    res.redirect('/perfil?error=Erro+ao+carregar+o+jogo');
  }
};

// Processar "Obter jogo" e salvar status de jogando
exports.postObterJogo = async (req, res) => {
  const { status_jogo } = req.body;
  const jogoId = req.params.id;
  const userId = req.session.userId; // Pega o ID do usuário logado
  console.log(status_jogo);
  try {
    // Criar uma nova entrada na tabela "jogando"
    await Jogando.create({ id_usuario: userId, id_jogo: jogoId, status_jogo });

    res.redirect(`/obter-jogo/${req.params.id}?sucessObter=Jogo+obtido+com+sucesso`);
  } catch (err) {
    console.error(err);
    res.redirect(`/obter-jogo/${req.params.id}?errorObter=Erro+ao+obter+o+jogo`);
  }
};

// Exibir formulário de edição de status de jogatina
exports.getEditarStatus = async (req, res) => {
  const jogoId = req.params.id;
  const userId = req.session.userId;

  try {
    // Buscar a jogatina existente
    const jogo = await Jogo.findOne({ where: { id_jogo: jogoId } });
    const jogando = await Jogando.findOne({ where: { id_jogo: jogoId, id_usuario: userId } });

    // Renderizar a página com o formulário de edição de status
    res.render('editarStatus', { jogando, jogo });
  } catch (error) {
    console.error(error);
    res.redirect('/perfil?error=Erro+ao+carregar+status+de+jogando');
  }
};

// Processar atualização do status de leitura
exports.postEditarStatus = async (req, res) => {
  const jogoId = req.params.id;
  const userId = req.session.userId;
  const { status_jogo } = req.body;

  try {
    // Atualizar o status de leitura
    await Jogando.update(
      { status_jogo },
      { where: { id_jogo: jogoId, id_usuario: userId } }
    );

res.redirect(`/editar-status/${req.params.id}?sucessAttStatus=Status+de+jogando+atualizado`);
  } catch (err) {
    console.error(err);
    res.redirect(`/editar-status/${req.params.id}?errorAttStatus=Erro+ao+atualizar+status+de+jogando`);
  }
};

// Visualizar a tabela "Leitura" (apenas admin)
exports.getJogando = async (req, res) => {
  try {
    // Buscar todas as entradas da tabela "Leitura" com informações de usuários e livros
    const gaming = await Jogando.findAll({
      include: [
        { model: User, as: 'usuario' },
        { model: Jogo, as: 'jogo' }
      ]
    });

    // Renderizar a página de visualização de leituras(gaming)
    res.render('jogandoAdmin', { gaming });
  } catch (err) {
    console.error(err);
    res.redirect('/dashboard?error=Erro+ao+carregar+informações+de+jogando');
  }
};