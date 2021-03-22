
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  const el = document.createElement("p");
  el.innerHTML = string;
  let children = Array.from(htmlElement.children)
  if (children.length  === 0){
    htmlElement.appendChild(el);
  } else {
    htmlElement.removeChild(htmlElement.firstChild);
    htmlElement.appendChild(el);
  };
};

htmlGenerator('Party Time.', partyHeader);

// htmlGenerator('Party time.', partyHeader);


  
