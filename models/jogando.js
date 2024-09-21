module.exports = (sequelize, DataTypes) => {
    const Jogando = sequelize.define('Jogando', {
      id_jogando: {
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
      },
      id_usuario: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: 'usuario', // Nome da tabela de usuario
          key: 'id_usuario'
        }
      },
      id_jogo: {
        type: DataTypes.INTEGER,
        allowNull: false,
        references: {
          model: 'jogo', // Nome da tabela de jogo
          key: 'id_jogo'
        }
      },
      status_jogo: {
        type: DataTypes.ENUM('Não iniciado', 'Em andamento', 'Concluído'),
        allowNull: false
      }
    }, { tableName: 'jogando' });

    // Associação com Usuário
    Jogando.associate = (models) => {
      Jogando.belongsTo(models.User, {
        foreignKey: 'id_usuario',
        as: 'usuario'
      });

      // Associação com jogo
      Jogando.belongsTo(models.Jogo, {
        foreignKey: 'id_jogo',
        as: 'jogo'
      });
    };
  
    return Jogando;

  };
