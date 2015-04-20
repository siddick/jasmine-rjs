var path = require('path'),
    configFile = process.env.CONFIG_FILE,
    port = process.env.JASMINE_PORT || 8888;
    rjsConfigFile = path.join(__dirname, "rjs-config.js"),
    configDir = configFile ? path.dirname(configFile) : process.cwd();

module.exports = function(config) {
    if (configFile) {
        require(configFile)(config);
    }

    config.set({
        basePath: path.resolve(configDir, config.basePath || '')
    });

    if (config.proxies['/assets'] === undefined) {
        config.proxies['/assets'] = 'http://localhost:' + port + '/assets';
    }

    if (config.browsers.length === 0) {
        config.browsers.push('PhantomJS');
    }

    if (config.frameworks.length === 0) {
        config.frameworks.push('jasmine');
        config.frameworks.push('requirejs');
    }

    config.files.push(rjsConfigFile);
    config.files.push({pattern: 'spec/javascripts/**/*Spec.js', included: false});
    config.files.push({pattern: 'app/assets/javascripts/**/*.js', included: false});
};
