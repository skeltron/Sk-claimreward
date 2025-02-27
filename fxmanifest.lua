fx_version 'cerulean'
game 'gta5'

description 'sk-claimreward'

server_scripts {
    'server/*.lua'
}

client_script {
    'client/*.lua'
}

shared_script {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

files {
    'claimed.json'
}

lua54 'yes'
use_fxv2_oal 'yes'
