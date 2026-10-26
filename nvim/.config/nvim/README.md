# 🚀 Entorno de Desarrollo Neovim (Arquitectura Modular 2025)

Configuración profesional, modular y de ultra baja latencia diseñada para Arch Linux, priorizando el rendimiento asíncrono, la navegación semántica y la eficiencia impulsada por teclado.

---

## 🏗️ 1. Descripción General de la Arquitectura

La configuración separa las responsabilidades en múltiples archivos dentro de `~/.config/nvim/lua/` para garantizar mantenibilidad y depuración aislada:

*   `init.lua`: Punto de entrada principal que inicializa `lazy.nvim` y requiere los submódulos.
*   `lua/config/options.lua`: Opciones nativas de visualización y comportamiento (`vim.opt`).
*   `lua/config/keymaps.lua`: Centraliza los atajos de teclado globales.
*   `lua/config/autocmds.lua`: Automatizaciones de eventos del sistema (limpieza de espacios).
*   `lua/plugins/`: Directorio autónomo donde cada plugin gestiona su propia configuración.

---

## 🧩 2. Módulos y Plugins Integrados

| Plugin / Módulo | Descripción Técnica |
| :--- | :--- |
| **`lazy.nvim`** | Gestor de paquetes con soporte de carga diferida (*lazy loading*). |
| **`catppuccin`** | Tema visual de alta fidelidad con soporte completo para sintaxis semántica. |
| **`nvim-treesitter`** | Motor de análisis sintáctico abstracto (AST) para resaltado avanzado. |
| **`mason.nvim` & LSP** | Gestor de binarios independientes y puente nativo para `basedpyright`, `ruff`, `lua_ls`. |
| **`blink.cmp`** | Motor de autocompletado en Rust, con previsualización de firmas[cite: 1]. |
| **`snacks.nvim`** | Suite de utilidades de alto rendimiento (buscador difuso, notificaciones, LazyGit). |
| **`conform.nvim`** | Formateador asíncrono puro que ejecuta `ruff_format`, `ruff_fix` y `stylua`. |
| **`nvim-dap`** | Protocolo de Adaptador de Depuración con `debugpy` para inspección en vivo. |
| **`codecompanion.nvim`** | Asistente de inteligencia artificial contextual conectado a `copilot.lua`. |
| **`flash.nvim`** | Motor de movimiento espacial para teletransportar el cursor mediante etiquetas. |

---

## 📦 3. Dependencias de Sistema y Binarios

### Paquetes del Sistema Operativo (Arch Linux)
Ejecuta el siguiente comando en tu terminal para asegurar las herramientas base:
```bash
sudo pacman -S git neovim lazygit stylua base-devel
```

### Binarios gestionados por Mason dentro de Neovim 

Abre Neovim y ejecuta :Mason para verificar la instalación automática de:

   * basedpyright (LSP estricto para Python)   
   * ruff (Linter y formateador ultrarrápido en Rust)   
   * lua-language-server (lua_ls para Lua)   
   * debugpy (Depurador para Python)
   * stylua (Formateador para Lua)

## 4. Atajos de Teclado (Keymaps)

La tecla líder (<leader>) está mapeada a la Barra Espaciadora (<Space>).

### Navegación y Búsqueda

    <leader>ff: Abre el buscador de archivos instantáneo (Find Files).
    <leader>fg: Ejecuta búsqueda global de texto en el proyecto (Grep).
    s: Activa el salto espacial de Flash para mover el cursor a cualquier punto de la pantalla.
    S: Activa la selección semántica basada en Tree-sitter con Flash.

### Inteligencia y Semántica (LSP)
    
    <leader>gd: Salta inmediatamente a la definición de la función o variable bajo el cursor[cite: 2].
    <leader>ca: Despliega las acciones de código y refactorizaciones sugeridas[cite: 2].

### Control de Versiones e Inteligencia Artificial

    <leader>gg: Abre la interfaz flotante de LazyGit integrada.
    <leader>ai: Alterna el panel de chat lateral con la Inteligencia Artificial (CodeCompanion).

### Depuración (DAP)

    <leader>db: Inserta o remueve un punto de quiebre (Breakpoint) en la línea actual.
    <leader>dc: Inicia o continúa la ejecución del depurador hasta el siguiente punto de control.

