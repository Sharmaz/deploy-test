require('dotenv').config();
const env = process.env.NODE_ENV || 'dev';

const envs = {
  'dev': '.env',
  'test': 'env.test',
}

const options = {};

if (envs[env]) {
  options.path = envs[env];
}

require('dotenv').config(options);

const config = {
  env,
  isProd: process.env.NODE_ENV === 'production',
  port: process.env.PORT || 3005,
  dbUser: process.env.DB_USER,
  dbPassword: process.env.DB_PASSWORD,
  dbHost: process.env.DB_HOST,
  dbName: process.env.DB_NAME,
  dbPort: process.env.DB_PORT,
}

module.exports = config;
