#include <emscripten.h>
#include "components.h"
#include "renderer.h"

EM_JS(void, renderHtml, (char *x), {
    var jsStr = Module.UTF8ToString(x);

    // NOTE: Not supported in Firefox, behind flag
    document.body.setHTML(jsStr);
    // NOTE: Would be faster as it doesn't snitize
    // document.body.innerHTML = jsStr;
    console.log("Html to be rendered:", jsStr);
});

EMSCRIPTEN_KEEPALIVE
void renderDom(Component *component)
{
    renderHtml(component->view);
}