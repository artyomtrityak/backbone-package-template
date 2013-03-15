express = require 'express'
path = require 'path'

module.exports = (options, grunt) ->
		app = express()

		app.use \
			express.static \
				path.join __dirname , '/../', options.staticFolder

		grunt.log.write(["Server ",options.host,":", options.port," started: "].join("")).ok()
		grunt.log.write(["Stacic folder ",options.staticFolder," is served "].join("")).ok()
		app.listen options.port
