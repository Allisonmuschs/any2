const songUploadBtn = document.getElementById('song-upload')
const songUploadField = document.getElementById('song-upload-field')
songUploadBtn.addEventListener('click', (e) => {
  e.preventDefault()
  songUploadField.click()
})
