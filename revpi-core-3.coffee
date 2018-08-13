deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'revpi-core-3'
	aliases: [ 'revpi-core-3' ]
	name: 'Revolution Pi Core 3'
	arch: 'armv7hf'
	state: 'released'
	isDefault: true

	instructions: commonImg.instructions
	gettingStartedLink:
		windows: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		osx: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
		linux: 'https://docs.resin.io/raspberrypi3/nodejs/getting-started/#adding-your-first-device'
	supportsBlink: true

	options: [ networkOptions.group ]

	yocto:
		machine: 'revpi-core-3'
		image: 'resin-image'
		fstype: 'resinos-img'
		version: 'yocto-sumo'
		deployArtifact: 'resin-image-revpi-core-3.resinos-img'
		compressed: true

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
