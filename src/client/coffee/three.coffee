@ready = ->
	scene = new THREE.Scene()
	camera = new THREE.PerspectiveCamera 75, window.innerWidth/window.innerHeight, 0.1, 1000

	renderer = new THREE.WebGLRenderer()
	renderer.setSize window.innerWidth, window.innerHeight
	document.body.appendChild renderer.domElement

	texture = THREE.ImageUtils.loadTexture('/img/isaac.jpg')
	geometry = new THREE.BoxGeometry(1,1,1)
	material = new THREE.MeshBasicMaterial map: texture

	cube = new THREE.Mesh geometry, material

	scene.add cube

	camera.position.z = 2

	render = ->
		requestAnimationFrame render

		cube.rotation.x += 0.02
		cube.rotation.y += 0.01

		renderer.render scene, camera
	
	setTimeout render, 300

	console.log 'onReady'
