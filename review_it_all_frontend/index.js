let userID = ""
const logInWrapper = document.getElementById('log-in-wrapper')
const logIn = document.getElementById('form-signin')
const displayName = document.getElementById('displayname')
const newUser = document.getElementById('new-user')
const newUserToggle = document.getElementById('new-user-toggle')
const reviewsWrapper = document.getElementById('reviews-wrapper')

const renderLogin = () => {
  newUser.hidden = true
  logInWrapper.hidden = false
  displayName.hidden = true
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
  logInWrapper.hidden = true;
  displayName.hidden = false;
  console.log(username)
  console.log(displayName)
  displayName.innerHTML = `${username} <button id='log-out'>log out</button>`
  addLogOutEventListener();
  //toDo: create reviews show div
  fetchReviews()
}

const addLogOutEventListener = () => {
  const logOut = document.getElementById('log-out')
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
    .then(reviewObjs => {
      reviewObjs.forEach(r => {
        displayReview(r.content, r.user_id, r.subject_id)
      })
    })
}

const displayReview = (content, userId, subjId) => {
  reviewsWrapper.innerHTML += '<h4></h4>'
}

function main() {
  renderLogin()
  addLogInListener()
  addNewUserEventListener()
}

main();



// -------------------------------DARK/LIGHT MODE TOGGLE------------------------------->
const toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');

function switchTheme (e) {
  if (e.target.checked) {
    document.documentElement.setAttribute('data-theme', 'dark');
    localStorage.setItem('theme', 'dark'); //add this
  }
  else {
    document.documentElement.setAttribute('data-theme', 'light');
    localStorage.setItem('theme', 'light'); //add this
  }    
}

toggleSwitch.addEventListener('change', switchTheme, false);

const currentTheme = localStorage.getItem('theme') ? localStorage.getItem('theme') : null;

if (currentTheme) {
  document.documentElement.setAttribute('data-theme', currentTheme);

  if (currentTheme === 'dark') {
    toggleSwitch.checked = true;
  }
}
// -------------------------------DARK/LIGHT MODE TOGGLE------------------------------->
