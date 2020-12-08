module.exports = {
  production: {
    username: 'SEU_USUARIO',
    password: 'SUA_SENHA',
    database: 'SEU_BANCO_DE_DADOS',
    host: 'SEU_BANCO_DE_DADOS.windows.net',
    dialect: 'mssql',
    xuse_env_variable: 'DATABASE_URL',
    dialectOptions: {
      options: {
        encrypt: true
      }
    },
    pool: { 
      max: 5,
      min: 1,
      acquire: 5000,
      idle: 30000,
      connectTimeout: 5000
    }
  }
};
 
