node_mysql_module
==================

A module to wrap the mysql client and apply our settings.  We share this between node projects.

### Installation

Add to your dependencies in package.json, with a reference to this repository

```JAVASCRIPT
"dependencies": {
  "node_mysql_module": "git://github.com/bellycard/node_mysql_module.git#v0.0.2"
}
```

### Usage

```JAVASCRIPT
mysql = require('node_mysql_module')
mysql.query "select * from users limit 1", (error, result) ->
  console.log(result)
```

### Settings

```JSON
// settings.json
{
  "development": {
    "mysql" : {
      "host" : "localhost",
      "user" : "root",
      "password" : "password",
      "database" : "database-name",
      "connectionLimit" : 15
    }
  }
}
```

### Development

Source files are written in coffee, and compiled into JavaScript.  To watch the src directory and compile js into the add directory
```
coffee -c -b -w -o app/ src/
```
