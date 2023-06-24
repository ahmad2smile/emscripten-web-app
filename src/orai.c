#include <emscripten.h>

EM_JS(void, render_dom, (char* x), {
    var jsStr = Module.UTF8ToString(x);

    // NOTE: Not supported in Firefox, behind flag
    document.body.setHTML(jsStr);
    // NOTE: Would be faster as it doesn't snitize
    // document.body.innerHTML = jsStr;
    console.log("Html to be rendered:", jsStr);
});

struct Component {
    char* view;
};

struct Component createComponent() {
    struct Component component;
    component.view = "<h1>Hello World</h1>";

    return component;
}

EMSCRIPTEN_KEEPALIVE
int renderer() {
    struct Component component = createComponent();

    render_dom(component.view);

    return 0;
}