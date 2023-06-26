#include <stdio.h>
#include <emscripten.h>
#include "lib/components.h"
#include "lib/renderer.h"

EMSCRIPTEN_KEEPALIVE
void clickHandler()
{
    EM_ASM(console.log('Hello from C!'););
}

Component createComponent()
{
    Component component;
    component.view = "<h1>Hello World</h1><button onclick=\"Module._clickHandler()\">Click</button>";

    return component;
}

EMSCRIPTEN_KEEPALIVE
int orai()
{
    Component component = createComponent();

    renderDom(&component);

    return 0;
}