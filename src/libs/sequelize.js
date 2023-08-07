const { Sequelize } = require('sequelize');
const config = require('../config');
const setupModels = require('../db/models');

const sequelize = new Sequelize(config.dbName, config.dbUser, config.dbPassword, {
  dialect: 'mysql',
  // eslint-disable-next-line no-console
  logging: console.log,
});

setupModels(sequelize);

module.exports = sequelize;
