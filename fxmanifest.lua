fx_version 'cerulean'
game 'gta5'

description 'sk-claimreward'

lua54 'yes'
use_fxv2_oal 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

server_scripts {
    'server/*.lua'
}

client_scripts {
    'client/*.lua'
}

files {
    'claimed.json'
}
