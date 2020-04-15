let userID = ""
const logInWrapper = document.getElementById('log-in-wrapper')
const logIn = document.getElementById('form-signin')
const logOut = document.getElementById('log-out')
const newUser = document.getElementById('new-user')
const newUserToggle = document.getElementById('new-user-toggle')

const renderLogin = () => {
  newUser.hidden = true
  logOut.hidden = true
  logInWrapper.hidden = false
}
  
const addLogInListener = () => {
    logIn.addEventListener('submit', event => {
      event.preventDefault()
      const username = document.getElementById('username').value
      logInUser(username)
      logIn.reset()
    })
}

const logInUser = username => {
    fetch('http://localhost:3000/users')
      .then(resp => resp.json())
      .then(users => {
        const currentUser = users.find(un => un.username == username)
          if(currentUser) {
            userID = currentUser.id
            renderHomePage(username)
          } else {
            //show error message
            console.log('username does not exist')
          }
        })
}

const addNewUserEventListener = () => {

  newUserToggle.addEventListener('click', event => {
    event.preventDefault()
    logIn.hidden = true;
    newUser.hidden = false;
    newUserToggle.hidden = true;
  })
  newUser.addEventListener('submit', event => {
    event.preventDefault()
    const username = document.getElementById('new-username').value
    createNewUser(username)
    logInUser(username)
  })
}

const createNewUser = username => {
  reqBody = {
    method: 'POST',
    headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      username: username
    })
  }
  fetch(`http://localhost:3000/users`, reqBody)
    .then(resp => resp.json())
    .then(json => console.log(json))
}

const renderHomePage = username => {
  let displayname = document.getElementById('displayname')
  displayname.textContent = `${username}`

  logInWrapper.hidden = true;
  logOut.hidden = false;
  addLogOutEventListener();
  //toDo: display username on welcome bar
  //toDo: create reviews show div
  fetchReviews()
}

const addLogOutEventListener = () => {
  logOut.addEventListener('click', event => {
    event.preventDefault()
    logOutUser()
  })
}

const logOutUser = () => { //clear current user global variables, load login
    userID = ""
    renderLogin()
}

const fetchReviews = () => {
  fetch('http://localhost:3000/reviews')
    .then(resp => resp.json())
    .then(reviewObjs => console.log(reviewObjs))
}

function main() {
  renderLogin()
  addLogInListener()
  addNewUserEventListener()
}

main();