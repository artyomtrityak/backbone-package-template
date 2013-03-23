var path = require('path');
var lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet;

var folderMount = function folderMount(connect, point) {
	return connect.static(path.resolve(point));
};

var folderDir = function folderDir(connect, point){
	return connect.directory(path.resolve(point));
};

module.exports = function(grunt) {
	grunt.initConfig({
		connect: {
			server: {
				options: {
					port: 8080,
					base: './app',
					// livereload awesomeness
					middleware: function(connect, options){
						return [
						lrSnippet,
						folderMount(connect, './app'),
						folderDir(connect, './app')];
					}
				}
			}
		},

		coffee: {
			options: {
				bare: true
			},
			glob_to_multiple: {
				expand: true,
				cwd: '.',
				src: [
					'app/**/*.coffee',
					'tests/**/*.coffee',
					'generators/**/*.coffee'
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

		regarde: {
			coffee: {
				files: [
					'app/*.coffee',
					'app/**/*.coffee',
					'tests/**/*.coffee',
					'generators/**/*.coffee',
					'server/*.coffee'
				],
				tasks: ['coffee', 'livereload']
			},
			scss: {
				files: [
					'app/assets/scss/*.scss'
				],
				tasks: ['sass', 'livereload']
			},
			html: {
				files: [
					'app/**/*.html'
				],
				tasks: ['livereload']
			}
		},

		testacular: {
			unit: {
				options: {
					configFile: 'tests/testacular-config.js'
				}
			}
		}

	});
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-connect');
	grunt.loadNpmTasks('grunt-regarde');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	grunt.loadNpmTasks('grunt-testacular');
	grunt.loadNpmTasks('grunt-contrib-livereload');

	// Setip tasks, wanch should be last
	grunt.registerTask('run', [ 'coffee', 'connect', 'livereload-start', 'testacular', 'regarde']);
	grunt.registerTask('default', ['run']);
};
