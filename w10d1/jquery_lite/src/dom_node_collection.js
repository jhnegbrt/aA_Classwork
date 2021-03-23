export default class DOMNodeCollection{

  constructor(array){
    this.elements = array
  }

  html(string){
    if(!(string === undefined)){
      for (let i = 0; i < this.elements.length; i++){
        this.elements[i].innerHTML = string
      }
    } else {
      return this.elements[0].innerHTML
    }
  }

  empty(){
    for (let i = 0; i < this.elements.length; i++){
      this.elements[i].innerHTML = ""
    }
  }

  append(arg){

    if (arg instanceof DOMNodeCollection){

    } else {
      for (let i = 0; i < this.elements.length; i++){
        this.elements[i].innerHTML += arg
      }
    }

  }
}