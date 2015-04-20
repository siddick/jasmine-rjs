var allTestFiles = [],
    TEST_REGEXP = /(spec|test)\.js$/i,
    files = window.__karma__.files,
    deps = [];

Object.keys(files).forEach(function(file) {
    if (TEST_REGEXP.test(file)) {
        allTestFiles.push(file);
    }
});

requirejs.config({
    baseUrl: '/assets'
});

if (files['/base/app/assets/javascripts/config.js']) {
    deps.push('config');
} else if (files['/base/app/assets/javascripts/application.js']) {
    deps.push('application');
}

require(deps, function () {
    require(allTestFiles, window.__karma__.start);
});
