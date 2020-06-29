const server = window.location.origin

function hideAllPages() {
	document
		.querySelectorAll('article.page')
		.forEach((elem) => (elem.style.display = 'none'))
}

function loadParticles() {
	particlesJS.load('particles-js', '../assets/particles.json', function () {
		if (localStorage.getItem('user')) {
			loadFeedPage()
		} else {
			loadLoginPage()
		}
	})
}

const loadLoginPage = () => {
	hideAllPages()
	document.querySelector('#login').style.display = 'block'
}

const loginParent = () => {
	let submitBtn = document.querySelector(`input[type='submit']`)

	submitBtn.value = '...'

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

	fetch(`${server}/parents/login`, requestOptions)
		.then((response) => response.json())
		.then((result) => {
			if (result.failure || result.status.failure) {
				submitBtn.value = 'Log In'
				let error = result.failure
					? result.failure.reason
					: result.status.failure
				setErrorMsg(error)
			} else {
				localStorage.setItem('user', JSON.stringify(result.user))
				loadFeedPage()
			}
		})
		.catch((error) => setErrorMsg(error))
}

const loadFeedPage = () => {
	let loginPage = document.querySelector('#login')
	let feedsPage = document.querySelector('#feeds')

	loginPage.style.display = 'none'
	feedsPage.style.display = 'block'

	populateFeedPage()
}

const populateFeedPage = () => {
	const user = JSON.parse(localStorage.getItem('user'))

	document.querySelectorAll('#parent-name').forEach((elem) => {
		elem.innerText = `${user.firstName} ${user.lastName}`
	})

	let childBox = document.querySelector('.child-box')
	user.data.forEach((obj) => {
		let elem = childBox.cloneNode(true)

		elem.cameraId = obj.camera.cameraId
		elem.addEventListener('click', loadVideoPlayer)
		elem.querySelectorAll('p')[0].innerText = obj.ward.wardFirstName
		elem.querySelectorAll(
			'p'
		)[1].innerText = `${obj.classroom.className} Class`
		elem.querySelectorAll(
			'p'
		)[2].innerText = `${obj.teacher.teacherFirstName} ${obj.teacher.teacherLastName}`
		elem.querySelector('a').href = `tel:${obj.teacher.teacherContact}`

		childBox.parentElement.appendChild(elem)
	})
	childBox.style.display = 'none'
}

const setErrorMsg = (msg) => {
	let errorMsg = document.querySelector('#errorMsg')
	errorMsg.innerText = msg
	errorMsg.style.display = 'block'
	setTimeout(() => {
		errorMsg.className = 'animate__animated animate__flipOutX'
	}, 2000)
	setTimeout(() => {
		errorMsg.style.display = 'none'
		errorMsg.className = 'animate__animated animate__flipInX'
	}, 3000)
}

const logout = () => {
	localStorage.removeItem('user')
	document.cookie =
		'cookiename=godseye.lash; expires = Thu, 01 Jan 1970 00:00:00 GMT'
	hideAllPages()
	loadLoginPage()
}

const loadVideoPlayer = (event) => {
	if (!(event.target.tagName == 'A' || event.target.tagName == 'I')) {
		let card = event.target.closest('.child-box')
		let cameraId = card.cameraId
		let image = document.querySelector('#video > img')

		hideAllPages()
		let videoPlayer = document.querySelector('#player')

		let childrenBox = document.querySelector('#children-box')

		let newConveyor = childrenBox.cloneNode(true)

		newConveyor.className += ' video'

		console.log(newConveyor)

		videoPlayer.appendChild(newConveyor)

		videoPlayer.style.display = 'block'

		image.onerror = (err) => {
			console.log(err)
		}

		image.src = `${server}/parents/feed/${cameraId}`
	}
}
