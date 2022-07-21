fx_version 'cerulean'

games {"gta5"}

author "darkets#3908 & project-codex"
version '1.0.0'

lua54 'yes'

ui_page 'web/public/index.html'

shared_script 'shared/config.lua'

client_scripts {
  '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
  '@PolyZone/ComboZone.lua',
  "client/**/*"
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
  "server/**/*"
}

files {
  'web/public/index.html',
  'web/public/**/*'
}
