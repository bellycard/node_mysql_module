# wrapper around the mysql module
# https://github.com/felixge/node-mysql
settings = require 'node_settings_module'
mysql = require 'mysql'

# setup a connection pool
pool = mysql.createPool 
  host            : settings.get("mysql").host
  user            : settings.get("mysql").user
  password        : settings.get("mysql").password
  database        : settings.get("mysql").database
  connectionLimit : settings.get("mysql").connectionLimit

exports.query = (sql, callback) ->
  # get a connection off the pool
  pool.getConnection (error, connection) ->

    # error was detected on connecting
    return callback(error) if error

    connection.query sql, (error, rows) ->

      # error was detected on connecting
      return callback(error) if error

      # query succeeded, fire the callback with the rows data
      callback(null, rows)

      # send the connection back to the pool
      connection.end() 

