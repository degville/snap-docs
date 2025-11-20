window.addEventListener('load', function() {
    const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.attributeName === "data-theme") {
                updateApiLink();
            }
        });
    });

    const body = document.querySelector('body');
    if (body) {
        observer.observe(body, {
            attributes: true
        });
    }

    function updateApiLink() {
        const theme = document.body.getAttribute('data-theme');
        const apiLink = document.getElementById('openapi-link');

        if (apiLink) {
            if (theme === 'dark') {
                apiLink.href = apiLink.href.replace('redoc-static.html', 'redoc-static-dark.html');
            } else {
                apiLink.href = apiLink.href.replace('redoc-static-dark.html', 'redoc-static.html');
            }
        }
    }

    updateApiLink();
});
