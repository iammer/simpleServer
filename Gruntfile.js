module.exports = function(grunt) {
	var nodeBin=__dirname + '/node_modules/.bin/';

	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),
		supervisor: {
			target: {
				script: "index.coffee",
				options: {
					watch: ['src', 'index.coffee'],
					extensions: ['coffee'],
					ignore: ['src/client'],
					exec: [ nodeBin + 'coffee']
				}
			}
		},
		bower: {
			install: {
				options: {
					targetDir: './bower',
					cleanTargetDir: true,
					cleanBowerDir: true
				}
			}
		}
	});

	grunt.loadNpmTasks("grunt-supervisor");
	grunt.loadNpmTasks("grunt-bower-task");

	grunt.registerTask('start', 'Start the application', ['supervisor']);

	grunt.registerTask('postinstall','Run post install stuff', ['bower']);
}

