fx_version 'cerulean'
lua54 'yes'
game 'gta5'

author 'Puntzi'

version '1.1'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'server/server.lua'
}

shared_scripts {
    'configuration/config.lua',
    'configuration/language.lua',
    '@ox_lib/init.lua'
}
