initStats = ->
	stats = new Stats()
	stats.setMode 0
	stats.domElement.style.position = 'absolute'
	stats.domElement.style.left = '0px'
	stats.domElement.style.top= '0px'

	document.body.appendChild stats.domElement

	stats


@ready = ->
	scene = new THREE.Scene()
	camera = new THREE.PerspectiveCamera 45, window.innerWidth/window.innerHeight, 0.1, 1000

	renderer = new THREE.WebGLRenderer()
	renderer.setClearColor 0xeeeeee, 1
	renderer.setSize window.innerWidth, window.innerHeight
	renderer.shadowMapEnabled = true

	#axes = new THREE.AxisHelper 20
	#scene.add axes
	
	isaacTexture = THREE.ImageUtils.loadTexture '/img/isaac.jpg', null, ->
		plane = new THREE.Mesh(
			new THREE.PlaneGeometry 60, 20, 1, 1
			new THREE.MeshLambertMaterial color: 0xcccccc
		)

		plane.receiveShadow = true

		plane.rotation.x=-0.5*Math.PI

		plane.position.set 15, 0, 0

		scene.add plane

		cube = new THREE.Mesh(
			new THREE.BoxGeometry 4, 4, 4
			new THREE.MeshLambertMaterial map: isaacTexture #color: 0xff0000
		)

		cube.castShadow = true

		cube.rotation.x = .5 * Math.PI
		cube.position.set -4, 3, 0
		
		scene.add cube

		sphere = new THREE.Mesh(
			new THREE.SphereGeometry 4, 20, 20
			new THREE.MeshPhongMaterial color: 0x7777ff
		)

		sphere.castShadow = true

		sphere.position.set 20, 4, 2
		scene.add sphere

		spotLight = new THREE.SpotLight 0xffffff
		spotLight.position.set -40, 60, -10
		spotLight.castShadow = true
		scene.add spotLight

		scene.add new THREE.AmbientLight 0x0b0b0b

		camera.position.set -30, 40, 30
		camera.lookAt scene.position

		document.body.appendChild renderer.domElement
		stats = initStats()

		step = 0
		render = ->
			stats.update()
			requestAnimationFrame render

			step += .04
			sphere.position.y = 2 + ( 10 * Math.abs(Math.cos(step)) )

			cube.rotation.z += 0.02

			renderer.render scene, camera
		setTimeout render, 300


