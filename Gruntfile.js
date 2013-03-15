module.exports = function(grunt) {
	grunt.initConfig({
		coffee: {
			options: {
				bare: true
			},
			glob_to_multiple: {
				expand: true,
				cwd: '.',
				src: [
					'app/*.coffee',
					'app/**/*.coffee',
					'tests/**/*.coffee',
					'tests/*.coffee',
					'generators/**/*.coffee',
					'server/*.coffee'
				],
				dest: '.',
				ext: '.js'
			}
		},

		/*less: {
			all: {
				src: 'app/assets/less/*.less',
				dest: 'app/assets/css/all.css'
			}
		},*/

		sass: {
			options: {
				noCache: true
			},
			glob_to_multiple: {
				expand: true,
				cwd: 'app/assets/scss',
				src: ['*.scss', '*/**/*.scss'],
				dest: 'app/assets/css',
				ext: '.css'
			}
		},

		watch: {
			files: [
				'app/assets/scss/*.scss',
				'app/*.coffee',
				'app/**/*.coffee',
				'tests/**/*.coffee',
				'generators/**/*.coffee',
				'server/*.coffee'
			],
			tasks: ['sass', 'coffee', 'server']
		},

		testacular: {
			unit: {
				options: {
					configFile: 'tests/testacular-config.js'
				}
			}
		},
		server: {
			base: {
				port:8080,
				host: "localhost",
				staticFolder:"./app"
			}
		}

	});
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-testacular');
	grunt.registerMultiTask('server', 'run Server', function(){
		require("./server/server")(this.data, grunt);
	});

	// Setip tasks, wanch should be last
	grunt.registerTask('run', [ 'coffee', 'server', 'testacular', 'watch']);
	grunt.registerTask('default', ['run']);
};
