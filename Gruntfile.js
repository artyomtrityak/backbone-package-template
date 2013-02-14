module.exports = function(grunt) {
	grunt.initConfig({
		connect: {
			server: {
				options: {
					port: 8080,
					base: './app'
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
				src: ['app/**/*.coffee', 'tests/**/*.coffee', 'generators/**/*.coffee'],
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
				'app/**/*.coffee',
				'tests/**/*.coffee',
				'generators/**/*.coffee'
			],
			tasks: ['sass', 'coffee']
		}
	});

	//grunt.loadNpmTasks('grunt-contrib-less');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	grunt.loadNpmTasks('grunt-contrib-connect');
	grunt.loadNpmTasks('grunt-contrib-coffee');
	
	// Setip tasks
	grunt.registerTask('run', ['connect', 'watch']);
	grunt.registerTask('default', ['run']);
};
