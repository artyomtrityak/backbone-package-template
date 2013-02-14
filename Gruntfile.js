// Project configuration.

module.exports = function(grunt) {
	grunt.initConfig({
		/*less: {
			all: {
				src: 'app/assets/less/*.less',
				dest: 'app/assets/css/all.css'
			}
		},*/

		sass: {
			dist: {
				files: {
					'app/assets/css/main.css': 'app/assets/scss/*.scss'
				}
			}
		},

		watch: {
			files: ['app/assets/less/*.scss'],
			tasks: 'sass'
		}

	});

	//grunt.loadNpmTasks('grunt-contrib-less');
	grunt.loadNpmTasks('grunt-contrib-sass');
	grunt.loadNpmTasks('grunt-contrib-watch');
	
	grunt.registerTask('default', ['watch']);
};
