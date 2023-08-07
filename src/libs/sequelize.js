const { Sequelize } = require('sequelize');
const config = require('../config');
const setupModels = require('../db/models');

if (config.isProd) {
  options.dialectOptions = {
    ssl: {
      rejectUnauthorized: false,
    }
  }
}

const sequelize = new Sequelize(config.dbName, config.dbUser, config.dbPassword, {
  dialect: 'mysql',
  // eslint-disable-next-line no-console
  logging: config.env === 'dev' ? console.log : false
}, options);

setupModels(sequelize);

module.exports = sequelize;
