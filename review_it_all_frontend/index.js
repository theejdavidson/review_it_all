let userID = ""
const logInWrapper = document.getElementById('log-in-wrapper')
const logIn = document.getElementById('form-signin')
const displayName = document.getElementById('displayname')
const newUser = document.getElementById('new-user')
const newUserToggle = document.getElementById('new-user-toggle')
const reviewsWrapper = document.getElementById('reviews-wrapper')
const newReviewWrapper = document.getElementById('new-review-wrapper')
const newReviewForm = document.getElementById('new-review-form')
const writeReviewBtn = document.getElementById('write-review')


const renderLogin = () => {
  newUser.hidden = true
  writeReviewBtn.hidden = true
  logInWrapper.hidden = false
  displayName.hidden = true
  newReviewWrapper.hidden = true
  reviewsWrapper.hidden = true
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
  logInWrapper.hidden = true
  displayName.hidden = false
  reviewsWrapper.hidden = false
  writeReviewBtn.hidden = false
  displayName.innerHTML = `${username} <button id='log-out' class="btn">log out</button>`
  addLogOutEventListener();
  fetchReviews()
}

const addLogOutEventListener = () => {
const logOut = document.getElementById('log-out')
  logOut.addEventListener('click', event => {
    event.preventDefault()
    logOutUser()
  })
}

const addWriteReviewEventListener = () => {
  writeReviewBtn.addEventListener('click', event => {
    event.preventDefault()
    newReviewWrapper.hidden = false
    reviewsWrapper.hidden = true
  })
}

const addNewReviewFormEventListener = () => {
  newReviewForm.addEventListener('submit', event => {
    event.preventDefault()
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

const displayReview = async(content, userId, subjId) => {
  const userName = await fetchUsername(userId)
  const subject = await fetchSubject(subjId)
  reviewsWrapper.innerHTML += `<div class='review'><h3 class="subject-placement">${subject.name}</h3><h4 class="name-placement">@${userName}</h4>
  <p>${content}</p><p class="category-placement">${subject.category}</p></div>`
}

const fetchUsername = async(userId) => {
  return fetch(`http://localhost:3000/users/${userId}`)
    .then(resp => resp.json())
    .then(userObj => userObj.username)
}

const fetchSubject = async(subjId) => {
  return fetch(`http://localhost:3000/subjects/${subjId}`)
    .then(resp => resp.json())
    .then(subjObj => subjObj)
}

function main() {
  renderLogin()
  addLogInListener()
  addNewUserEventListener()
  addWriteReviewEventListener()
  addNewReviewFormEventListener()
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

// --------------------------------SCROLL TO TOP BUTTON-------------------------------->
mybutton = document.getElementById("myBtn");

window.onscroll = function() {scrollFunction()};

function scrollFunction() {
  if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
    mybutton.style.display = "block";
  } else {
    mybutton.style.display = "none";
  }
}

function topFunction() {
  document.documentElement.scrollTop = 0;
}
// --------------------------------SCROLL TO TOP BUTTON-------------------------------->
