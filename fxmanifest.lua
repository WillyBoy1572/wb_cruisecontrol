fx_version 'cerulean'
lua54 'yes'
game 'gta5'

name         'wb_cruisecontrol'
author       'WillyBoy'
version      '1.0.0'
repository   'https://github.com/WillyBoy1572/wb_cruisecontrol'

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
