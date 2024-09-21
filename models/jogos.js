module.exports = (sequelize, DataTypes) => {
  const Jogo = sequelize.define('Jogo', {
    id_jogo: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true
    },
    nome: {
      type: DataTypes.STRING,
      allowNull: false
    },
    genero_principal: {
      type: DataTypes.STRING,
      allowNull: false
    },
    desenvolvedor: {
      type: DataTypes.STRING,
      allowNull: false
    },
    estudio: {
      type: DataTypes.TEXT,
      allowNull: true
    },
    descricao: {
      type: DataTypes.STRING,
      allowNull: false
    },
    data_lanc: {
      type: DataTypes.DATE,
      allowNull: false
    },
    imagem: {
      type: DataTypes.STRING,  // Caminho da imagem no servidor
      allowNull: true
    }
  }, {
    tableName: 'jogo'
  });

  // Associação N:N através da tabela "Jogando"
  Jogo.associate = (models) => {
    Jogo.hasMany(models.Jogando, {
      foreignKey: 'id_jogo',
      as: 'jogando'
    });
  };

  return Jogo;
};
