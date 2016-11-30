// Exercise: Find the top navbar by query for the element type, which is <nav>.
document.getElementsByTagName('nav')[0];

// Exercise: Find the sidebar on the right by using it's id.
document.getElementById('sidebar-right');

// Exercise: Find the "Pages" and "Groups" sections of the sidebar by using their class.
document.getElementsByClassName('pages')[0];
document.getElementsByClassName('groups')[0];

// Exercise: Find all of the comments on the page.
document.getElementsByClassName('comments');

// Exercise: Find the first comment on the page.
document.getElementsByClassName('comments')[0];

// Exercise: Find the last comment on the page.
let comments = document.getElementsByClassName('comments');
comments[comments.length-1];

// Exercise: Find the fourth comment on the page.
comments[2].getElementsByClassName('panel')[0];

// Exercise: Find one of the ads in the sidebar and hide them.
let adSlot = document.getElementsByClassName('ad-slot')[0];
adSlot.style.visibility = 'hidden';

// Exercise: Set the visibility to the form that you hid in the previous step to make it visible again.
adSlot.style.visibility = 'visible';

// Exercise: Use setAttribute to change src attribute of one of the ads in the sidebar.
let adSlot = document.getElementsByClassName('ad-slot')[0];
image = adSlot.getElementsByTagName('img')[0]
image.setAttribute('src', 'https://placebear.com/200/300');

// Exercise: Find Sam's post and change it's text to something incredible.
samsPost = document.getElementsByClassName('post media')[3]
postText = samsPost.getElementsByTagName('p')[0]
postText.innerHTML = "JavaScript is awesome";

// Exercise: Find the first post and add the .post-liked class to it.
let post = document.getElementsByClassName('post media')[0];
post.className = post.className + ' post-liked'

// Exercise: Find the second post and remove the .post-liked class.
let post = document.getElementsByClassName('post media')[0];
post.classList.remove('post-liked');