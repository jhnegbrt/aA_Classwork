const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(dogs) {
  return Object.keys(dogs).map((key) => {
    const atag = document.createElement("a");
    atag.innerHTML = key;
    atag.href = dogs[key];
    const li = document.createElement("li");
    li.classList.add("dog-link");
    li.appendChild(atag);
    return li;
  });
};

let list = document.querySelector(".drop-down-dog-list");

function attachDogLinks() {
  let doglinks = dogLinkCreator(dogs);
  doglinks.forEach( li => {
    list.appendChild(li);
  });
};

attachDogLinks();

let button = document.querySelector(".drop-down-dog-nav")

function handleEnter(){
  button.addEventListener('mouseover', ()=>{
    list.classList.toggle("drop-down-dog-list-show")
  })
  // list.addEventListener('mouseover', ()=>{
  //   list.classList.toggle("drop-down-dog-list-show")
  // })

}

function handleExit(){
  button.addEventListener('mouseout', ()=>{
    list.classList.toggle("drop-down-dog-list-show")
  })
  // list.addEventListener('mouseout', ()=>{
  //   list.classList.toggle("drop-down-dog-list-show")
  // })

}

handleExit();

handleEnter();

// attachDogLinks();