fx_version 'cerulean'
game 'gta5'

author 'Dalton Life'
description 'Commands for chat - Dalton Life'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts {
    'server/**.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua',
    'client.lua',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
