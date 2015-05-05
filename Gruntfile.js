module.exports = function(grunt) {

    grunt.loadNpmTasks('grunt-bower-task');

    grunt.initConfig({
        dir: {
            src: 'public',
            dest: 'dist',
        },
        pkg: grunt.file.readJSON('package.json'),
        bower: {
            install: {
                options: {
                    targetDir: '<%= dir.src %>/vendor',
                    layout: 'byComponent',
                    cleanTargetDir: true
                }
            }
        }
    });

    grunt.registerTask('default', ['bower:install']);

}
