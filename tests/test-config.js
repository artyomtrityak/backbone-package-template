require({
    // Testacular serves files from '/base'
    baseUrl: '/base',
    paths: {
        text: 'app/assets/js/text'
    },
    deps: ['text']
}, ['app/assets/js/t1'], function(v1) {
    window.__testacular__.start();

    console.log('12zzz3');
    console.log(v1);
});