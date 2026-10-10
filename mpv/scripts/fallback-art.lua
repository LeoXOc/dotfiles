-- Script para cargar una imagen por defecto si el audio no tiene portada
mp.register_event("file-loaded", function()
    -- Verificamos si el archivo tiene pista de video (las portadas cuentan como video en mpv)
    local has_video = mp.get_property("vid") ~= "no"
    local has_audio = mp.get_property("aid") ~= "no"

    -- Si tiene audio pero NO tiene video/portada...
    if has_audio and not has_video then
        -- '~~/' le dice a mpv que busque en su carpeta de configuración (~/.config/mpv/)
        local fallback_image = mp.command_native({"expand-path", "~~/cover.webp"})
        
        -- Añadimos la imagen como una pista de video
        mp.commandv("video-add", fallback_image)
    end
end)
