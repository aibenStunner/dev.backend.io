const loginParent = () => {
	let email = document.querySelector('#email').value
	let password = document.querySelector('#password').value

	var urlencoded = new URLSearchParams()
	urlencoded.append('email', email)
	urlencoded.append('password', password)

	var requestOptions = {
		method: 'POST',
		body: urlencoded,
		redirect: 'follow',
	}

	fetch(`/parents/login`, requestOptions)
		.then((response) => response.json())
		.then((result) => {
			console.log(result.user)

			localStorage.setItem('user', JSON.stringify(result.user))
			window.location.href = '/feeds.html'
		})
		.catch((error) => console.log('error', error))
}

const populateCameras = () => {
	let container = document.querySelector('#camera-select')
	JSON.parse(localStorage.getItem('user')).cameraData.forEach((camObj) => {
		let elem = document.createElement('div')
		elem.setAttribute('cameraId', camObj.cameraId)
		elem.className = 'camera-card'

		let thumbnail = document.createElement('div')
		thumbnail.className = 'thumbnail'

		let caption = document.createElement('div')

		let childName = document.createElement('p')
		childName.innerText = `${camObj.wardFirstName}'s Class`

		let cameraName = document.createElement('p')

		cameraName.innerText = `${camObj.camera_name}`

		caption.append(childName)
		caption.append(cameraName)

		elem.append(thumbnail)
		elem.append(caption)

		elem.addEventListener('click', (ev) => {
			document.querySelectorAll('.camera-card').forEach((element) => {
				element.className = 'camera-card'
			})
			let card = ev.target.closest('.camera-card')

			card.className = 'camera-card selected'
			beginStream(card.getAttribute('cameraId'))
		})
		container.append(elem)
	})
}

const beginStream = (cameraId) => {
	document.querySelector('#video-player > p').style.display = 'none'
	document.querySelector('#video-player > #spinner').style.display = 'block'

	let src = `/parents/feed/${cameraId}`
	let image = document.querySelector('#video-player > img')
	image.src = src
	image.onload = () => {
		image.style.display = 'block'
		document.querySelector('#video-player > #spinner').style.display =
			'none'
	}
	image.onerror = () => {
		image.style.display = 'none'
		document.querySelector('#video-player > p').innerText =
			'Streaming Error: Camera Unavailable'
		document.querySelector('#video-player > p').style.display = 'block'
	}
}
