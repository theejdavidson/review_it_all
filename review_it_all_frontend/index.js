let userID = ""
  
function addLogInListener(){  //add listener to log in button
    let button = document.getElementById('login-button')
    button.addEventListener('click', (event) => {
      event.preventDefault()
      let doc = document.getElementById('form-signin')
      let username = document.getElementById('username').value

      while(doc.firstChild){ //clear log in form
        doc.removeChild(doc.firstChild)
      }

      logInUser(username)
    })
}

function logInUser(username){ //creates user account if new
    let config = {
      method: 'POST',
      headers: {'Accept': 'application/json',
            'Content-Type': 'application/json'},
      body: JSON.stringify({username: username})
    }
    let url = 'http://localhost:3000/review_it_all_api/users'
    fetch(url, config)
      .then(resp => resp.json())
      .then(data => {
        userID = data.id
        let username = data.username
        renderHomePage(username)
        })
}

function renderHomePage(username){ //renders homepage
    let welcome = document.getElementById('welcome-bar')
    welcome.textContent = `${username}`

    let div = document.getElementById('log-out')
    let button = document.createElement('button')
    button.classList.add('btn-primary')
    button.textContent = 'log out'

    button.addEventListener('click', (event) => {
      event.preventDefault()
      logoutUser()
    })
    div.appendChild(button)
}

function logoutUser(){ //clear current user global variables, load login
    userID = ""
    location.reload()
    addLogInListener()
}

function main() {
  addLogInListener()
}

main();