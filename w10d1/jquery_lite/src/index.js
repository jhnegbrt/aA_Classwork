import DOMNodeCollection from "../src/dom_node_collection"

window.$l = function(arg){


  if (arg instanceof HTMLElement){
    arg = [arg]
    return new DOMNodeCollection(arg)
  }


  let elementsArray = []

  if (typeof arg === 'string'){
    let elements = document.querySelectorAll(arg);
    elementsArray = Array.from(elements);
  }

  return new DOMNodeCollection(elementsArray);

}

