module.exports = function(grunt) {

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
					cleanBowerDir: true,
				}
			}
		}
	});

	grunt.loadNpmTasks("grunt-supervisor");
	grunt.loadNpmTasks("grunt-bower-task");

	grunt.registerTask('start', 'Start the application', ['supervisor']);

	grunt.registerTask('postinstall','Run post install stuff', ['bower']);

	grunt.registerTask('check','Check if working',function() {
		grunt.log.writeln("Worked..");
	});
}

